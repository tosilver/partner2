package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.DetailDataAccount;

@MyBatisDao
public interface DetailDataAccountDao extends ICrudDao<DetailDataAccount> {
    DetailDataAccount findBySerialNo(String serialNo);
}
