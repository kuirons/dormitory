package com.action;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/5.
 */
public class ParamTransitChangeBuilding {
    private String idroom;

    public String getIdroom() {
        return idroom;
    }

    public void setIdroom(String idroom) {
        this.idroom = idroom;
    }
    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute("changebuildingPidandroom",idroom);
    }
}
