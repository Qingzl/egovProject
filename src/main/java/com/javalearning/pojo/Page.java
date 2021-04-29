package com.javalearning.pojo;

import com.javalearning.entity.regist.Inv;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class Page<T> {
    private final Integer pagesize = 3;//每页记录条数
    private Integer pageno;//页码
    private Integer totalpage;//总页数
    private Integer totalsize;//总记录条数
    private List<T> invs;

    public Page() {
    }

    public Page(Integer pageno, Integer totalpage, Integer totalsize, List<T> invs) {
        this.pageno = pageno;
        this.totalpage = totalpage;
        this.totalsize = totalsize;
        this.invs = invs;
    }

    public Integer getPagesize() {
        return pagesize;
    }

    public Integer getPageno() {
        return pageno;
    }

    public void setPageno(Integer pageno) {
        this.pageno = pageno;
    }

    public Integer getTotalpage() {
        return totalpage;
    }

    public void setTotalpage(Integer totalpage) {
        this.totalpage = totalpage;
    }

    public Integer getTotalsize() {
        return totalsize;
    }

    public void setTotalsize(Integer totalsize) {
        this.totalsize = totalsize;
    }

    public List<T> getInvs() {
        return invs;
    }

    public void setInvs(List<T> invs) {
        this.invs = invs;
    }
}
