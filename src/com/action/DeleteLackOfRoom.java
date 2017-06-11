package com.action;

import com.dao.LackOfRoomDao;

/**
 * Created by Admin on 2017/6/9.
 */
public class DeleteLackOfRoom {
    private String id;
    private String time;

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public void execute() throws Exception{
        time=time.replace(".0","");
        new LackOfRoomDao().deleteLackOfRoomInfo(id,time);
    }
}
