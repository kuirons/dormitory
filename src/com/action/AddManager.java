package com.action;

import com.bean.ManagerBean;
import com.dao.CommonDao;

/**
 * Created by kh on 2017/5/26.
 */
public class AddManager {
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

    public void addManager(){
        ManagerBean m=new ManagerBean();
        m.setM_Name(username);
        m.setM_Type("宿舍管理员");
        m.setM_Time(time);
        m.setM_Phonenum(phonenum);
        m.setM_Informatrion(information);
        m.setM_Building(building);
        new CommonDao().addManager(m);
        //给新增的宿舍管理员分配默认的密码123456789
        new CommonDao().giveANewPasswordToNewManager(m);
    }
}
