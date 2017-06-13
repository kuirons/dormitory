package com.action;

import com.bean.UserBean;
import com.dao.UserDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by kh on 2017/4/27.
 */
public class GoLogin {
    private String msg;
    private String username;
    private String password;
    private String usertype;

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getPassword() {

        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getMsg() {

        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String execute() throws Exception {
        if (null == new UserDao().CheckLogin(username, password, usertype)) {
            System.out.println("获取用户信息失败");
            setMsg("登陆失败，用户名或密码错误");
            return "error";
        } else {
            HttpSession session = ServletActionContext.getRequest().getSession();
            UserBean userinfo=new UserDao().CheckLogin(username,password,usertype);
            session.setAttribute("userinfo",userinfo);
            return "success";
        }
    }
}
