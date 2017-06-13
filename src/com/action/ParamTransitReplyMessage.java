package com.action;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/13.
 */
public class ParamTransitReplyMessage {
    private String to;

    public String getTo() {
        return to;
    }

    public void setTo(String to) {
        this.to = to;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute("messagetosomeone",to);
    }
}
