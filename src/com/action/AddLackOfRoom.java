package com.action;

import com.bean.LackOfRoomBean;
import com.dao.LackOfRoomDao;

/**
 * Created by Admin on 2017/6/9.
 */
public class AddLackOfRoom {
    private String time;
    private String id;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getTime() {

        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }
    public void execute() throws Exception{
        LackOfRoomBean la=new LackOfRoomBean();
        la.setL_Sid(id);
        la.setL_Time(time);
        new LackOfRoomDao().addLackOfRoom(la);
    }
}
