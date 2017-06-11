package com.action;

import com.dao.BuildingDao;
import com.dao.CommonDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/5.
 */
public class DeleteRoom {
    private String idandroom;

    public String getIdandroom() {
        return idandroom;
    }

    public void setIdandroom(String idandroom) {
        this.idandroom = idandroom;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        new BuildingDao().deleteRoom(idandroom);
    }
}
