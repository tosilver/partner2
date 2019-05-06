package co.b4pay.admin.entity;

import co.b4pay.admin.entity.base.BaseEntity;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/****
 * 商城地址权限控制
 * @author Tosdom
 */
public class MallAccessControl extends BaseEntity {


    private Long merchantId;                 //商户号
    private String merchantName;            //商户名称
    private String zfbAccess;          //支付宝通道集合
    //private String zfbAccessName;          //支付宝通道名称
    private String wxAccess;                //微信通道
    //private String wxAccessName;            //微信通道名称
    private String kjAccess;                //快捷通道
    //private String kjAccessName;            //快捷通道名称
    private String test;                    //预留字段


    public Long getMerchantId() {
        return merchantId;
    }

    public void setMerchantId(Long merchantId) {
        this.merchantId = merchantId;
    }

    public String getMerchantName() {
        return merchantName;
    }

    public void setMerchantName(String merchantName) {
        this.merchantName = merchantName;
    }

    /*public List<String> getZfbAccess() {
        if (zfbAccess == null) {
            zfbAccess = new ArrayList<String>();
        }
        return zfbAccess;
    }

    public void setZfbAccess(List<String> zfbAccess) {
        this.zfbAccess = zfbAccess;
    }

    public List<String> getWxAccess() {
        if (wxAccess == null) {
            wxAccess = new ArrayList<String>();
        }
        return wxAccess;
    }

    public void setWxAccess(List<String> wxAccess) {
        this.wxAccess = wxAccess;
    }

    public List<String> getKjAccess() {
        if (kjAccess == null) {
            kjAccess = new ArrayList<String>();
        }
        return kjAccess;
    }

    public void setKjAccess(List<String> kjAccess) {
        this.kjAccess = kjAccess;
    }*/


    public String getZfbAccess() {
        return zfbAccess;
    }

    public void setZfbAccess(String zfbAccess) {
        this.zfbAccess = zfbAccess;
    }

    public String getWxAccess() {
        return wxAccess;
    }

    public void setWxAccess(String wxAccess) {
        this.wxAccess = wxAccess;
    }

    public String getKjAccess() {
        return kjAccess;
    }

    public void setKjAccess(String kjAccess) {
        this.kjAccess = kjAccess;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

}
