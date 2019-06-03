package co.b4pay.admin.controller.merchant;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;

import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.BankCardInformation;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.Merchant;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.AgencyService;
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

    @Autowired
    private AgencyService agencyService;



    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions(value = "bankCradAdd:list")
    public String list(Model model, @PageAttribute Page<BankCardInformation> page){
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();

        if (roleIds.contains("1")){
            model.addAttribute(bankCardInformationService.findPage(page));
        } else if (StringUtil.isNotBlank(agencyId)){
            Params params = page.getParams();
            if (params == null){
                params = Params.create("merchantId",agencyId);
            } else {
                params.put("merchantId", agencyId);
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

        //获取代理ID
        String agencyId = LoginHelper.getLoginAgencyId();
        //String merchantId = merchantIds.substring(0, merchantIds.length() - 1);
        BankCardInformation bankCardInformation = new BankCardInformation();
        bankCardInformation.setMerchantId(agencyId);
        bankCardInformation.setBankName(bankName);
        bankCardInformation.setAccountType(Integer.valueOf(accountType).intValue());
        bankCardInformation.setBankMark(bankMark.trim());
        bankCardInformation.setCardNo(cardNo.trim());
        bankCardInformation.setCustomerName(customerName.trim());
        bankCardInformation.setPhoneNum(phoneNum.trim());
        bankCardInformation.setStatus(1);
        if (StringUtil.isNoneBlank(bankCardInformation.getBankName())){
            bankCardInformationService.save(bankCardInformation);
        } else {
            return "new/bankCradAdd";
        }

        return "redirect:/bankCradAdd/list";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("bankCradAdd:add")
    public String add(Model model){
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
