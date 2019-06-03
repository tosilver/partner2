package co.b4pay.admin.common.system.dao;

import co.b4pay.admin.common.system.entity.Admin;

import co.b4pay.admin.common.biz.dao.ICrudDao;
import co.b4pay.admin.common.biz.dao.annotation.MyBatisDao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户Dao接口
 *
 * @author cc
 */
@MyBatisDao
public interface AdminDao extends ICrudDao<Admin> {

    /**
     * 根据用户名获取用户信息
     *
     * @param username
     * @return
     */
    Admin getByUsername(@Param("username") String username);

    /**
     * 启用用户
     *
     * @param id
     */
    void startUsing(String id);

    Admin findByMerchantId(String merchantIds);

    /**
     * 查找上级id
     * @param superiorId
     * @return
     */
    List<Admin> findBySuperiorId(Long superiorId);

    List<Admin> findByCreateBy(String createBy);

   Admin findByAgencyId(String agencyId);

    /**
     * 根据code查找会员信息
     * @param invitationCode
     * @return
     */
    Admin findByCode(String invitationCode);
}
