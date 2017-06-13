package com.action;

import com.sun.deploy.net.HttpResponse;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/13.
 */
public class Logout {
    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.invalidate();
    }
}
