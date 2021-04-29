package com.javalearning.service.system;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.javalearning.entity.system.User;

import java.util.List;
import java.util.Map;

public interface UserService {
    int addUser(User u);
    Map<String,String> queryUsersByPage(Integer pageno) throws JsonProcessingException;
    User queryUserByUsercode(String usercode);
    int updateUser(User u);
    int deleteUser(String[] usercode);
    User login(String usercode,String userpswd,String orgtype);
}
