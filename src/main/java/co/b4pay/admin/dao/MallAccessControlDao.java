package co.b4pay.admin.dao;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;
import co.b4pay.admin.entity.MallAccessControl;
import co.b4pay.admin.entity.MallAddress;
import co.b4pay.admin.entity.Withdraw;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;

import java.util.List;


/**
 * 通道控制DAO
 *
 * @author YK
 * @version
 */
@MyBatisDao
public interface MallAccessControlDao extends ICrudDao<MallAccessControl> {


    /**
     * 根据商户号查找商城地址控制记录
     */
    MallAccessControl findByMerchantId(String merchantIds);


}