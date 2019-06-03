package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.QRChannel;
import co.b4pay.admin.entity.base.Params;

import java.util.List;


/**
 * 消费记录DAO
 *
 * @author YK
 * @version $Id: ConsumeDao.java, v 0.1 2018年4月21日 上午11:41:12 YK Exp $
 */
@MyBatisDao
public interface QRChannelDao extends ICrudDao<QRChannel> {
    /**
     * 更改状态
     * @param params
     * @return
     */
    int updateStatus(Params params);

    /**
     * 查找当天营业额前4的商城
     */
    List<MallAddress> findByTop4();

    /**
     * 修改充值资金池
     */
    int updateRechargeAmount(Params params);


    /**
     * 修改冻结资金池
     */
    int updateFrozenCapitalPool(Params params);

    /**
     * 修改请求速率
     */
    int updateRate(Params params);

    /**
     * 根据商城名称查找记录
     */
    int findByMallName(String mallName);


    /**
     * 根据状态查找集合
     */
    List<QRChannel> findByStatus(int status);

    /**
     * 根据商户id查找二维码通道
     */
    QRChannel findByMerchantId(String merchantId);
}