package com.javalearning.service.regist.impl;

import com.github.pagehelper.PageHelper;
import com.javalearning.dao.regist.InvDao;
import com.javalearning.entity.regist.Inv;
import com.javalearning.entity.system.User;
import com.javalearning.pojo.Page;
import com.javalearning.service.regist.InvService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class InvServiceImpl implements InvService {
    @Autowired
    private InvDao invDao;
    @Autowired
    private Page page;

    @Override
    public void addInv(Inv inv, HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        String usercode = ((User)session.getAttribute("user")).getUsercode();
        inv.setUsercode(usercode);
        String regdate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        inv.setRegdate(regdate);
        invDao.addInv(inv);
    }

    @Override
    public Inv queryInvByInvname(String invname) {
        return invDao.queryInvByInvname(invname);
    }

    @Override
    public Inv queryByInvregnum(String invregnum) {
        return invDao.queryByInvregnum(invregnum);
    }

    @Override
    @Transactional
    public Page pagequery(String invregnum, String invname, String startdate, String enddate,String pageno) {
        page.setPageno(Integer.parseInt(pageno));
        List<Inv> invs = invDao.pagequery(invregnum,invname,startdate,enddate);
        page.setTotalsize(invs.size());
        page.setTotalpage(page.getTotalsize()%page.getPagesize()==0?page.getTotalsize()/page.getPagesize():page.getTotalsize()/page.getPagesize()+1);
        PageHelper.startPage(Integer.parseInt(pageno),page.getPagesize());
        List<Inv> invs1 = invDao.pagequery(invregnum,invname,startdate,enddate);
        page.setInvs(invs1);
        return page;
    }
}
