package co.b4pay.admin.service;

import co.b4pay.admin.common.biz.service.CrudService;
import co.b4pay.admin.dao.FrozenCapitalTradeDao;
import co.b4pay.admin.entity.FrozenCapitalTrade;
import co.b4pay.admin.entity.base.Page;
import co.b4pay.admin.entity.base.Params;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


/**
 * 申请审批记录Service
 *
 * @author YK
 * @version $Id: ConsumeService.java, v 0.1 2018年4月21日 上午11:45:58 YK Exp $
 */
@Service
@Transactional
public class FrozenCapitalTradeService extends CrudService<FrozenCapitalTradeDao,FrozenCapitalTrade> {
    @Autowired
    private FrozenCapitalTradeDao frozenCapitalTradeDao;

    public List<FrozenCapitalTrade> findByFrozenCapitalPoolId(long frozenCapitalPoolId){
        List<FrozenCapitalTrade> frozenCapitalTradeList = dao.findByFrozenCapitalPoolId(frozenCapitalPoolId);
        return frozenCapitalTradeList;
    }


    public Double sumMoney(Page<FrozenCapitalTrade> page) {
        Params params = page.getParams();
        if (params == null) {
            params = Params.create();
        }
        return dao.sumMoney(params);
    }

}
