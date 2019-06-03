package co.b4pay.admin.controller.partner;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.system.entity.Admin;
import co.b4pay.admin.common.system.service.AdminService;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.Agency;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.QRChannel;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.AgencyService;
import co.b4pay.admin.service.MallAddressService;
import co.b4pay.admin.service.QRChannelService;
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
import java.util.List;

/**
 * 渠道 Controller
 * Created by john on 2018/4/27.
 */
@Controller
@RequestMapping("QRChannel")
public class QRChannelController extends BaseController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(QRChannelController.class);

    @Autowired
    private QRChannelService qrChannelService;

    @Autowired
    private AgencyService agencyService;

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("QRChannel:list")
    public String list(Model model, @PageAttribute Page<QRChannel> page) {
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();
        if (roleIds.contains("6")) {
         if (StringUtil.isNoneBlank(agencyId)) {
             Params params = page.getParams();
             if (null == params) {
                 params = Params.create("merchantId", agencyId);
             } else {
                 params.put("merchantId",agencyId);
             }
             page.setParams(params);
             //查询旗下是否有代理,有代理才显示新增通道
             int num = agencyService.findBySuperiorIdToNum(Long.parseLong(agencyId));
             model.addAttribute("page", qrChannelService.findPage(page));
             model.addAttribute("num", num);
         }
        }
        return "new/balance";
    }

    @RequestMapping("form")
    @RequiresPermissions("QRChannel:form")
    public String form(Model model, String id) {
        if (StringUtil.isNoneBlank(id)) {
            model.addAttribute("malladdress", qrChannelService.get(id));
        }
        return "channel/malladdressForm";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("QRChannel:add")
    public String add(Model model) {
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();
        if (roleIds.contains("6")) {
            List<Agency> agencyList = agencyService.findBySuperiorId(Long.parseLong(agencyId));
            model.addAttribute("agencyList",agencyList);
            return "new/QRChannelAdd";
        }else {
            return "redirect:/QRChannel/list";
        }
    }


    @RequestMapping(value = "save", method = RequestMethod.GET)
    @RequiresPermissions(value = "QRChannel:save")
    public String save(RedirectAttributes redirectAttributes,String name,String merchantId,String rate ) {
        QRChannel qrChannel = qrChannelService.findByMerchantId(merchantId);
        if (qrChannel != null){
            addErrorMessage(redirectAttributes, "代理通道已经存在，请勿重复添加");
            return "redirect:/QRChannel/list";
        }else {
            QRChannel qrChannel1 = new QRChannel();
            qrChannel1.setName(name);
            qrChannel1.setMerchantId(merchantId);
            qrChannel1.setRate(new BigDecimal(rate));
            qrChannel1.setTurnover(new BigDecimal(0.00));
            //由于只读属性,金额为0.0需转换如下字段才能保存成功
            qrChannel1.setRechargeAmount(new BigDecimal(0.00));
            qrChannel1.setFrozenCapitalPool(new BigDecimal(0.00));
            //设置状态为停用
            qrChannel1.setStatus(0);
            qrChannelService.save(qrChannel1);
            Admin admin = adminService.findByAgencyId(merchantId);
            admin.setStatus(1);
            adminService.update(admin);
            return "redirect:/QRChannel/list";
        }
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(RedirectAttributes redirectAttributes, String id) {
        if (qrChannelService.delete(id) > 0) {
            addMessage(redirectAttributes, "商城禁用成功");
        } else {
            addMessage(redirectAttributes, "商城禁用失败");
        }
        return "redirect:/QRChannel/list";
    }

    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {
        if (qrChannelService.updateStatus(id, status) > 0) {
            addMessage(redirectAttributes, "更改状态成功");
        } else {
            addMessage(redirectAttributes, "状态更改失败");
        }
        return "redirect:/trade/list";
    }

    /**
     * 清空充值金额
     * @param redirectAttributes
     * @param id
     * @param rechargeAmount
     * @return
     */
    @RequestMapping(value = "updateRechargeAmount", method = RequestMethod.GET)
    @RequiresPermissions(value = "QRChannel:updateRechargeAmount")
    public String updateRechargeAmount(RedirectAttributes redirectAttributes, String id, String rechargeAmount) {
        BigDecimal rechargeAmountDecimal = new BigDecimal(rechargeAmount);
        int i = qrChannelService.updateRechargeAmount(id, rechargeAmountDecimal);
        if (i > 0) {
            if (Integer.valueOf(rechargeAmount).intValue() == 0) {
                addMessage(redirectAttributes, "已清空");
            } else {
                addMessage(redirectAttributes, "充值成功");
            }
        } else {
            addErrorMessage(redirectAttributes, "充值失败,请联系管理员!");
        }
        return "redirect:/QRChannel/list";
    }

    /**
     * 清空冻结资金池
     * @param redirectAttributes
     * @param id
     * @param frozenCapitalPool
     * @return
     */
    @RequestMapping(value = "updateFrozenCapitalPool", method = RequestMethod.GET)
    @RequiresPermissions(value = "QRChannel:updateFrozenCapitalPool")
    public String updateFrozenCapitalPool(RedirectAttributes redirectAttributes, String id, String frozenCapitalPool) {
        BigDecimal bigDecimal = new BigDecimal(frozenCapitalPool);
        int i = qrChannelService.updateFrozenCapitalPool(id, bigDecimal);
        if (i > 0) {
                addMessage(redirectAttributes, "已清空");
        } else {
            addErrorMessage(redirectAttributes, "清空失败,请联系管理员!");
        }
        return "redirect:/QRChannel/list";
    }


    @RequestMapping(value = "updateRate", method = RequestMethod.GET)
    @RequiresPermissions(value = "QRChannel:updateRate")
    public String updateRate(RedirectAttributes redirectAttributes, String id, String rate) {
        BigDecimal rateDecimal = new BigDecimal(rate);
        int i = qrChannelService.updateRate(id, rateDecimal);
        if (i > 0) {
                addMessage(redirectAttributes, "修改成功");

        } else {
            addErrorMessage(redirectAttributes, "修改失败,请联系管理员!");
        }
        return "redirect:/QRChannel/list";
    }


}
