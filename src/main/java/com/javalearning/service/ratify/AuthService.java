package com.javalearning.service.ratify;

import com.javalearning.entity.ratify.Auth;
import com.javalearning.vo.AuthMsg;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

public interface AuthService {
    Boolean add(MultipartFile file, HttpServletRequest request,Auth auth) throws IOException;
    int setFeedBack(Integer authno);
    AuthMsg queryAuthMsg(String authno);
}
