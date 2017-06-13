package com.action;

import com.bean.MessageBean;
import com.bean.UserBean;
import com.dao.MessageDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/13.
 */
public class ReplyMessage {
    private String content;
    private String theme;
    private String flag;

    public String getFlag() {
        return flag;
    }

    public void setFlag(String flag) {
        this.flag = flag;
    }

    public String getTheme() {

        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public String getContent() {

        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        MessageBean m=new MessageBean();
        m.setM_Theme(theme);
        m.setM_From(((UserBean)session.getAttribute("userinfo")).getUsername());
        m.setM_To((session.getAttribute("messagetosomeone")).toString());
        m.setM_Content(content);
        m.setM_Flag(flag);
        new MessageDao().addMessage(m);
    }
}
