package com.action;

import com.bean.BuildingBean;
import com.dao.BuildingDao;
import com.dao.CommonDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/5.
 */
public class ChangeRoom {
    private String idroom;
    private String takenin;
    private String maxnum;
    private String idandroom;

    public String getMaxnum() {
        return maxnum;
    }

    public void setMaxnum(String maxnum) {
        this.maxnum = maxnum;
    }

    public String getTakenin() {

        return takenin;
    }

    public void setTakenin(String takenin) {
        this.takenin = takenin;
    }

    public String getIdroom() {

        return idroom;
    }

    public void setIdroom(String idroom) {
        this.idroom = idroom;
    }

    public void changeRoom(){
        int num=Integer.parseInt(maxnum)-Integer.parseInt(takenin);
        HttpSession session= ServletActionContext.getRequest().getSession();
        BuildingBean b=new BuildingBean();
        idandroom=session.getAttribute("changebuildingPidandroom").toString();
        b.setB_Id(idandroom.split("-")[0]);
        b.setB_Room(idandroom.split("-")[1]);
        b.setB_Takenin(takenin);
        b.setB_Maxnum(maxnum);
        b.setB_Allownum(Integer.toString(num));
        new BuildingDao().changeRoom(b,idandroom);
    }
}
