package co.b4pay.admin.controller.merchant;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.*;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.*;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.List;

/**
 * 充值Controller
 * Created by john on 2018/4/26.
 */
@Controller
@RequestMapping("/recharge")
public class RechargeController extends BaseController {
    /**
     * 日志对象
     */
    private Logger logger = LoggerFactory.getLogger(RechargeController.class);

    @Autowired
    private RechargeService rechargeService;

    @Autowired
    private MerchantService merchantService;

    @Autowired
    private BankCardInformationService bankCardInformationService;

    @Autowired
    private AgencyService agencyService;

    @Autowired
    private QRChannelService qrChannelService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("recharge:list")
    public String list(Model model, @PageAttribute Page<Recharge> page) {
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();
        //如果拥有码商权限
        if (roleIds.contains("6")) {
            if (StringUtil.isNotBlank(agencyId)) {
                Params params = page.getParams();
                if (null == params) {
                    params = Params.create("merchantId", agencyId);
                } else {
                    params.put("merchantId", agencyId);
                }
                page.setParams(params);
                Page<Recharge> pageList = rechargeService.findPage(page);
                model.addAttribute("page", pageList);
            }
        }
        return "new/rechargeList";
    }

    @RequestMapping(value = "AgencyList", method = RequestMethod.GET)
    @RequiresPermissions("recharge:list")
    public String AgencyList(Model model, @PageAttribute Page<Recharge> page) {
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();
        //如果拥有码商权限
        if (roleIds.contains("6")) {
            if (StringUtil.isNotBlank(agencyId)) {
                Params params = page.getParams();
                if (null == params) {
                    params = Params.create("approveId", agencyId);
                } else {
                    params.put("approveId", agencyId);
                }
                page.setParams(params);
                Page<Recharge> pageList = rechargeService.findPage(page);
                model.addAttribute("page", pageList);
            }
        }
        return "new/AgencyRechargeList";
    }



    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("recharge:save")
    public String save(String merchantName, String amount, String bankCardId) {
        //获取登录的代理id
        String agencyId = LoginHelper.getLoginAgencyId();
        BigDecimal money = new BigDecimal(amount);
        //获取代理
        Agency agency = agencyService.get(agencyId);
        //获取上级费率和到账金额
        BigDecimal superiorContribution = agency.getSuperiorContribution();
        BigDecimal SM = rechargeService.rate2Money(superiorContribution, money);
        //获取上上级的费率
        BigDecimal grandfatherContribution = agency.getGrandfatherContribution();
        BigDecimal GM = rechargeService.rate2Money(grandfatherContribution, money);
        //获取上上上级费率
        BigDecimal greatGrandfatherContribution = agency.getGreatGrandfatherContribution();
        BigDecimal GGM = rechargeService.rate2Money(greatGrandfatherContribution, money);
        //获取银行卡账户信息
        BankCardInformation bankCardInformation = bankCardInformationService.get(bankCardId);
        //生成订单号
        Calendar calendar = Calendar.getInstance();
        String tradeNo = String.format("%s%s", DateUtil.dateToStr(calendar.getTime(), DateUtil.YMdhmsS_noSpli), RandomStringUtils.randomNumeric(15));
        //新建充值订单
        Recharge recharge = new Recharge();
        recharge.setAmount(money);
        recharge.setBankName(bankCardInformation.getBankName());
        recharge.setCardNo(bankCardInformation.getCardNo());
        recharge.setCustomerName(bankCardInformation.getCustomerName());
        recharge.setTradeNo(tradeNo);
        recharge.setMerchantId(agencyId);
        recharge.setMerchantCompany(agency.getCompany());
        recharge.setSuperiorAmount(SM);
        recharge.setGrandfatherAmount(GM);
        recharge.setGreatGrandfatherAmount(GGM);
        recharge.setStatus(0);
        rechargeService.save(recharge);
        return "redirect:/recharge/list";
    }


    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("recharge:add")
    public String add(Model model) {
        String agencyId = LoginHelper.getLoginAgencyId();
        List<BankCardInformation> bankCardlist = bankCardInformationService.findListByID(agencyId);
        Agency agency = agencyService.get(agencyId);
        QRChannel qrChannel = qrChannelService.findByMerchantId(agencyId);
        model.addAttribute("qrchannel",qrChannel);
        model.addAttribute("agency", agency);
        model.addAttribute("bankCardlist", bankCardlist);
        return "new/recharge";
    }


    /**
     * 审批充值
     */
    @RequiresPermissions("recharge:updateStatus")
    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {

        try {
            Recharge recharge = rechargeService.get(id);
            Integer status1 = recharge.getStatus();
            if (status1 == 0) {
                int i = rechargeService.updateStatus(id, status);
                String merchantId = recharge.getMerchantId();
                System.out.println("商户id为" + merchantId);
                if (i == 1) {
                    System.out.println("审批成功!");
                    addMessage(redirectAttributes, "申请审批成功");
                } else {
                    System.out.println("审批失败!");
                    addMessage(redirectAttributes, "申请审核失败");
                }
            }else{
                addErrorMessage(redirectAttributes,"申请已被审批过");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            addErrorMessage(redirectAttributes, "申请审批失败!!!");
        }
        return "redirect:/recharge/list";
    }


}
