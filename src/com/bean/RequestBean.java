package com.bean;

/**
 * Created by Admin on 2017/6/7.
 */
public class RequestBean {
    private String R_id;
    private String R_From;
    private String R_Reason;
    private String R_Type;
    private String R_Status;
    private String R_Building;
    private String R_Room;
    //数据库中没有该字段，需要查询T_Student表获取该字段
    private String R_Name;

    public String getR_Name() {
        return R_Name;
    }

    public void setR_Name(String r_Name) {
        R_Name = r_Name;
    }

    public String getR_Room() {

        return R_Room;
    }

    public void setR_Room(String r_Room) {
        R_Room = r_Room;
    }

    public String getR_Building() {

        return R_Building;
    }

    public void setR_Building(String r_Building) {
        R_Building = r_Building;
    }

    public String getR_Status() {

        return R_Status;
    }

    public void setR_Status(String r_Status) {
        R_Status = r_Status;
    }

    public String getR_Type() {

        return R_Type;
    }

    public void setR_Type(String r_Type) {
        R_Type = r_Type;
    }

    public String getR_Reason() {

        return R_Reason;
    }

    public void setR_Reason(String r_Reason) {
        R_Reason = r_Reason;
    }

    public String getR_From() {

        return R_From;
    }

    public void setR_From(String r_From) {
        R_From = r_From;
    }

    public String getR_id() {

        return R_id;
    }

    public void setR_id(String r_id) {
        R_id = r_id;
    }
}
