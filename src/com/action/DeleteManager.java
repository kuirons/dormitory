package com.action;

import com.dao.CommonDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by kh on 2017/6/1.
 */
public class DeleteManager {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        new CommonDao().deleteManager(username);
    }
}
