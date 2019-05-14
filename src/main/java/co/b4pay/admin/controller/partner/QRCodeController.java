package co.b4pay.admin.controller.partner;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.qrcodeUtlis.QRCodeUtil;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.common.xifaUtil.POIExcelUtil;
import co.b4pay.admin.entity.*;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.MallAddressService;
import co.b4pay.admin.service.MerchantService;
import co.b4pay.admin.service.QRChannelService;
import co.b4pay.admin.service.QRCodeService;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * 二维码 Controller
 * Created by john on 2018/4/27.
 */
@Controller
@RequestMapping("qrcode")
public class QRCodeController extends BaseController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(QRCodeController.class);


    //二维码存储的路径
    private String uploadPath = "";


    @Autowired
    private QRCodeService qrCodeService;
    @Autowired
    private QRChannelService qrChannelService;

    @Autowired
    private MerchantService merchantService;

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("qrcode:list")
    public String list(Model model, @PageAttribute Page<qrcode> page) {
        String merchantIds = LoginHelper.getMerchantIds();
        String roleIds = LoginHelper.getRoleIds();

        String merid = LoginHelper.getMerchantIds();
        //System.out.println("merid是："+merid);
       /* QRChannel qrChannel= qrChannelService.findByMerchantId(merid);
        System.out.println("qrChannel获取表pool的信息："+qrChannel.getRechargeAmount());
        System.out.println("qrChannel获取表pool的信息："+qrChannel.getFrozenCapitalPool());
        model.addAttribute("amount",qrChannel.getRechargeAmount());
        model.addAttribute("pool",qrChannel.getFrozenCapitalPool());*/



        if (roleIds.contains("1")) {   //如果拥有超级管理员权限
            model.addAttribute("page", qrCodeService.findPage(page));
        } else if (StringUtil.isNoneBlank(merchantIds)) {    //如果不是超级管理员则只查询个人收款码列表
            Params params = page.getParams();
            if (null == params) {
                params = Params.create("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            } else {
                params.put("merchantId", merchantIds.substring(0, merchantIds.length() - 1));
            }
            page.setParams(params);
            model.addAttribute("page", qrCodeService.findPage(page));
        }
        return "new/QRCodeList";
    }

    @RequestMapping("add")
    @RequiresPermissions("qrcode:add")
    public String form(HttpServletRequest request) {
        //1.获取上传目录路径
        uploadPath = request.getSession().getServletContext().getRealPath("/upload") + "/";
        return "new/QRCodeAdd";
    }


    /**
     * 文件上传，使用SpringMVC提供的文件上传
     *
     * @param request   请求域对象
     * @param execlFile 表示上传的文件
     *                  注意：参数imgFile要与页面的表单元素名称一致，<input type="file" name="imgFile">
     */
    @RequestMapping("/upload")
    @RequiresPermissions("qrcode:upload")
    public String upload(HttpServletRequest request,
                         @RequestParam("execlFile") MultipartFile execlFile,
                         String name,String type,String money,
                         Model model) throws Exception {
        String merchantIds = LoginHelper.getMerchantIds();

        //如果该用户没有商户号，返回错误提示
        if (StringUtils.isEmpty(merchantIds)) {
            //todo
            model.addAttribute("msg", "用户没有商户号");
            return "/qrcode/add";
        }

        Merchant merchant = merchantService.get(merchantIds.substring(0, merchantIds.length() - 1));

        //2.每天生成一个当天日期的目录:/upload/2018-09-23用于保存用户上传的下发表格
        String now = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

        //3. 创建目录对象
        File file = new File(uploadPath, now);
        if (!file.exists()) {
            file.mkdirs();
        }

        //4. 文件上传
        //4.1 获取文件名称
        if (execlFile == null) {
            model.addAttribute("msg", "你没有上传文件");
            return "/qrcode/add";
        }
        String fileName = execlFile.getOriginalFilename();
        //4.2 文件名唯一
        //商户名+二维码名称+类型+金额+文件名
        if ("0".equals(type)){
            fileName =merchant.getCompany() + name+"支付宝--"+money+"元_" + fileName;
        }else if("1".equals(type)){
            fileName = merchant.getCompany()+ name+"微信--"+money+"元_" + fileName;
        }else {
            fileName =merchant.getCompany()+ name+"聚合码--"+money+"元_" + fileName;
        }
        //4.3 上传
        execlFile.transferTo(new File(file, fileName));
        if (!saveFile2db(now + "/" + fileName,name,type,money)) {
            model.addAttribute("msg", "你没有上传文件");
            return "/qrcode/add";
        }
        return "redirect:/qrcode/list";
    }


    /**
     * 将图片的数据录入进数据库
     *
     * @param pathAndName 存储在服务器端的文件的相对路径
     */
    private Boolean saveFile2db(String pathAndName,String name,String type,String money) {
        String merchantIds = LoginHelper.getMerchantIds();
        String substring = merchantIds.substring(0, merchantIds.length() - 1);
        try {
            /*JSONObject decode = QRCodeUtil.decode(uploadPath + pathAndName);
            String jsonString = JSON.toJSONString(decode);*/
            qrcode code = new qrcode();
            code.setName(name);
            code.setMoney(new BigDecimal(money));
            code.setCodePath(uploadPath + pathAndName);
            code.setCodeType(type);
            code.setMerchantId(substring);
            code.setTurnover(new BigDecimal(0));
            code.setStatus(1);
            code.setRate(new BigDecimal(0));
            qrCodeService.save(code);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return true;

    }



    @RequestMapping(value = "save", method = RequestMethod.POST)
    @RequiresPermissions(value = "qrcode:save")
    public String save(RedirectAttributes redirectAttributes, String name,String type,String money,String qrcodeData) {
        String merchantIds = LoginHelper.getMerchantIds();
        String substring = merchantIds.substring(0, merchantIds.length() - 1);
        qrcode code = new qrcode();
        code.setName(name);
        code.setMoney(new BigDecimal(money));
        code.setCodeData(qrcodeData.trim());
        code.setCodeType(type);
        code.setMerchantId(substring);
        code.setTurnover(new BigDecimal(0));
        code.setStatus(1);
        code.setRate(new BigDecimal(0));
        int save = qrCodeService.save(code);
        if (save>0){
            addMessage(redirectAttributes, "新增成功");
        }else {
            addMessage(redirectAttributes, "新增失败");
        }

        return "redirect:/qrcode/list";
    }

    @RequestMapping(value = "delete", method = RequestMethod.GET)
    public String delete(RedirectAttributes redirectAttributes, String id) {
        if (qrCodeService.delete(id) > 0) {
            addMessage(redirectAttributes, "禁用成功");
        } else {
            addMessage(redirectAttributes, "禁用失败");
        }
        return "redirect:/qrcode/list";
    }

    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {
        if (qrCodeService.updateStatus(id, status) > 0) {
            addMessage(redirectAttributes, "更改状态成功");
        } else {
            addMessage(redirectAttributes, "状态更改失败");
        }
        return "redirect:/qrcode/list";
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
        int i = qrCodeService.updateFrozenCapitalPool(id, bigDecimal);
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
        int i = qrCodeService.updateRate(id, rateDecimal);
        if (i > 0) {
                addMessage(redirectAttributes, "修改成功");

        } else {
            addErrorMessage(redirectAttributes, "修改失败,请联系管理员!");
        }
        return "redirect:/malladdress/list";
    }

    @RequestMapping("form")
    @RequiresPermissions("qrcode:form")
    public String form(Model model, String id) {
        if (StringUtil.isNoneBlank(id)) {
            model.addAttribute("QRCode", qrCodeService.get(id));
        }
        model.addAttribute("merchantList", merchantService.findList());
        return "new/QRCodeAdd";
    }



}
