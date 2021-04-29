package com.javalearning.service.ratify.Impl;

import com.javalearning.dao.ratify.AuthDao;
import com.javalearning.entity.ratify.Auth;
import com.javalearning.entity.system.User;
import com.javalearning.service.ratify.AuthService;
import com.javalearning.vo.AuthMsg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

@Service
public class AuthServiceImpl implements AuthService {
    private AuthDao ad;

    @Autowired
    public AuthServiceImpl(AuthDao ad) {
        this.ad = ad;
    }

    @Override
    public Boolean add(MultipartFile file, HttpServletRequest request,Auth auth) throws IOException {
        boolean success = true;
        String targetPath = request.getServletContext().getRealPath("/upFileDir");
        File targetPathFile = new File(targetPath);
        if (!targetPathFile.exists()){
            targetPathFile.mkdirs();
        }
        String name = file.getOriginalFilename();
        String upFileName = auth.getOrgcode() + name.substring(name.lastIndexOf("."));
        File upFile = new File(targetPath+"\\"+upFileName);
        file.transferTo(upFile);

        auth.setFilename(upFileName);
        auth.setUsercode(((User)(request.getSession(false).getAttribute("user"))).getUsercode());
        auth.setFeedback("0");
        Integer res = ad.add(auth);
        if (res != 1){
            upFile.delete();
            success = false;
        }
        return success;
    }

    @Override
    public int setFeedBack(Integer authno) {
        return ad.setFeedback(authno);
    }

    @Override
    public AuthMsg queryAuthMsg(String authno) {
        return ad.queryAuthMsg(authno);
    }
}
