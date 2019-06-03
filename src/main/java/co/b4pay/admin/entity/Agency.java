package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.math.BigDecimal;


/**
 * 商户信息
 *
 * @author YK
 * @version $Id: Merchant.java, v 0.1 2018年4月20日 下午14:03:09 YK Exp $
 */
public class Agency extends BaseEntity {
    /**
     * serialVersionUID
     */
    private static final long serialVersionUID = -3050115515232663085L;

    private String company;                  // 代理名字
    private Long greatGrandfatherId;           //上上上级代理id
    private Long grandfatherId;                //上上级代理id
    private Long superiorId;                  // 上级代理id
    private BigDecimal greatGrandfatherContribution ; //上上上级代理费率
    private BigDecimal grandfatherContribution ;      //上上级代理费率
    private BigDecimal superiorContribution ;         //上级代理费率


    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Long getSuperiorId() {
        return superiorId;
    }

    public void setSuperiorId(Long superiorId) {
        this.superiorId = superiorId;
    }


    public Long getGreatGrandfatherId() {
        return greatGrandfatherId;
    }

    public void setGreatGrandfatherId(Long greatGrandfatherId) {
        this.greatGrandfatherId = greatGrandfatherId;
    }

    public Long getGrandfatherId() {
        return grandfatherId;
    }

    public void setGrandfatherId(Long grandfatherId) {
        this.grandfatherId = grandfatherId;
    }

    public BigDecimal getGreatGrandfatherContribution() {
        return greatGrandfatherContribution;
    }

    public void setGreatGrandfatherContribution(BigDecimal greatGrandfatherContribution) {
        this.greatGrandfatherContribution = greatGrandfatherContribution;
    }

    public BigDecimal getGrandfatherContribution() {
        return grandfatherContribution;
    }

    public void setGrandfatherContribution(BigDecimal grandfatherContribution) {
        this.grandfatherContribution = grandfatherContribution;
    }

    public BigDecimal getSuperiorContribution() {
        return superiorContribution;
    }

    public void setSuperiorContribution(BigDecimal superiorContribution) {
        this.superiorContribution = superiorContribution;
    }
}
