package com.javalearning.interceptor;

import com.javalearning.entity.system.User;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class IllegalLoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String uri = request.getRequestURI();
        HttpSession session = request.getSession(false);
        if ("/egov_002/".equals(uri) || uri.contains("login") || uri.endsWith(".js") || (session != null && ((User)session.getAttribute("user")) != null)) {
            return true;
        }
        response.sendRedirect("/egov_002/middle.jsp");
        return false;
    }
}
