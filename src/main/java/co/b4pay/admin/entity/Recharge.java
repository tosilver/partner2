package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.math.BigDecimal;

/****
 * 充值记录
 * @author Tosdom
 */
public class Recharge extends BaseEntity {


    private String merchantId;            //商户ID
    private String approveId;            //审批ID
    private String tradeNo;             //充值单号
    private String merchantCompany;     //商户名称
    private String mallName;            //商城名称
    private String cardNo;               //银行卡号
    private String customerName;       //户主姓名
    private String bankName;           //开户行名称
    private BigDecimal amount;         //充值金额
    private BigDecimal greatGrandfatherAmount; //上上上级代理收益
    private BigDecimal grandfatherAmount;      //上上级代理收益
    private BigDecimal superiorAmount;         //上级费率
    private String appTime;            //审批时间


    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) {
        this.merchantId = merchantId;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo;
    }

    public String getMerchantCompany() {
        return merchantCompany;
    }

    public void setMerchantCompany(String merchantCompany) {
        this.merchantCompany = merchantCompany;
    }

    public String getCardNo() {
        return cardNo;
    }

    public void setCardNo(String cardNo) {
        this.cardNo = cardNo;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public BigDecimal getAmount() {
        return amount;
    }

    public void setAmount(BigDecimal amount) {
        this.amount = amount;
    }

    public String getAppTime() {
        return appTime;
    }

    public void setAppTime(String appTime) {
        this.appTime = appTime;
    }

    public String getMallName() {
        return mallName;
    }

    public void setMallName(String mallName) {
        this.mallName = mallName;
    }

    public BigDecimal getGreatGrandfatherAmount() {
        return greatGrandfatherAmount;
    }

    public void setGreatGrandfatherAmount(BigDecimal greatGrandfatherAmount) {
        this.greatGrandfatherAmount = greatGrandfatherAmount;
    }

    public BigDecimal getGrandfatherAmount() {
        return grandfatherAmount;
    }

    public void setGrandfatherAmount(BigDecimal grandfatherAmount) {
        this.grandfatherAmount = grandfatherAmount;
    }

    public BigDecimal getSuperiorAmount() {
        return superiorAmount;
    }

    public void setSuperiorAmount(BigDecimal superiorAmount) {
        this.superiorAmount = superiorAmount;
    }
}
