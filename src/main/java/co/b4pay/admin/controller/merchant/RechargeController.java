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
    private QRChannelService qrChannelService;

    @Autowired
    private MerchantService merchantService;

    @Autowired
    private BankCardInformationService bankCardInformationService;

    @RequestMapping(value = "list",method = RequestMethod.GET)
    @RequiresPermissions("recharge:list")
    public String list(Model model, @PageAttribute Page<Recharge> page) {
        String merchantIds = LoginHelper.getMerchantIds();
        String roleIds = LoginHelper.getRoleIds();

        String merid = LoginHelper.getMerchantIds();
        //System.out.println("merid是："+merid);
        QRChannel qrChannel= qrChannelService.findByMerchantId(merid);
//        System.out.println("qrChannel获取表pool的信息："+qrChannel.getRechargeAmount());
//        System.out.println("qrChannel获取表pool的信息："+qrChannel.getFrozenCapitalPool());
//        model.addAttribute("amount",qrChannel.getRechargeAmount());
//        model.addAttribute("pool",qrChannel.getFrozenCapitalPool());



        if (roleIds.contains("1")) {   //如果拥有超级管理员权限
            model.addAttribute("page", rechargeService.findPage(page));
        } else if (StringUtil.isNoneBlank(merchantIds)) {    //如果不是超级管理员则只查询个人交易记录信息
            Params params = page.getParams();
            if (null == params) {
                params = Params.create("merchantIds", merchantIds.substring(0, merchantIds.length() - 1));
            } else {
                params.put("merchantIds", merchantIds.substring(0, merchantIds.length() - 1));
            }
            page.setParams(params);
            model.addAttribute("page", rechargeService.findPage(page));
        }
        model.addAttribute("merchantList", merchantService.findList());
        return "new/rechargeList";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("recharge:save")
    public String save(String merchantName,String amount,String bankCardId) {
        //获取登录的商户id
        String merchantIds = LoginHelper.getMerchantIds();
        String merchantId = merchantIds.substring(0, merchantIds.length() - 1);
        Merchant merchant = merchantService.get(merchantId);
        BankCardInformation bankCardInformation = bankCardInformationService.get(bankCardId);
        //生成订单号
        Calendar calendar = Calendar.getInstance();
        String tradeNo = String.format("%s%s", DateUtil.dateToStr(calendar.getTime(), DateUtil.YMdhmsS_noSpli), RandomStringUtils.randomNumeric(15));
        Recharge recharge = new Recharge();
        recharge.setAmount(new BigDecimal(amount));
        recharge.setBankName(bankCardInformation.getBankName());
        recharge.setCardNo(bankCardInformation.getCardNo());
        recharge.setCustomerName(bankCardInformation.getCustomerName());
        recharge.setTradeNo(tradeNo);
        recharge.setMerchantId(merchantId);
        recharge.setMerchantCompany(merchant.getCompany());
        recharge.setStatus(0);
        rechargeService.save(recharge);
        return "redirect:/recharge/list";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("recharge:add")
    public String add(Model model) {
        String merchantIds = LoginHelper.getMerchantIds();
        String merchantId = merchantIds.substring(0, merchantIds.length() - 1);


        String merid = LoginHelper.getMerchantIds();
        //System.out.println("merid是："+merid);
       /* QRChannel qrChannel= qrChannelService.findByMerchantId(merid);*/
//        System.out.println("qrChannel获取表pool的信息："+qrChannel.getRechargeAmount());
//        System.out.println("qrChannel获取表pool的信息："+qrChannel.getFrozenCapitalPool());
//        model.addAttribute("amount",qrChannel.getRechargeAmount());
//        model.addAttribute("pool",qrChannel.getFrozenCapitalPool());


        //List<MallAddress> mallAddressList = mallAddressService.findByMerchantId(merchantId);
        //model.addAttribute("mallAddressList", mallAddressList);
        List<BankCardInformation> bankCardlist = bankCardInformationService.findList();
        Merchant merchant = merchantService.get(merchantId);
        model.addAttribute("merchant",merchant);
        model.addAttribute("bankCardlist",bankCardlist);
        return "new/recharge";
    }
}
