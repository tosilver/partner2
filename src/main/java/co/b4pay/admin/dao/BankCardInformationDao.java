package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.BankCardInformation;
import co.b4pay.admin.entity.base.Params;

import java.util.List;

/**
 * 添加银行卡DAO
 */
@MyBatisDao
public interface BankCardInformationDao extends ICrudDao<BankCardInformation> {

    /**
     * 更改状态
     */
    int updateStatus(Params params);



    /**
     * 根据商户ID查找商城集合
     */
    List<BankCardInformation> findListById(String merchantId);


    List<BankCardInformation> findListByIdAndStatus(String merchantId,int status);
}
