package co.b4pay.admin.controller.partner;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.system.entity.Admin;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.MallAddressService;
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
@RequestMapping("malladdress")
public class MallAddressController extends BaseController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(MallAddressController.class);

    @Autowired
    private MallAddressService mallAddressService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("malladdress:list")
    public String list(Model model, @PageAttribute Page<MallAddress> page) {
        String merchantIds = LoginHelper.getMerchantIds();
        String roleIds = LoginHelper.getRoleIds();
        if (roleIds.contains("1")) {   //如果拥有超级管理员权限
            model.addAttribute("page", mallAddressService.findPage(page));
        } else if (StringUtil.isNoneBlank(merchantIds)) {    //如果不是超级管理员则只查询个人交易记录信息
            Params params = page.getParams();
            if (null == params) {
                params = Params.create("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            } else {
                params.put("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            }
            page.setParams(params);
            model.addAttribute("page", mallAddressService.findPage(page));
        }
        return "new/balance1";
    }

    @RequestMapping("form")
    @RequiresPermissions("malladdress:form")
    public String form(Model model, String id) {
        if (StringUtil.isNoneBlank(id)) {
            model.addAttribute("malladdress", mallAddressService.get(id));
        }
        return "channel/malladdressForm";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions(value = "malladdress:save")
    public String save(RedirectAttributes redirectAttributes, MallAddress mallAddress) {
        if (StringUtil.isBlank(mallAddress.getId())) {
            int isExists = mallAddressService.findByMallName(mallAddress.getMallName());
            if (isExists > 0) {
                addErrorMessage(redirectAttributes, "商城地址已经存在，请勿重复添加");
                return "redirect:/malladdress/list";
            }else {
                System.out.println("我进来了");
                //由于只读属性,金额为0.0需转换如下字段才能保存成功
                mallAddress.setRechargeAmount(new BigDecimal(0.00));
                mallAddress.setFrozenCapitalPool(new BigDecimal(0.00));
                mallAddress.setRate(new BigDecimal(0.00));
                //设置状态为停用
                mallAddress.setStatus(0);
                mallAddressService.save(mallAddress);
            }
        } else {
            mallAddressService.update(mallAddress);
        }
        return "redirect:/malladdress/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(RedirectAttributes redirectAttributes, String id) {
        if (mallAddressService.delete(id) > 0) {
            addMessage(redirectAttributes, "商城禁用成功");
        } else {
            addMessage(redirectAttributes, "商城禁用失败");
        }
        return "redirect:/malladdress/list";
    }

    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {
        if (mallAddressService.updateStatus(id, status) > 0) {
            addMessage(redirectAttributes, "更改状态成功");
        } else {
            addMessage(redirectAttributes, "状态更改失败");
        }
        return "redirect:/malladdress/list";
    }

    /**
     * 清空充值金额
     * @param redirectAttributes
     * @param id
     * @param rechargeAmount
     * @return
     */
    @RequestMapping(value = "updateRechargeAmount", method = RequestMethod.GET)
    @RequiresPermissions(value = "malladdress:updateRechargeAmount")
    public String updateRechargeAmount(RedirectAttributes redirectAttributes, String id, String rechargeAmount) {
        BigDecimal rechargeAmountDecimal = new BigDecimal(rechargeAmount);
        int i = mallAddressService.updateRechargeAmount(id, rechargeAmountDecimal);
        if (i > 0) {
            if (Integer.valueOf(rechargeAmount).intValue() == 0) {
                addMessage(redirectAttributes, "已清空");
            } else {
                addMessage(redirectAttributes, "充值成功");
            }
        } else {
            addErrorMessage(redirectAttributes, "充值失败,请联系管理员!");
        }
        return "redirect:/malladdress/list";
    }

    /**
     * 清空冻结资金池
     * @param redirectAttributes
     * @param id
     * @param frozenCapitalPool
     * @return
     */
    @RequestMapping(value = "updateFrozenCapitalPool", method = RequestMethod.GET)
    @RequiresPermissions(value = "malladdress:updateFrozenCapitalPool")
    public String updateFrozenCapitalPool(RedirectAttributes redirectAttributes, String id, String frozenCapitalPool) {
        BigDecimal bigDecimal = new BigDecimal(frozenCapitalPool);
        int i = mallAddressService.updateFrozenCapitalPool(id, bigDecimal);
        if (i > 0) {
                addMessage(redirectAttributes, "已清空");
        } else {
            addErrorMessage(redirectAttributes, "清空失败,请联系管理员!");
        }
        return "redirect:/malladdress/list";
    }


    @RequestMapping(value = "updateRate", method = RequestMethod.GET)
    @RequiresPermissions(value = "malladdress:updateRate")
    public String updateRate(RedirectAttributes redirectAttributes, String id, String rate) {
        BigDecimal rateDecimal = new BigDecimal(rate);
        int i = mallAddressService.updateRate(id, rateDecimal);
        if (i > 0) {
                addMessage(redirectAttributes, "修改成功");

        } else {
            addErrorMessage(redirectAttributes, "修改失败,请联系管理员!");
        }
        return "redirect:/malladdress/list";
    }


}
