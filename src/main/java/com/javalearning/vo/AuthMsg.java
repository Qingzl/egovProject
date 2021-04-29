package com.javalearning.vo;

public class AuthMsg {
    private String authno;
    private String regdate;
    private String regcry;
    private String regcap;
    private String contactman;
    private String contacttel;
    private String feedback;

    public String getAuthno() {
        return authno;
    }

    public void setAuthno(String authno) {
        this.authno = authno;
    }

    public String getRegdate() {
        return regdate;
    }

    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public String getRegcry() {
        return regcry;
    }

    public void setRegcry(String regcry) {
        this.regcry = regcry;
    }

    public String getRegcap() {
        return regcap;
    }

    public void setRegcap(String regcap) {
        this.regcap = regcap;
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

    public String getFeedback() {
        return feedback;
    }

    public void setFeedback(String feedback) {
        this.feedback = feedback;
    }

    public AuthMsg() {
    }

    public AuthMsg(String authno, String regdate, String regcry, String regcap, String contactman, String contacttel, String feedback) {
        this.authno = authno;
        this.regdate = regdate;
        this.regcry = regcry;
        this.regcap = regcap;
        this.contactman = contactman;
        this.contacttel = contacttel;
        this.feedback = feedback;
    }
}
