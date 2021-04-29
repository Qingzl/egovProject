package com.javalearning.service.regist.impl;

import com.github.pagehelper.PageHelper;
import com.javalearning.dao.regist.EnDao;
import com.javalearning.dao.regist.En_invDao;
import com.javalearning.entity.regist.En;
import com.javalearning.entity.regist.En_inv;
import com.javalearning.pojo.Page;
import com.javalearning.service.regist.EnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class EnServiceImpl implements EnService {
    EnDao ed;
    En_invDao eid;
    Page p;

    @Autowired
    public EnServiceImpl(EnDao ed,En_invDao eid,Page p) {
        this.ed = ed;
        this.eid = eid;
        this.p = p;
    }

    @Override
    public En queryByOrgcode(String orgcode) {
        return ed.queryByOrgcode(orgcode);
    }

    @Override
    @Transactional
    public Page pageQuery(String orgcode, String cnname, String startdate, String enddate, String pageno) {
        //Page<En> p = new Page();
        p.setPageno(Integer.parseInt(pageno));
        List<En> ens = ed.pageQuery(orgcode,cnname,startdate,enddate);
        p.setTotalsize(ens.size());
        p.setTotalpage((p.getTotalsize()%p.getPagesize())==0?p.getTotalsize()/p.getPagesize():p.getTotalsize()/p.getPagesize()+1);
        PageHelper.startPage(Integer.parseInt(pageno),p.getPagesize());
        List<En> ens1 = ed.pageQuery(orgcode,cnname,startdate,enddate);
        p.setInvs(ens1);
        return p;
    }

    @Override
    @Transactional
    public int insertEnAndEn_inv(En en, List<En_inv> en_invs) {
        int res1 = ed.insertEn(en);
        int res2 = eid.insertEn_invs(en_invs);
        if ((res1+res2) != (1+en_invs.size())){
            return 0;
        }
        return res1+res2;
    }
}
