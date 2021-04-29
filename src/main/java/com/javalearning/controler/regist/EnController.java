package com.javalearning.controler.regist;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.javalearning.entity.regist.En;
import com.javalearning.entity.regist.En_inv;
import com.javalearning.entity.system.User;
import com.javalearning.pojo.Page;
import com.javalearning.service.regist.EnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/en")
public class EnController {
    EnService es;

    @Autowired
    public EnController(EnService es) {
        this.es = es;
    }


    @RequestMapping("/querybyorgcode")
    public ModelAndView queryByOrgcode(String orgcode){
        ModelAndView mv = new ModelAndView();
        En en = es.queryByOrgcode(orgcode);
        if (en != null){
            mv.addObject("en","isNotExist");
            mv.setViewName("redirect:/foreignExchange/newInputOrg.jsp");
        }else{
            mv.addObject("orgcode",orgcode);
            mv.setViewName("redirect:/foreignExchange/inputOrgInfo.jsp");
        }
        return mv;
    }

    @RequestMapping("/query")
    public ModelAndView query(String orgcode) throws JsonProcessingException {
        ModelAndView mv = new ModelAndView();
        En en = es.queryByOrgcode(orgcode);
        String enJson = new ObjectMapper().writeValueAsString(en);
        mv.addObject("enJson",enJson);
        mv.setViewName("forward:/auth/openAccountAuthDetail.jsp");
        return mv;
    }

    @RequestMapping("/add")
    public ModelAndView addEnAndEn_inv(En en, @RequestParam("invregnum") String[] invregnums, @RequestParam("regcapinv") String[] regcaps, @RequestParam("scale") String[] scales, HttpServletRequest request){
        ModelAndView mv = new ModelAndView();
        en.setUsercode(((User)(request.getSession(false).getAttribute("user"))).getUsercode());
        en.setRegdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        List<En_inv> en_invs = new ArrayList<>();
        for (int i = 0; i < invregnums.length; i++) {
            En_inv en_inv = new En_inv();
            en_inv.setOrgcode(en.getOrgcode());
            en_inv.setInvregnum(invregnums[i]);
            en_inv.setRegcap(regcaps[i]);
            en_inv.setScale(scales[i]);
            en_invs.add(en_inv);
        }
        es.insertEnAndEn_inv(en,en_invs);
        mv.setViewName("redirect:/foreignExchange/newInputOrg.jsp");
        return mv;
    }

    @RequestMapping("/pagequery")
    @ResponseBody
    public Page pageQuery(String orgcode,String cnname,String startdate,String enddate,String pageno){
        return es.pageQuery(orgcode,cnname,startdate,enddate,pageno);
    }
}
