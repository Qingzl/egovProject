package com.javalearning.controler.ratify;

import com.javalearning.entity.ratify.Auth;
import com.javalearning.service.ratify.AuthService;
import com.javalearning.vo.AuthMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
@RequestMapping("/auth")
public class AuthController {
    private AuthService as;

    @Autowired
    public AuthController(AuthService as) {
        this.as = as;
    }

    @RequestMapping("/add")
    public ModelAndView add(MultipartFile file, HttpServletRequest request,Auth auth) throws IOException {
        ModelAndView mv = new ModelAndView();
        boolean success = as.add(file,request,auth);
        mv.setViewName("redirect:/auth/inputOrg.jsp"+(success?"":"?success=false"));
        return mv;
    }

    @RequestMapping("/query")
    @ResponseBody
    public Object query(String authno, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AuthMsg am = as.queryAuthMsg(authno);
        if (Integer.parseInt(am.getFeedback()) == 0){
            request.setAttribute("am",am);
            request.getRequestDispatcher("/authresponse/authResponseView.jsp").forward(request,response);
            return null;
        }else{
            return false;
        }
    }

    @RequestMapping("setFeedback")
    public ModelAndView setFeedBack(Integer authno){
        ModelAndView mv = new ModelAndView();
        Integer res = as.setFeedBack(authno);
        mv.setViewName("redirect:/authresponse/authResponseList.jsp?res="+res);
        return mv;
    }
}
