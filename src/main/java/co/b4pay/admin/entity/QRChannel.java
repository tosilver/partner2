package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.math.BigDecimal;
import java.util.Date;

/****
 * 商城地址
 * @author Tosdom
 */
public class QRChannel extends BaseEntity {

    private String merchantId;          //所属商户id
    private String Name;                   //通道名称
    private Date  lastRequestTime;           //最后请求时间
    private BigDecimal turnover;            //通道营业额
    private BigDecimal rechargeAmount;        //充值金额
    private BigDecimal frozenCapitalPool;     //冻结资金池
    private BigDecimal rate;                     //速率

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
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
