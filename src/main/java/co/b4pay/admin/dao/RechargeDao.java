package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.Consume;
import co.b4pay.admin.entity.Recharge;
import co.b4pay.admin.entity.Withdraw;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 消费记录DAO
 *
 * @author YK
 * @version $Id: ConsumeDao.java, v 0.1 2018年4月21日 上午11:41:12 YK Exp $
 */
@MyBatisDao
public interface RechargeDao extends ICrudDao<Recharge> {


}