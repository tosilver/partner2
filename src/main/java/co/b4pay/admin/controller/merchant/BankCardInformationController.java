package co.b4pay.admin.controller.merchant;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;

import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.BankCardInformation;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.Merchant;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.BankCardInformationService;
import co.b4pay.admin.service.MerchantService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.math.BigInteger;
import java.util.List;


@Controller
@RequestMapping("/bankCradAdd")
public class BankCardInformationController extends BaseController {

    /**
     * 日志对象
     */
    private Logger logger = LoggerFactory.getLogger(BankCardInformationController.class);

    @Autowired
    private BankCardInformationService bankCardInformationService;

    @Autowired
    private MerchantService merchantService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions(value = "bankCradAdd:list")
    public String list(Model model, @PageAttribute Page<BankCardInformation> page){
        String merchantIds = LoginHelper.getMerchantIds();
        String roleIds = LoginHelper.getRoleIds();

        if (roleIds.contains("1")){
            model.addAttribute(bankCardInformationService.findPage(page));
        } else if (StringUtil.isNotBlank(merchantIds)){
            Params params = page.getParams();
            if (params == null){
                params = Params.create("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            } else {
                params.put("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            }
            page.setParams(params);
            model.addAttribute(bankCardInformationService.findPage(page));
        }
//        model.addAttribute("merchantList", merchantService.findList());
        return "new/bankCradList";
    }

    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions(value = "bankCradAdd:save")
    public String save(RedirectAttributes redirectAttributes, String accountType, String bankName, String cardNo, String bankMark, String customerName, String phoneNum){

        //获取商户ID
        String merchantIds = LoginHelper.getMerchantIds();
        String merchantId = merchantIds.substring(0, merchantIds.length() - 1);

        BankCardInformation bankCardInformation = new BankCardInformation();
        bankCardInformation.setMerchantId(merchantId);
        bankCardInformation.setBankName(bankName);
        bankCardInformation.setAccountType(Integer.valueOf(accountType).intValue());
        bankCardInformation.setBankMark(bankMark.trim());
        bankCardInformation.setCardNo(cardNo.trim());
        bankCardInformation.setCustomerName(customerName.trim());
        bankCardInformation.setPhoneNum(phoneNum.trim());
        bankCardInformation.setStatus(1);

        if (StringUtil.isNoneBlank(bankCardInformation.getBankName())){
            int count = bankCardInformationService.save(bankCardInformation);

        } else {
            return "new/bankCradAdd";
        }

        return "redirect:/bankCradAdd/list";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("bankCradAdd:add")
    public String add(Model model){
        String merchantIds = LoginHelper.getMerchantIds();
        String merchantId = merchantIds.substring(0, merchantIds.length() - 1);
        Merchant merchant = merchantService.get(merchantId);
        model.addAttribute("merchant",merchant);

        return "new/bankCradAdd";
    }

    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {
        if (bankCardInformationService.updateStatus(id, status) > 0) {
            addMessage(redirectAttributes, "更改状态成功");
        } else {
            addMessage(redirectAttributes, "状态更改失败");
        }
        return "redirect:/bankCradAdd/list";
    }
}
