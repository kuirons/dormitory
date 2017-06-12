package com.action;

import com.bean.ManagerBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/12.
 */
public class ChangeManagerInformation {
    private String newphonenum;
    private String newinformation;

    public String getNewinformation() {
        return newinformation;
    }

    public void setNewinformation(String newinformation) {
        this.newinformation = newinformation;
    }

    public String getNewphonenum() {

        return newphonenum;
    }

    public void setNewphonenum(String newphonenum) {
        this.newphonenum = newphonenum;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        ManagerBean ma= new ManagerBean();
        ma.setM_Name(((UserBean)session.getAttribute("userinfo")).getUsername());
        ma.setM_Phonenum(newphonenum);
        ma.setM_Informatrion(newinformation);
        new CommonDao().changeMangerInformation(ma);
    }
}

