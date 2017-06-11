package com.action;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/8.
 */
public class ParamTransitDisagree {
    private String id;
    private String buildingandroom;

    public String getBuildingandroom() {
        return buildingandroom;
    }

    public void setBuildingandroom(String buildingandroom) {
        this.buildingandroom = buildingandroom;
    }

    public String getId() {

        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        session.setAttribute("disagreeinid",id);
        session.setAttribute("disagreebuildingandroom",buildingandroom);
    }
}
