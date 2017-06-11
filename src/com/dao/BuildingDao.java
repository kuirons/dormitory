package com.dao;

import com.bean.BuildingBean;
import com.bean.BuildingBean;
import com.bean.BuildingBean;
import com.bean.UserBean;
import com.db.DBHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2017/6/5.
 */
public class BuildingDao {
    public List<BuildingBean> getAllRoomInfo(UserBean userinfo) {
        List<BuildingBean> list = new ArrayList<BuildingBean>();
        Statement statement = null;
        ResultSet resultSet = null;
        Connection connection = new DBHelper().getConn();
        String sql;
        if ("系统管理员".equals(userinfo.getUsertype())) {
            sql = "select * from T_Building";
        } else {
            sql = "select * from T_Building where B_Id='" + (new CommonDao().getManagerInfo(userinfo.getUsername())).getM_Building() + "'";
        }
        try {
            statement = connection.createStatement();
            resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                BuildingBean building = new BuildingBean();
                building.setB_Id(resultSet.getString("B_Id"));
                building.setB_Room(resultSet.getString("B_Room"));
                building.setB_Takenin(resultSet.getString("B_Takenin"));
                building.setB_Maxnum(resultSet.getString("B_Maxnum"));
                building.setB_Allownum(resultSet.getString("B_Allownum"));
                list.add(building);
            }
        } catch (SQLException ex) {

        } finally {
            try {
                if (connection != null) {
                    connection.close();
                }
                if (resultSet != null) {
                    resultSet.close();
                }
                if (statement != null) {
                    statement.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;

    }

    public List<BuildingBean> searchRoomInfo(String id) {
        List<BuildingBean> list = new ArrayList<BuildingBean>();
        Statement stat = null;
        ResultSet rs = null;
        Connection conn = new DBHelper().getConn();
        String sql = "select * from T_Building where B_Id='" + id.split("-")[0]+'栋' + "' and B_Room='" + id.split("-")[1] + "'";
        try {
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);
            while (rs.next()) {
                BuildingBean b = new BuildingBean();
                b.setB_Id(rs.getString("B_Id"));
                b.setB_Room(rs.getString("B_Room"));
                b.setB_Takenin(rs.getString("B_Takenin"));
                b.setB_Maxnum(rs.getString("B_Maxnum"));
                b.setB_Allownum(rs.getString("B_Allownum"));
                list.add(b);
            }
        } catch (SQLException ex) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stat != null) {
                    stat.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public BuildingBean searchRoomInfoByBuildingAndRoom(String idandroom) {
        Statement stat = null;
        ResultSet rs = null;
        BuildingBean b = new BuildingBean();
        Connection conn = new DBHelper().getConn();
        String sql = "select * from T_Building where B_Id='" + idandroom.split("-")[0] + "' and B_Room='" + idandroom.split("-")[1] + "'";
        try {
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);
            while (rs.next()) {
                b.setB_Id(rs.getString("B_Id"));
                b.setB_Room(rs.getString("B_Room"));
                b.setB_Takenin(rs.getString("B_Takenin"));
                b.setB_Maxnum(rs.getString("B_Maxnum"));
                b.setB_Allownum(rs.getString("B_Allownum"));
            }
        } catch (SQLException ex) {
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stat != null) {
                    stat.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return b;
    }

    public void addRoom(BuildingBean b) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_Building(B_Id,B_Room,B_Takenin,B_Maxnum,B_Allownum) values('"+b.getB_Id()+"','"+b.getB_Room()+"','"+b.getB_Takenin()+"','"+b.getB_Maxnum()+"','"+b.getB_Allownum()+"')";
        try{
            stat=conn.createStatement();
            stat.executeUpdate(sql);
        }catch (SQLException ex){
        }finally {
            try {
                if(rs!=null){
                    rs.close();
                }
                if(stat!=null){
                    stat.close();
                }
                if(conn!=null){
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }

    public void changeRoom(BuildingBean b, String idandroom) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Building set B_Takenin='"+b.getB_Takenin()+"',B_Maxnum='"+b.getB_Maxnum()+"',B_Allownum='"+b.getB_Allownum()+"' where B_Id='"+idandroom.split("-")[0]+"' and B_Room='"+idandroom.split("-")[1]+"'";
        try{
            stat=conn.createStatement();
            stat.executeUpdate(sql);
        }catch (SQLException ex){
        }finally {
            try {
                if(rs!=null){
                    rs.close();
                }
                if(stat!=null){
                    stat.close();
                }
                if(conn!=null){
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }

    public void deleteRoom(String idandroom) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="delete from T_Building where B_Id='"+idandroom.split("-")[0]+"' and B_Room='"+idandroom.split("-")[1]+"'";
        try{
            stat=conn.createStatement();
            stat.executeUpdate(sql);
        }catch (SQLException ex){
        }finally {
            try {
                if(rs!=null){
                    rs.close();
                }
                if(stat!=null){
                    stat.close();
                }
                if(conn!=null){
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }

    public void inChangeRoomInfo(BuildingBean building) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Building set B_Takenin='"+building.getB_Takenin()+"',B_Allownum='"+building.getB_Allownum()+"' where B_Id='"+building.getB_Id()+"' and B_Room='"+building.getB_Room()+"'";
        try{
            stat=conn.createStatement();
            stat.executeUpdate(sql);
        }catch (SQLException ex){
        }finally {
            try {
                if(rs!=null){
                    rs.close();
                }
                if(stat!=null){
                    stat.close();
                }
                if(conn!=null){
                    conn.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}
