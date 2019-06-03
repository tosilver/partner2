package co.b4pay.admin.service;

import co.b4pay.admin.common.biz.service.CrudService;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.controller.Utils.Utils;
import co.b4pay.admin.controller.merchant.RechargeController;
import co.b4pay.admin.dao.AgencyDao;
import co.b4pay.admin.dao.QRChannelDao;
import co.b4pay.admin.dao.RechargeDao;
import co.b4pay.admin.dao.WithdrawDao;
import co.b4pay.admin.entity.Agency;
import co.b4pay.admin.entity.QRChannel;
import co.b4pay.admin.entity.Recharge;
import co.b4pay.admin.entity.Withdraw;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;


/**
 * 申请审批记录Service
 *
 * @author YK
 * @version $Id: ConsumeService.java, v 0.1 2018年4月21日 上午11:45:58 YK Exp $
 */
@Service
@Transactional()
public class RechargeService extends CrudService<RechargeDao, Recharge> {


    @Autowired
    private AgencyDao agencyDao;

    @Autowired
    private QRChannelDao qrChannelDao;

    /**
     * 日志对象
     */
    private Logger logger = LoggerFactory.getLogger(RechargeService.class);

    /**
     * 传入费率和充值金额得到到账金额
     * @param rate
     * @param money
     * @return
     */
    public BigDecimal rate2Money( BigDecimal rate,BigDecimal money){
        logger.info("传入的金额:"+money);
        logger.info("传入的费率:"+rate);
        BigDecimal serviceCharge = money.multiply(rate, new MathContext(4, RoundingMode.HALF_UP)).divide(new BigDecimal("100"), 2, BigDecimal.ROUND_UP);
        logger.info("到账金额为:"+serviceCharge);
        return serviceCharge;
    }

    /**
     * 充值审批(此处有太多的金额相加,有时间应该抽取出来独立的方法实现)
     * @param id
     * @param status
     */
    public int updateStatus(String id, int status){
        try {
            Recharge recharge = dao.get(id);
            if (status ==1){
                String agencyId = recharge.getMerchantId();
                //获取上级到账金额
                BigDecimal superiorAmount = recharge.getSuperiorAmount();
                //获取上上级到账金额
                BigDecimal grandfatherAmount = recharge.getGrandfatherAmount();
                //获取上上上级到账金额
                BigDecimal greatGrandfatherAmount = recharge.getGreatGrandfatherAmount();
                //获取代理的信息
                Agency agency = agencyDao.get(agencyId);
                //从代理信息获取各级代理的id
                Long superiorId = agency.getSuperiorId();
                Long grandfatherId = agency.getGrandfatherId();
                Long greatGrandfatherId = agency.getGreatGrandfatherId();
                //获取各级代理的二维码通道
                QRChannel superQRChannel = qrChannelDao.findByMerchantId(superiorId.toString());
                QRChannel grandQRChannel = qrChannelDao.findByMerchantId(grandfatherId.toString());
                QRChannel greatQRChannel= qrChannelDao.findByMerchantId(greatGrandfatherId.toString());
                //获取各级代理余额
                BigDecimal superQRChannelRechargeAmount = superQRChannel.getRechargeAmount();
                BigDecimal grandQRChannelRechargeAmount = grandQRChannel.getRechargeAmount();
                BigDecimal greatQRChannelRechargeAmount = greatQRChannel.getRechargeAmount();
                //把收益充值到充值资金池
                BigDecimal add1= superQRChannelRechargeAmount.add(superiorAmount);
                BigDecimal add2 = grandQRChannelRechargeAmount.add(grandfatherAmount);
                BigDecimal add3 = greatQRChannelRechargeAmount.add(greatGrandfatherAmount);
                //更新通道信息
                superQRChannel.setRechargeAmount(add1);
                qrChannelDao.update(superQRChannel);
                grandQRChannel.setRechargeAmount(add2);
                qrChannelDao.update(grandQRChannel);
                greatQRChannel.setRechargeAmount(add3);
                qrChannelDao.update(greatQRChannel);
                //更新充值流水状态
                recharge.setStatus(status);
                dao.update(recharge);
                return 1;
            }else {
                recharge.setStatus(status);
                dao.update(recharge);
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }


}
