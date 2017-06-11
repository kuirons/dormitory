package com.action;

import com.bean.ManagerBean;
import com.dao.CommonDao;
import com.sun.deploy.net.HttpResponse;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by kh on 2017/5/26.
 */
public class ChangeManager {
    private String username;
    private String time;
    private String phonenum;
    private String information;
    private String  building;

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getInformation() {
        return information;
    }

    public void setInformation(String information) {
        this.information = information;
    }

    public String getPhonenum() {

        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public String getTime() {

        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void changeManager(){
        HttpSession session=ServletActionContext.getRequest().getSession();
        ManagerBean m=new ManagerBean();
        username=session.getAttribute("changemanagerPusername").toString();
        m.setM_Type("宿舍管理员");
        m.setM_Time(time);
        m.setM_Phonenum(phonenum);
        m.setM_Informatrion(information);
        m.setM_Building(building);
        new CommonDao().changeManager(m,username);
    }
}
