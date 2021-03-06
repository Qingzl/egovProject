package com.javalearning.entity.regist;

public class Inv {
    private String invregnum ;
    private String invname;
    private String cty;
    private String orgcode;
    private String contactman;
    private String contacttel;
    private String email;
    private String remark;
    private String usercode ;
    private String regdate;

    public String getInvregnum() {
        return invregnum;
    }

    public void setInvregnum(String invregnum) {
        this.invregnum = invregnum;
    }

    public String getInvname() {
        return invname;
    }

    public void setInvname(String invname) {
        this.invname = invname;
    }

    public String getCty() {
        return cty;
    }

    public void setCty(String cty) {
        this.cty = cty;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getContactman() {
        return contactman;
    }

    public void setContactman(String contactman) {
        this.contactman = contactman;
    }

    public String getContacttel() {
        return contacttel;
    }

    public void setContacttel(String contacttel) {
        this.contacttel = contacttel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public Inv() {
    }

    public Inv(String invregnum, String invname, String cty, String orgcode,
               String contactman, String contacttel, String email, String remark, String usercode, String regdate) {
        this.invregnum = invregnum;
        this.invname = invname;
        this.cty = cty;
        this.orgcode = orgcode;
        this.contactman = contactman;
        this.contacttel = contacttel;
        this.email = email;
        this.remark = remark;
        this.usercode = usercode;
        this.regdate = regdate;
    }
}
