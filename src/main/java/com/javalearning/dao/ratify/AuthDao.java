package com.javalearning.dao.ratify;

import com.javalearning.entity.ratify.Auth;
import com.javalearning.vo.AuthMsg;
import org.apache.ibatis.annotations.Param;

public interface AuthDao {
    int add(Auth auth);
    int setFeedback(@Param("an_p") Integer authno);
    AuthMsg queryAuthMsg(@Param("an") String authno);
}
