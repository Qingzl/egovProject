package com.javalearning.util;

import org.springframework.stereotype.Component;

import java.util.ResourceBundle;

@Component("rbu")
public class ResourceBoundleUtil {
    static ResourceBundle rb = ResourceBundle.getBundle("ResourceBoundleUtil");
    public String getStringByOrgtype(String orgtype){
        return rb.getString(orgtype);
    }
}
