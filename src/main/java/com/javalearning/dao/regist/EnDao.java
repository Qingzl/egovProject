package com.javalearning.dao.regist;

import com.javalearning.entity.regist.En;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EnDao {
    En queryByOrgcode(@Param("orgcode_p") String orgcode);
    List<En> pageQuery(@Param("oc") String orgcode, @Param("cn") String cnname, @Param("sd") String startdate, @Param("ed") String enddate);
    int insertEn(En en);
}
