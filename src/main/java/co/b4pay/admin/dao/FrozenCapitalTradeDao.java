package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.FrozenCapitalTrade;
import co.b4pay.admin.entity.base.Params;

import java.util.List;


/**
 * 二维码通道DAO
 *
 * @author YK
 * @version $Id: ConsumeDao.java, v 0.1 2018年4月21日 上午11:41:12 YK Exp $
 */
@MyBatisDao
public interface FrozenCapitalTradeDao extends ICrudDao<FrozenCapitalTrade> {


    List<FrozenCapitalTrade> findByFrozenCapitalPoolId(long frozenCapitalPoolId);


    //查询总金额
    Double sumMoney(Params params);
}
