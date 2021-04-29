package com.javalearning.dao.system;

import com.javalearning.entity.system.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface UserDao {
    int addUser(User u);
    int deleteUser(String[] usercode);
    int updateUser(User u);
    User queryUserByUsercode(@Param("usercodeParam") String usercode);
    List<User> queryAll();
    int queryUserAmount();
    User queryUserByUsercodeAndUserpswd(@Param("uc") String usercode,@Param("up") String userpswd,@Param("ot") String orgtype);
}
