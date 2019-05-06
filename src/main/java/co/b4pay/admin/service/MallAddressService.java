package co.b4pay.admin.service;

import co.b4pay.admin.common.biz.service.CrudService;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.controller.Utils.Utils;
import co.b4pay.admin.dao.MallAddressDao;
import co.b4pay.admin.dao.WithdrawDao;
import co.b4pay.admin.entity.Consume;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.MerchantRate;
import co.b4pay.admin.entity.Withdraw;
import co.b4pay.admin.entity.base.DtoException;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 申请审批记录Service
 *
 * @author YK
 * @version $Id: ConsumeService.java, v 0.1 2018年4月21日 上午11:45:58 YK Exp $
 */
@Service
@Transactional
public class MallAddressService extends CrudService<MallAddressDao, MallAddress> {
    @Autowired
    private MallAddressDao mallAddressDao;
    /**
     * 查找当天营业额前4的商城
     */
    public List<MallAddress> findByTop4(){
       return dao.findByTop4();
    }

    /**
     * 更改订单状态
     *
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(String id, int status) {
        Params params = Params.create("id", id);
        params.put("status", status);
        try {
            params.put("nowDate", DateUtil.YMdhms.parse(DateUtil.YMdhms.format(Utils.now())));
        } catch (Exception e) {
            //System.out.println(e.getMessage());
        }
        return dao.updateStatus(params);
    }

    /**
     * 修改充值资金池
     * @param id
     * @param rechargeAmount
     * @return
     */
    public int updateRechargeAmount(String id,BigDecimal rechargeAmount){
        MallAddress mallAddress = dao.get(id);
        BigDecimal rechargeAmount1 = mallAddress.getRechargeAmount();
        BigDecimal sum =null;
        if (rechargeAmount.intValue()==0){
            sum =rechargeAmount;
        }else {
            sum = rechargeAmount1.add(rechargeAmount);
        }
        Params params = Params.create("id", id);
        params.put("rechargeAmount",sum);
        try {
            params.put("nowDate", DateUtil.YMdhms.parse(DateUtil.YMdhms.format(Utils.now())));
        } catch (Exception e) {
            //System.out.println(e.getMessage());
        }
        return dao.updateRechargeAmount(params);
    }

    /**
     * 修改冻结资金池
     */
    public int updateFrozenCapitalPool(String id,BigDecimal frozenCapitalPool){
        Params params = Params.create("id", id);
        params.put("frozenCapitalPool",frozenCapitalPool);
        try {
            params.put("nowDate", DateUtil.YMdhms.parse(DateUtil.YMdhms.format(Utils.now())));
        } catch (Exception e) {
            //System.out.println(e.getMessage());
        }
        return dao.updateFrozenCapitalPool(params);
    }


    /**
     * 修改请求速率
     * @param id
     * @param rate
     * @return
     */
    public int updateRate(String id,BigDecimal rate){
        Params params = Params.create("id", id);
        params.put("rate",rate);
        try {
            params.put("nowDate", DateUtil.YMdhms.parse(DateUtil.YMdhms.format(Utils.now())));
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return dao.updateRechargeAmount(params);
    }

    /**
     * 查找商城名称
     * @param mallName
     * @return
     */
    public int findByMallName(String mallName){
        return dao.findByMallName(mallName);
    }

    /**
     * 根据状态查找商城集合
     * @return
     */
    public List<MallAddress> findByStatus(int status) {
        return dao.findByStatus(status);
    }


    /**
     * 根据商户id查找商城集合
     * @return
     */
    public List<MallAddress> findByMerchantId(String merchantId) {
        return dao.findByMerchantId(merchantId);
    }
}
