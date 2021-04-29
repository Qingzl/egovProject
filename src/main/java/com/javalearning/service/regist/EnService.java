package com.javalearning.service.regist;

import com.javalearning.entity.regist.En;
import com.javalearning.entity.regist.En_inv;
import com.javalearning.pojo.Page;

import java.util.List;

public interface EnService {
    En queryByOrgcode(String orgcode);
    Page pageQuery(String orgcode, String cnname, String startdate, String enddate,String pageno);
    int insertEnAndEn_inv(En en, List<En_inv> en_invs);
}
