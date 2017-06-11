package com.action;

import com.bean.BuildingBean;
import com.dao.BuildingDao;
import com.dao.CommonDao;

/**
 * Created by Admin on 2017/6/5.
 */
public class AddRoom {
    private String id;
    private String room;
    private String maxnum;

    public String getMaxnum() {
        return maxnum;
    }

    public void setMaxnum(String maxnum) {
        this.maxnum = maxnum;
    }

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

    public void addRoom(){
        BuildingBean b=new BuildingBean();
        b.setB_Id(id);
        b.setB_Room(room);
        b.setB_Takenin("0");
        b.setB_Maxnum(maxnum);
        b.setB_Allownum(maxnum);
        new BuildingDao().addRoom(b);
    }
}
