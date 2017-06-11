package com.action;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by kh on 2017/5/31.
 */
public class ParamTransitChangeManager {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute("changemanagerPusername",username);
    }
}
