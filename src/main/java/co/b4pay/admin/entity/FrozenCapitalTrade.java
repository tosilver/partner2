package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.math.BigDecimal;

/**
 * 冻结资金流水
 */
public class FrozenCapitalTrade extends BaseEntity {


    private QRChannel qrChannel;                              //冻结资金池id
    private String outTradeNo;                                    // 客户订单号
    private BigDecimal money;                                       //金额
    private int FrozenCapitalStatus;                         //资金状态 0失败,1成功

    public QRChannel getQrChannel() {
        return qrChannel;
    }

    public void setQrChannel(QRChannel qrChannel) {
        this.qrChannel = qrChannel;
    }

    public String getOutTradeNo() {
        return outTradeNo;
    }

    public void setOutTradeNo(String outTradeNo) {
        this.outTradeNo = outTradeNo;
    }

    public BigDecimal getMoney() {
        return money;
    }

    public void setMoney(BigDecimal money) {
        this.money = money;
    }

    public int getFrozenCapitalStatus() {
        return FrozenCapitalStatus;
    }

    public void setFrozenCapitalStatus(int frozenCapitalStatus) {
        FrozenCapitalStatus = frozenCapitalStatus;
    }
}
