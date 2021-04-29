package com.javalearning.exceptionHandler;

import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.beans.factory.support.ManagedArray;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(JsonProcessingException.class)
    public ModelAndView jsMethod(Exception e){
        ModelAndView mv = new ModelAndView();
        mv.addObject("errorTip","查询用户失败");
        String details = e.getMessage();
        mv.addObject("details",details);
        mv.setViewName("forward:/error.jsp");
        return mv;
    }
}
