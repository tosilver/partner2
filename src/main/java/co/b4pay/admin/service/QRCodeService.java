package co.b4pay.admin.service;

import co.b4pay.admin.common.biz.service.CrudService;
import co.b4pay.admin.common.util.DateUtil;
import co.b4pay.admin.controller.Utils.Utils;
import co.b4pay.admin.dao.QRCodeDao;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.base.Params;
import co.b4pay.admin.entity.qrcode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;


/**
 * 二维码Service
 *
 * @author YK
 * @version $Id: ConsumeService.java, v 0.1 2018年4月21日 上午11:45:58 YK Exp $
 */
@Service
@Transactional
public class QRCodeService extends CrudService<QRCodeDao,qrcode> {

    @Autowired
    private QRCodeDao qrCodeDao;

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
