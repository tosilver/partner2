package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

/****
 * 商城地址
 * @author Tosdom
 */
public class MallAddress extends BaseEntity {

    private String merchantId;          //所属商户id
    private String mallName;            //商城名称
    private String mallAdmin;            //商城后台
    private String address;                //商城地址
    private Date  lastRequestTime;           //最后请求时间
    private BigDecimal turnover;            //商城营业额
    private BigDecimal rechargeAmount;        //充值金额
    private BigDecimal frozenCapitalPool;     //冻结资金池
    private BigDecimal rate;                     //速率

    public String getMallName() {
        return mallName;
    }

    public void setMallName(String mallName) {
        this.mallName = mallName;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMallAdmin() {
        return mallAdmin;
    }

    public void setMallAdmin(String mallAdmin) {
        this.mallAdmin = mallAdmin;
    }

    public BigDecimal getTurnover() {
        return turnover;
    }

    public void setTurnover(BigDecimal turnover) {
        this.turnover = turnover;
    }

    public BigDecimal getRechargeAmount() {
        return rechargeAmount;
    }

    public void setRechargeAmount(BigDecimal rechargeAmount) {
        this.rechargeAmount = rechargeAmount;
    }

    public BigDecimal getFrozenCapitalPool() {
        return frozenCapitalPool;
    }

    public void setFrozenCapitalPool(BigDecimal frozenCapitalPool) {
        this.frozenCapitalPool = frozenCapitalPool;
    }

    public BigDecimal getRate() {
        return rate;
    }

    public void setRate(BigDecimal rate) {
        this.rate = rate;
    }

    public Date getLastRequestTime() {
        return lastRequestTime;
    }

    public void setLastRequestTime(Date lastRequestTime) {
        this.lastRequestTime = lastRequestTime;
    }

    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }
}
