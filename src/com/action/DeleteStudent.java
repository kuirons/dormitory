package com.action;

import com.dao.CommonDao;
import com.dao.StudentDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/4.
 */
public class DeleteStudent {
    private String username;

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        new StudentDao().deleteStudent(username);
    }

}
