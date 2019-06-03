package co.b4pay.admin.controller.merchant;

import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.controller.Utils.Utils;
import co.b4pay.admin.entity.FrozenCapitalTrade;
import co.b4pay.admin.entity.QRChannel;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.ConsumeService;
import co.b4pay.admin.service.FrozenCapitalTradeService;
import co.b4pay.admin.service.QRChannelService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

//import com.suning.epps.merchantsignature.SignatureUtil;

/**
 * 交易记录Controller
 * Created by john on 2018/4/27.
 */
@Controller
@RequestMapping("frozenCapitalTrade")
public class FrozenCapitalTradeController extends BaseController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(FrozenCapitalTradeController.class);

    @Autowired
    private ConsumeService consumeService;
    @Autowired
    private QRChannelService qrChannelService;
    @Autowired
    private FrozenCapitalTradeService frozenCapitalTradeService;


    private Page<FrozenCapitalTrade> pac = new Page<>();

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("frozenCapitalTrade:list")
    public String list(Model model, @PageAttribute Page<FrozenCapitalTrade> page, HttpServletRequest request) {
        String merchantIds = LoginHelper.getMerchantIds();
        String roleIds = LoginHelper.getRoleIds();
        Params p = page.getParams();
        String startDate = null;
        if (p != null) {
            startDate = p.containsKey("startDate") ? p.getString("startDate") : null;
        } else {
            p = new Params();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (StringUtils.isBlank(startDate)) {
            Calendar c = Calendar.getInstance();
            c.setTime(new Date());
            c.set(Calendar.HOUR_OF_DAY, c.get(Calendar.HOUR_OF_DAY) - 2);
            startDate = sdf.format(c.getTime());
            p.put("startDate", startDate);
        }
        page.setParams(p);
        if (roleIds.contains("1") || roleIds.contains("2")) {   //如果拥有超级管理员权限
            List<QRChannel> qrChannelList = qrChannelService.findByStatus(1);
            model.addAttribute("qrChannelList", qrChannelList);
            model.addAttribute("page", frozenCapitalTradeService.findPage(page));
        } else if (roleIds.contains("6")) {//如果是码商进来只能看到所属流水
            QRChannel qrChannel = qrChannelService.findByMerchantId(merchantIds.substring(0, merchantIds.length() - 1));
            String qrChannelId = qrChannel.getId();
            /*List<FrozenCapitalTrade> frozenCapitalTradeList = frozenCapitalTradeService.findByFrozenCapitalPoolId(Long.valueOf(qrChannelId));*/
            Params params = page.getParams();
            if (null == params) {
                params = Params.create("qrChannelId", qrChannelId);
            } else {
                params.put("qrChannelId", qrChannelId);
            }
            page.setParams(params);
            model.addAttribute("page", frozenCapitalTradeService.findPage(page));
        }
        Double aDouble = frozenCapitalTradeService.sumMoney(page);
        if (aDouble != null) {
            String str = new DecimalFormat("0.00").format(aDouble);
            model.addAttribute("sumMoney", str);
        } else {
            Double d = frozenCapitalTradeService.sumMoney(page);
            if (d == null) {
                d = 0D;
            }
            model.addAttribute("sumMoney", Utils.getBigDecimal(d));
        }
        return "new/FrozenCapitalTradeList";
    }


}
