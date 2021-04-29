package com.javalearning.entity.ratify;

public class Auth {
  private Integer authno;
  private String orgcode;
  private String remark;
  private String contactman;
  private String contacttel;
  private String filename;
  private String fileremark;
  private String usercode;
  private String feedback;

    public Integer getAuthno() {
        return authno;
    }

    public void setAuthno(Integer authno) {
        this.authno = authno;
    }

    public String getOrgcode() {
        return orgcode;
    }

    public void setOrgcode(String orgcode) {
        this.orgcode = orgcode;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getFileremark() {
        return fileremark;
    }

    public void setFileremark(String fileremark) {
        this.fileremark = fileremark;
    }

    public String getUsercode() {
        return usercode;
    }

    public void setUsercode(String usercode) {
        this.usercode = usercode;
    }

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public Auth(Integer authno, String orgcode, String remark, String contactman, String contacttel, String filename, String fileremark, String usercode, String feedback) {
        this.authno = authno;
        this.orgcode = orgcode;
        this.remark = remark;
        this.contactman = contactman;
        this.contacttel = contacttel;
        this.filename = filename;
        this.fileremark = fileremark;
        this.usercode = usercode;
        this.feedback = feedback;
    }

    public Auth() {
    }
}
