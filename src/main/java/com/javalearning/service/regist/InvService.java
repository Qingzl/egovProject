package com.javalearning.service.regist;

import com.javalearning.entity.regist.Inv;
import com.javalearning.pojo.Page;

import javax.servlet.http.HttpServletRequest;

public interface InvService {
    void addInv(Inv inv, HttpServletRequest request);
    Inv queryInvByInvname(String invname);
    Inv queryByInvregnum(String invregnum);
    Page pagequery(String invregnum, String invname, String startdate, String enddate,String pageno);
}
