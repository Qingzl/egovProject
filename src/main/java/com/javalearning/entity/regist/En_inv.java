package com.javalearning.entity.regist;

public class En_inv {
    private String orgcode;
    private String invregnum;
    private String regcap;
    private String scale;

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getInvregnum() {
        return invregnum;
    }

    public void setInvregnum(String invregnum) {
        this.invregnum = invregnum;
    }

    public String getRegcap() {
        return regcap;
    }

    public void setRegcap(String regcap) {
        this.regcap = regcap;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public En_inv() {
    }

    public En_inv(String orgcode, String invregnum, String regcap, String scale) {
        this.orgcode = orgcode;
        this.invregnum = invregnum;
        this.regcap = regcap;
        this.scale = scale;
    }
}
