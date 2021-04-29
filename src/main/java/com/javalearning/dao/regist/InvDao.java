package com.javalearning.dao.regist;

import com.javalearning.entity.regist.Inv;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface InvDao {
    void addInv(Inv inv);
    Inv queryInvByInvname(@Param("in") String invname);
    Inv queryByInvregnum(@Param("ig") String invregnum);
    List<Inv> pagequery(@Param("irn_p") String invregnum,@Param("in_p") String invname,@Param("sd_p") String startdate,@Param("ed_p") String enddate);
}
