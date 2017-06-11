package com.action;

import com.bean.ManagerBean;
import com.bean.StudentBean;
import com.dao.CommonDao;
import com.dao.StudentDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/4.
 */
public class ChangeStudent {
    private String name;
    private String id;
    private String phonenum;
    private String building;
    private String room;

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {

        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBuilding() {
        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getPhonenum() {

        return phonenum;
    }

    public void setPhonenum(String phonenum) {
        this.phonenum = phonenum;
    }

    public void changeStudent() {
        HttpSession session = ServletActionContext.getRequest().getSession();
        StudentBean  s = new StudentBean();
        id = session.getAttribute("changestudentPid").toString();
        s.setS_Name(name);
        s.setS_Phonenum(phonenum);
        s.setS_Building(building);
        s.setS_Room(room);
        new StudentDao().changeStudent(s, id);
    }
}
