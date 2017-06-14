package com.action;

import com.bean.RequestBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.RequestDao;
import com.dao.StudentDao;
import org.apache.struts2.ServletActionContext;
import org.omg.Messaging.SYNC_WITH_TRANSPORT;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/14.
 */
public class SendTheRequest {
    private String reason;
    private String type;
    private String building;
    private String room;

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getBuilding() {

        return building;
    }

    public void setBuilding(String building) {
        this.building = building;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getReason() {

        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        RequestBean r=new RequestBean();
        StudentBean stu=new StudentDao().getStudentInfo(((UserBean)session.getAttribute("userinfo")).getUsername());
        r.setR_Reason(reason);
        r.setR_From(stu.getS_Id());
        r.setR_Type(type);
        r.setR_Status("未处理");
        r.setR_Building(building);
        r.setR_Room(room);
        new RequestDao().addANewRequest(r);
    }
}
