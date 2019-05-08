package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;
import com.alibaba.druid.sql.visitor.functions.Bin;
import org.omg.PortableInterceptor.INACTIVE;

import java.math.BigInteger;


public class BankCardInformation extends BaseEntity {

    private String merchantId;   //商户ID
    private Integer accountType;   //账户类型
    private String bankName;          //银行名称
    private String cardNo;         //银行卡号
    private String customerName;    //真实姓名
    private String phoneNum;      //联系电话


    public String getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(String merchantId) { this.merchantId = merchantId; }

    public Integer getAccountType() {
        return accountType;
    }

    public void setAccountType(Integer accountType) {
        this.accountType = accountType;
    }

    public String getBankName() { return bankName; }

    public void setBankName(String bankName) {
        this.bankName = bankName;
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

    public String getPhoneNum() { return phoneNum; }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }
}
