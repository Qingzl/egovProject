package com.javalearning.controler.regist;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javalearning.entity.regist.Inv;
import com.javalearning.pojo.Page;
import com.javalearning.service.regist.InvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/inv")
public class InvRegistController {
    @Autowired
    private InvService is;

    @RequestMapping("/add")
    public ModelAndView add(Inv inv, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        is.addInv(inv,request);
        mv.setViewName("redirect:/basicinfo/exoticOrgList.jsp");
        return mv;
    }

    @RequestMapping("/query")
    @ResponseBody
    public Inv queryByInvname(String invname){
        return is.queryInvByInvname(invname);
    }


    @RequestMapping("/check")
    public ModelAndView check(String invregnum) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        Inv inv = is.queryByInvregnum(invregnum);
        String invJson = new ObjectMapper().writeValueAsString(inv);
        mv.addObject("invJson",invJson);
        mv.setViewName("redirect:/basicinfo/exoticOrgView.jsp");
        return mv;

    }


    @RequestMapping("/pagequery")
    @ResponseBody
    public Page pagequery(String invregnum, String invname, String startdate, String enddate,String pageno,HttpServletRequest request){
        Page page = is.pagequery(invregnum,invname,startdate,enddate,pageno);
        return page;
    }
}
