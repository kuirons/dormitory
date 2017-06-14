package com.action;

import com.bean.BuildingBean;
import com.bean.ManagerBean;
import com.bean.StudentBean;
import com.dao.BuildingDao;
import com.dao.CommonDao;
import com.dao.StudentDao;

/**
 * Created by Admin on 2017/6/4.
 */
public class AddStudent {
    private String id;
    private String username;
    private String phonenum;
    private String information;
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



    public String getUsername() {

        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void addStudent() {
        StudentBean s = new StudentBean();
        BuildingBean b=new BuildingDao().searchRoomInfoByBuildingAndRoom(building+"-"+room);
        s.setS_Name(username);
        s.setS_Id(id);
        s.setS_Phonenum(phonenum);
        s.setS_Information(information);
        s.setS_Building(building);
        s.setS_Room(room);
        new StudentDao().addStudent(s);
        //给新同学分配默认密码，密码为学号
        new StudentDao().giveNewStudentANewPassword(s);
        b.setB_Takenin(String.valueOf(Integer.parseInt(b.getB_Takenin())+1));
        b.setB_Allownum(String.valueOf(Integer.parseInt(b.getB_Allownum())-1));
        new BuildingDao().inChangeRoomInfo(b);
    }
}
