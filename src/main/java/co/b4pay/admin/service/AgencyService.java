package co.b4pay.admin.service;

import co.b4pay.admin.common.biz.service.CrudService;
import co.b4pay.admin.dao.AgencyDao;
import co.b4pay.admin.dao.MerchantDao;
import co.b4pay.admin.entity.Agency;
import co.b4pay.admin.entity.Merchant;
import co.b4pay.admin.entity.base.Params;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;

/**
 * 商户服务
 *
 * @author YK
 * @version $Id: MerchantFunction.java, v 0.1 2018年4月20日 下午14:20:58 YK Exp $
 */
@Service
@Transactional
public class AgencyService extends CrudService<AgencyDao, Agency> {
//    private static final String CACHE_NAME = "Merchant";

    /**
     * 更改状态
     *
     * @param id
     * @param status
     * @return
     */
    public int updateStatus(String id, int status) {
        Params params = Params.create("id", id);
        params.put("status", status);
        return dao.updateStatus(params);
    }

    /**
     * 根据年月日统计商户数量
     *
     * @param currentYear
     * @param currentMonth
     * @param currentDay
     * @return
     */
    public int selectIncreaseByDate(int currentYear, int currentMonth, int currentDay) {
        Params params = Params.create("currentYear", currentYear);
        params.put("currentMonth", currentMonth);
        params.put("currentDay", currentDay);
        return dao.count(params);
    }

    //根据公司名查找商户信息
    public Agency findByCompany(String compay) {
        return dao.findByCompany(compay);
    }

    //根据商户ID查询余额
    public BigDecimal findByBalance(String id) {
        return dao.findByBalance(id);
    }

    public Agency findAll(String id) {
        return dao.findAll(id);
    }

    public List<Agency> findByAdminMerchant(String id) {
        return dao.findByAdminMerchant(id);
    }

    public int findBySuperiorIdToNum(Long superiorId){
        List<Agency> agencyList = dao.findBySuperiorId(superiorId);
        if (agencyList.size()>0){
            return agencyList.size();
        }else {
            return 0;
        }
    }

    public List<Agency> findBySuperiorId(Long superiorId){
        return dao.findBySuperiorId(superiorId);
    }


}
