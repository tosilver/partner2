package co.b4pay.admin.controller.merchant;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.system.entity.Admin;
import co.b4pay.admin.common.system.service.AdminService;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.entity.Agency;
import co.b4pay.admin.entity.QRChannel;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.AgencyService;
import co.b4pay.admin.service.MerchantRateService;
import co.b4pay.admin.service.MerchantService;
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

import java.util.ArrayList;
import java.util.List;

/**
 * 代理 Controller
 * Created by john on 2018/4/23.
 */
@Controller
@RequestMapping("Agency")
public class AgencyController extends BaseController {
    /**
     * 日志对象
     */
    private Logger logger = LoggerFactory.getLogger(AgencyController.class);

    @Autowired
    private MerchantService merchantService;
    @Autowired
    private AgencyService agencyService;
    @Autowired
    private QRChannelService qrChannelService;
    @Autowired
    private AdminService adminService;

    /**
     * 下级代理列表
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping(value = "listOne", method = RequestMethod.GET)
    public String listOne(Model model, @PageAttribute Page<Agency> page) {
        String roleIds = LoginHelper.getRoleIds();
        //当码商进来,可以看到下属的所有代理
        if ((roleIds.contains("6"))) {
            String agencyId = LoginHelper.getLoginAgencyId();
            if (StringUtil.isNotBlank(agencyId)) {
                Params params = page.getParams();
                if (null == params) {
                    params = Params.create("superiorId", agencyId);
                } else {
                    params.put("superiorId", agencyId);
                }
                page.setParams(params);
                Page<Agency> pageList = agencyService.findPage(page);

                if (pageList.getList().size() <= 0) {
                    return "new/NoAccess";
                } else {
                    model.addAttribute("page", pageList);
                    model.addAttribute("AgencyList",agencyService.findList());
                    model.addAttribute("qrchannlList",qrChannelService.findList());
                }
            }
        } else {
            //没有权限
            return "new/NoAccess";
        }
        return "new/AgencyList";
    }



    /**
     * 下下级代理
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping(value = "listTwo", method = RequestMethod.GET)
    public String listTwo(Model model, @PageAttribute Page<Agency> page) {
        String roleIds = LoginHelper.getRoleIds();
        //当码商进来,可以看到下属的所有代理
        if ((roleIds.contains("6"))) {
            String agencyId = LoginHelper.getLoginAgencyId();
            if (StringUtil.isNotBlank(agencyId)) {
                Params params = page.getParams();
                if (null == params) {
                    params = Params.create("grandfatherId", agencyId);
                } else {
                    params.put("grandfatherId", agencyId);
                }
                page.setParams(params);
                Page<Agency> pageList = agencyService.findPage(page);
                if (pageList.getList().size() <= 0) {
                    return "new/NoAccess";
                } else {
                    model.addAttribute("page", pageList);
                    model.addAttribute("AgencyList",agencyService.findList());
                    model.addAttribute("qrchannlList",qrChannelService.findList());
                }
            }
        } else {
            //没有权限
            return "new/NoAccess";
        }
        return "new/AgencyList";
    }

    /**
     * 下下下级代理
     *
     * @param model
     * @param page
     * @return
     */
    @RequestMapping(value = "listThree", method = RequestMethod.GET)
    public String listThree(Model model, @PageAttribute Page<Agency> page) {
        String roleIds = LoginHelper.getRoleIds();
        //当码商进来,可以看到下属的所有代理
        if ((roleIds.contains("6"))) {
            String agencyId = LoginHelper.getLoginAgencyId();
            if (StringUtil.isNotBlank(agencyId)) {
                Params params = page.getParams();
                if (null == params) {
                    params = Params.create("greatGrandfatherId", agencyId);
                } else {
                    params.put("greatGrandfatherId", agencyId);
                }
                page.setParams(params);
                Page<Agency> pageList = agencyService.findPage(page);
                if (pageList.getList().size() <= 0) {
                    return "new/NoAccess";
                } else {
                    model.addAttribute("page", pageList);
                    model.addAttribute("AgencyList",agencyService.findList());
                    model.addAttribute("qrchannlList",qrChannelService.findList());
                }
            }
        } else {
            //没有权限
            return "new/NoAccess";
        }
        return "new/AgencyList";
    }


    @RequestMapping(value = "add", method = RequestMethod.GET)
    @RequiresPermissions("Agency:add")
    public String update(Model model) {
        String id = LoginHelper.getId();
        List<Admin> adminList = adminService.findByCreateBy(id);
        String agencyId = LoginHelper.getLoginAgencyId();
        Agency agency = agencyService.get(agencyId);
        //获取本人的上级id,上上级id
        Long superiorId = agency.getSuperiorId();
        Agency superior = agencyService.get(superiorId.toString());
        Long grandfatherId = agency.getGrandfatherId();
        Agency grandfather = agencyService.get(grandfatherId.toString());
        //把本人的id往前端存为上级名称,上级id为新开代理的上上级名称,上上级id为新代理的上上上级名称
        model.addAttribute("superior", agency);
        model.addAttribute("grandfather", superior);
        model.addAttribute("greatGrandfather", grandfather);
        model.addAttribute("adminList",adminList);
        return "new/AgencyAdd";
    }


    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions("Agency:save")
    public String save(RedirectAttributes redirectAttributes, Agency agency,String adminId) {
        Agency agency1 = agencyService.findByCompany(agency.getCompany());
        if (agency1 != null) {
            addErrorMessage(redirectAttributes, "代理已经存在，请勿重复添加");
            return "redirect:/Agency/add";
        }
        if (agency.getGrandfatherId() ==null){
            agency.setGrandfatherId(0L);
        }
        if (agency.getGreatGrandfatherId() ==null){
            agency.setGreatGrandfatherId(0L);
        }
        agencyService.save(agency);
        Admin admin = adminService.get(adminId);
        Agency byCompany = agencyService.findByCompany(agency.getCompany());
        admin.setAgencyId(byCompany.getId());
        admin.setStatus(0);
        adminService.update(admin);
        return "redirect:/QRChannel/add";
    }


    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {
        merchantService.updateStatus(id, status);
        addMessage(redirectAttributes, "状态更改成功");
        return "redirect:/Agency/list";
    }


}
