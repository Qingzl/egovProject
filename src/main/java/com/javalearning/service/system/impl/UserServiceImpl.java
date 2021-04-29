package com.javalearning.service.system.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.javalearning.dao.system.UserDao;
import com.javalearning.entity.system.User;
import com.javalearning.service.system.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.*;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;
    @Override
    public int addUser(User u) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = sdf.format(new Date());
        u.setRegdate(date);
        int res = userDao.addUser(u);
        return res;
    }

    @Transactional
    @Override
    public Map<String,String> queryUsersByPage(Integer pageno) throws JsonProcessingException {
       /* Map<String,Object> map = new HashMap<>();
        List<User> users = new ArrayList<>();
        PageHelper.startPage(pageno,pagesize);
        users = userDao.queryAll();
        int userAmount = userDao.queryUserAmount();
        if (users != null && userAmount > 0 ){
            map.put("users",users);
            map.put("userAmount",userAmount);
            return map;
        }
        return map;*/

        Map<String,String> map = new HashMap<>();
        String usersJson = "{}";
        final int pagesize  = 5;//pagesize：每页记录条数
        map.put("pagesize",String.valueOf(pagesize));
        PageHelper.startPage(pageno,pagesize);
        List<User> users = userDao.queryAll();
        if (users != null){
            usersJson = new ObjectMapper().writeValueAsString(users);
            map.put("usersJson",usersJson);
        }
        map.put("pageno",String.valueOf(pageno));//pageno：页码
        Integer usersAmount = userDao.queryUserAmount();
        map.put("usersAmount",String.valueOf(usersAmount));//usersAmount：总记录条数
        Integer pageAmount = usersAmount % pagesize==0 ? usersAmount/pagesize : usersAmount/pagesize+1;//pageAmount：总页数
        map.put("pageAmount",String.valueOf(pageAmount));
        return map;
    }

    @Override
    public User queryUserByUsercode(String usercode) {
        return userDao.queryUserByUsercode(usercode);
    }


    @Override
    public User login(String usercode, String userpswd, String orgtype) {
        return userDao.queryUserByUsercodeAndUserpswd(usercode,userpswd,orgtype);
    }

    @Override
    public int updateUser(User u) {
        return userDao.updateUser(u);
    }

    @Override
    public int deleteUser(String[] usercode) {
        return userDao.deleteUser(usercode);
    }
}
