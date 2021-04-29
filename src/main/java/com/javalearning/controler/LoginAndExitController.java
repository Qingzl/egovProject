package com.javalearning.controler;

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

@Controller
public class LoginAndExitController {
    @Autowired
    UserService us;

    @RequestMapping("/login")
    @ResponseBody
    public Integer login(String usercode, String userpswd, String orgtype, HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        User user = us.login(usercode,userpswd,orgtype);
        if (user != null){
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
        }
        return user==null?0:1;
    }

    @RequestMapping("/exit")
    public ModelAndView exit(HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        HttpSession session = request.getSession(false);
        session.invalidate();
        mv.setViewName("redirect:/login.jsp");
        return mv;
    }
}
