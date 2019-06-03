package co.b4pay.admin.controller.trade;

import co.b4pay.admin.common.core.security.HttpsUtils;
import co.b4pay.admin.common.helper.LoginHelper;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.common.util.StringUtil;
import co.b4pay.admin.common.util.TradeIdUtlis;
import co.b4pay.admin.common.web.BaseController;
import co.b4pay.admin.common.web.PageAttribute;
import co.b4pay.admin.controller.Utils.Constants;
import co.b4pay.admin.controller.Utils.HmacSHA1Signature;
import co.b4pay.admin.controller.Utils.SignatureUtil;
import co.b4pay.admin.controller.Utils.Utils;
import co.b4pay.admin.entity.*;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.service.*;
import com.alibaba.fastjson.JSONObject;
import org.apache.commons.lang3.time.DateUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.security.SignatureException;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;

/**
 * 订单 Controller
 * Created by john on 2018/4/27.
 */
@Controller
@RequestMapping("trade")
public class TradeController extends BaseController {
    /**
     * 日志对象
     */
    private static final Logger logger = LoggerFactory.getLogger(TradeController.class);

    private static final SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Autowired
    private ConsumeService consumeService;

    @Autowired
    private QRChannelService qrChannelService;

    @Autowired
    private MerchantService merchantService;



    private HmacSHA1Signature signature = new HmacSHA1Signature();

    @RequestMapping(value = "list", method = RequestMethod.GET)
    @RequiresPermissions("trade:list")
    public String list(Model model, @PageAttribute Page<Consume> page) {
        String agencyId = LoginHelper.getLoginAgencyId();
        String roleIds = LoginHelper.getRoleIds();
        if (roleIds.contains("1")) {   //如果拥有超级管理员权限
            model.addAttribute("page", consumeService.findPage(page));
        } else if (StringUtil.isNoneBlank(agencyId)) {//如果不是超级管理员则只查询个人交易记录信息
             QRChannel qrChannel= qrChannelService.findByMerchantId(agencyId);
             if (qrChannel == null){
                 return "new/Null";
             }
            Params params = page.getParams();
            if (null == params) {
                params = Params.create("qrChannelId", qrChannel.getId());
            } else {
                params.put("qrChannelId", qrChannel.getId());
            }
            page.setParams(params);
            Page<Consume> pageList = consumeService.findPage(page);
            if (pageList.getList().size()==0){
                return "new/Null";
            }
            model.addAttribute("page",pageList);
            model.addAttribute("qrChannel", qrChannel);
        }
        Double aDouble = consumeService.sumMoney(page);
        Double accountMoney = consumeService.sumAccountMoney(page) == null ? 0D :
                consumeService.sumAccountMoney(page);
        Double requestMoney = consumeService.sumRequestMoney(page) == null ? 0D :
                consumeService.sumRequestMoney(page);
        Integer accountCount = consumeService.accountCount(page) == null ? 0 :
                consumeService.accountCount(page);
        String accountMoneyResult = "";
        if (aDouble != null) {
            String str = new DecimalFormat("0.00").format(aDouble);
            String accountMoneyStr = new DecimalFormat("0.00").format(accountMoney);
            String requestMoneyStr = new DecimalFormat("0.00").format(requestMoney);
            model.addAttribute("sumMoney", str);
            model.addAttribute("sumAccountMoney", accountMoneyStr);
            model.addAttribute("sumRequestMoney", requestMoneyStr);
            accountMoneyResult = accountMoneyStr;
            model.addAttribute("accountCount", accountCount);
        } else {
            Double d = consumeService.sumMoney(page);
            if (d == null) {
                d = 0D;
            }
            Double dd = consumeService.sumAccountMoney(page);
            if (dd == null) {
                dd = 0D;
            }
            Double ddd = consumeService.sumRequestMoney(page);
            if (ddd == null) {
                ddd = 0D;
            }
            model.addAttribute("sumMoney", Utils.getBigDecimal(d));
            model.addAttribute("sumAccountMoney", Utils.getBigDecimal(dd));
            model.addAttribute("sumRequestMoney", Utils.getBigDecimal(ddd));
            accountMoneyResult = Utils.getBigDecimal(dd).toPlainString();
            model.addAttribute("accountCount", accountCount);
        }
        return "new/TradeList";
    }

    @RequestMapping("form")
    @RequiresPermissions("trade:form")
    public String form(Model model, String id) {
        if (StringUtil.isNoneBlank(id)) {
            model.addAttribute("malladdress", consumeService.get(id));
        }
        return "channel/malladdressForm";
    }

    @RequestMapping(value = "updateStatus", method = RequestMethod.GET)
    public String updateStatus(RedirectAttributes redirectAttributes, String id, int status) {

        try {
            //获取订单信息
            Consume trade = consumeService.get(id);
            //组装返回数据
            JSONObject returnData = new JSONObject();
            //获取商户请求的订单号
            String merchantOrderNo = trade.getMerchantOrderNo();
            //获取请求金额
            String amount = trade.getTotalAmount().toPlainString();
            //开始组装
            returnData.put("tradeNo", merchantOrderNo);
            returnData.put("amount", amount );
            returnData.put("tradeState", String.valueOf(trade.getTradeState()));
            returnData.put("merchantId", trade.getMerchant().getId());
            returnData.put("payTime", String.valueOf(trade.getUpdateTime().getTime()));
            //获取商户到账金额
            BigDecimal accountAmount = trade.getAccountAmount();
            //获取订单商户的id
            String merchantId = trade.getMerchant().getId();
            //查询订单所属的商户
            Merchant m = merchantService.get(merchantId);
            //获取商户总余额
            BigDecimal balance = m.getBalance();
            //获取商户可提现余额
            BigDecimal withdrawBalance = m.getWithdrawBalance();
            //加总余额
            BigDecimal addBalance = balance.add(accountAmount);
            //加可提现金额
            BigDecimal addWithdraw = withdrawBalance.add(accountAmount);
            m.setBalance(addBalance);
            m.setWithdrawBalance(addWithdraw);
            merchantService.update(m);
            //签名记得传
            String content = SignatureUtil.getSignatureContent(returnData, true);
            String sign = signature.sign(content, m.getSecretKey(), "UTF-8");
            returnData.put("signature", sign);
            //更新订单的状态
            consumeService.updateTrade(id, returnData.toString(), 0);
            //把手动确认回调的金额从冻结资金池中减去
            //判断通道是否为个码充值
            Channel channel = trade.getChannel();
            String channelId = channel.getId();

            if ("356".equals(channelId)|| "357".equals(channelId)){
                if (DateUtil.now().before(DateUtils.addMinutes(trade.getCreateTime(),10))){
                    //获取订单所属二维码通道
                    QRChannel qrChannel = trade.getQrChannel();
                    //因为在订单的二维码通道里面只包着二维码通道的id和名称,所以需要通过二维码的id去查询所属二维码的
                    String qrChannelId = qrChannel.getId();
                    QRChannel qrChannel2 = qrChannelService.get(qrChannelId);
                    //冻结资金池
                    BigDecimal frozenCapitalPool = qrChannel2.getFrozenCapitalPool();
                    BigDecimal subtract = frozenCapitalPool.subtract(new BigDecimal(amount));
                    //通道收益
                    BigDecimal turnover = qrChannel2.getTurnover();
                    BigDecimal add = turnover.add(new BigDecimal(amount));
                    qrChannel2.setTurnover(add);
                    qrChannel2.setFrozenCapitalPool(subtract);
                    qrChannelService.update(qrChannel2);
                    consumeService.updateStatus(id, status,new BigDecimal(amount),accountAmount);
                    JobTrade jobTrade = consumeService.findJobTradeById(trade.getId());
                    //发起给客户回调任务
                    new Thread(new NotitfTask(jobTrade, trade)).start();
                } else {
                  throw new Exception("你的订单已超过确认付款时间");
                }
            }else {
                consumeService.updateStatus(id, status,new BigDecimal(amount),accountAmount);
                JobTrade jobTrade = consumeService.findJobTradeById(trade.getId());
                //发起给客户回调任务
                new Thread(new NotitfTask(jobTrade, trade)).start();
                addMessage(redirectAttributes, "确认收款成功");
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return "redirect:/trade/list";
    }

    /**
     * 给用户发回调任务
     */
    class NotitfTask implements Runnable {

        private String orderid;

        private JSONObject params;

        private JobTrade jobTrade;

        private Consume consume;

        public NotitfTask(String orderid, JSONObject params) {
            this.orderid = orderid;
            this.params = params;
        }

        public NotitfTask(JobTrade jobTrade, Consume consume) {
            this.consume = consume;
            this.jobTrade = jobTrade;
        }

        @Override
        public void run() {
            for (int i = 0; i < 5; i++) {
                int status = notify(jobTrade, consume);
                logger.info("第" + (i + 1) + "次给" + consume.getMerchantOrderNo() + "发回调" + "status为:" + status);
                System.out.println("回调开始了");
                if (status == 1) {
                    Thread.currentThread().stop();
                }
                try {
                    Thread.sleep(30 * 1000);
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

        private int notify(JobTrade jobTrade, Consume consume) {
            JSONObject notifyJson = new JSONObject();
            notifyJson.put("trade_status", "TRADE_SUCCESS");
            notifyJson.put("total_amount", consume.getTotalAmount().toString());
            notifyJson.put("out_trade_no", consume.getMerchantOrderNo());
            notifyJson.put("trade_no", consume.getId());
            notifyJson.put("notify_id", jobTrade.getId() == null ? "" : jobTrade.getId());
            logger.info(String.format("回调方法中:trade_status[%s]", notifyJson.getString("trade_status")));
            logger.info(String.format("回调方法中:total_amount[%s]", notifyJson.getString("total_amount")));
            logger.info(String.format("回调方法中:out_trade_no[%s]", notifyJson.getString("out_trade_no")));
            logger.info(String.format("回调方法中:trade_no[%s]", notifyJson.getString("trade_no")));
            logger.info(String.format("回调方法中:notify_id[%s]", jobTrade.getId() == null ? "" : jobTrade.getId()));
            Merchant merchant = consume.getMerchant();
            if (merchant == null) {
                logger.error("Merchant为空！！！");
                throw new RuntimeException("Merchant为空");
            }

            String content = null;
            String sign = null;
            try {
                content = SignatureUtil.getSignatureContent(notifyJson, true);
                sign = signature.sign(content, merchant.getSecretKey(), Constants.CHARSET_UTF8);
            } catch (UnsupportedEncodingException | SignatureException e) {
                e.printStackTrace();
            }

            notifyJson.put("signature", sign);

            int status = 0;
            logger.warn("商户支付结果调度器执行：" + JSONObject.toJSONString(jobTrade));
            logger.warn("给用户发回调的地址：" + jobTrade.getNotifyUrl());
            logger.warn("给用户发回调的内容：" + notifyJson.toJSONString());
            String result = null;
            try {
                result = HttpsUtils.post(jobTrade.getNotifyUrl(), null, notifyJson.toJSONString());
            } catch (IOException e) {
                e.printStackTrace();
            }
            if ("success".equalsIgnoreCase(result)){
                status = 1;
            }
            logger.warn("用户发完回调以后-->执行结果：" + (status == 1 ? "成功" : "失败"));
            jobTrade.setStatus(status);
            jobTrade.setExecTime(DateUtil.getTime());
            jobTrade.setUpdateTime(DateUtil.getTime());
            if (status == 1) {
                return 1;
            }
            return 0;
        }
    }

}
