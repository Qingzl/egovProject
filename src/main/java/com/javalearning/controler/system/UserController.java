package com.javalearning.controler.system;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.javalearning.entity.system.User;
import com.javalearning.service.system.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/system/user")
public class UserController {
    @Autowired
    UserService us;
    @RequestMapping("/add")
    public ModelAndView addUser(User u){
        ModelAndView mv= new ModelAndView();
        int res = us.addUser(u);
        mv.addObject("pageno",1);
        mv.setViewName("redirect:/system/user/pagequery");
        return mv;
    }

    @RequestMapping(value="/pagequery")
    public ModelAndView queryUsers(Integer pageno) throws JsonProcessingException {
        /*ModelAndView mv= new ModelAndView();
        String usersJson = "{}";
        final int pagesize = 5;
        Map<String,Object> map = us.queryUsersByPage(pageno,pagesize);
        List<User> users = (List<User>) map.get("users");
        int usersAmount = (Integer) map.get("userAmount");
        ObjectMapper om = new ObjectMapper();
        usersJson = om.writeValueAsString(users);
        mv.addObject("usersJson",usersJson);
        mv.addObject("usersAmount",usersAmount);//记录条数
        int pageAmount = usersAmount % pagesize==0 ? usersAmount/pagesize : usersAmount/pagesize+1;
        mv.addObject("pageAmount",pageAmount);//一共有多少页
        mv.addObject("pageno",pageno);//页码
        mv.addObject("pagesize",pagesize);//每页记录的条数
        mv.setViewName("redirect:/system/user.jsp");
        return mv;*/

        ModelAndView mv = new ModelAndView();
        Map<String,String> map = new HashMap<>();
        map = us.queryUsersByPage(pageno);
        for (Map.Entry<String,String> m:map.entrySet()) {
            mv.addObject(m.getKey(),m.getValue());
        }
        mv.setViewName("redirect:/system/user.jsp");
        return mv;
    }

    @RequestMapping("/queryUserByUsercode")
    public ModelAndView queryUserByUsercode(String usercode,Integer updatePageno,HttpServletRequest request) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession();
        session.setAttribute("updatePageno",updatePageno);
        User user = us.queryUserByUsercode(usercode);
        String userJson = new ObjectMapper().writeValueAsString(user);
        mv.addObject("userJson",userJson);
        mv.setViewName("redirect:/system/userUpdate.jsp");
        return mv;
    }

    @RequestMapping("/update")
    public ModelAndView updateUser(User u,HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        Integer updatePageno = (Integer) session.getAttribute("updatePageno");
        us.updateUser(u);
        mv.addObject("pageno",updatePageno);
        mv.setViewName("redirect:/system/user/pagequery");
        return mv;
    }

    @RequestMapping("/delete")
    public ModelAndView deleteUser(String[] usercode){
        ModelAndView mv = new ModelAndView();
        us.deleteUser(usercode);
        mv.addObject("pageno",1);
        mv.setViewName("redirect:/system/user/pagequery");
        return mv;
    }

    @RequestMapping("/queryUserByAjax")
    @ResponseBody
    public Integer queryUserByAjax(String usercode){
        User u = us.queryUserByUsercode(usercode);
        return u!=null?1:0;
    }




    @RequestMapping("/test")
    @ResponseBody
    public Integer test(){
        Integer count = 1;
        return count;
    }
}
