package com.action;

import com.bean.UserBean;
import com.dao.CommonDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by Admin on 2017/6/13.
 */
public class ChangePassword {
    private String oldpassword;
    private String newpassword ;
    private String repeatnewpassword ;

    public String getRepeatnewpassword() {
        return repeatnewpassword;
    }

    public void setRepeatnewpassword(String repeatnewpassword) {
        this.repeatnewpassword = repeatnewpassword;
    }

    public String getNewpassword() {

        return newpassword;
    }

    public void setNewpassword(String newpassword) {
        this.newpassword = newpassword;
    }

    public String getOldpassword() {

        return oldpassword;
    }

    public void setOldpassword(String oldpassword) {
        this.oldpassword = oldpassword;
    }

    public void execute() throws Exception{
        HttpSession session=ServletActionContext.getRequest().getSession();
        HttpServletResponse response= ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        String username=(((UserBean)session.getAttribute("userinfo")).getUsername());
        String result;
        if (repeatnewpassword.equals(newpassword)) {
            if (new CommonDao().changeManagerPassword(oldpassword, newpassword, username)) {
                result = "修改成功，请重新登陆";
            } else {
                result = "提供信息错误，修改失败";
            }
        } else {
            result="输入不一致，请从新输入";
        }
        writer.write(result);
        writer.flush();
        writer.close();
    }
}
