package com.dao;

import com.bean.LackOfRoomBean;
import com.db.DBHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2017/6/9.
 */
public class LackOfRoomDao {
    public List<LackOfRoomBean> getAllLackOfRoomInfo() {
        List<LackOfRoomBean> list=new ArrayList<LackOfRoomBean>();
        Statement statement=null;
        ResultSet resultSet=null;
        Connection connection=new DBHelper().getConn();
        String sql="select * from T_LackOfRoom";
        try{
            statement=connection.createStatement();
            resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                LackOfRoomBean la=new LackOfRoomBean();
                la.setL_Sid(resultSet.getString("L_Sid"));
                la.setL_Time(resultSet.getString("L_Time"));
                la.setL_Id(resultSet.getString("L_Id"));
                list.add(la);
            }
        }catch (SQLException ex){

        }finally {
            try{
                if(connection!=null){
                    connection.close();
                }
                if(resultSet!=null){
                    resultSet.close();
                }
                if(statement!=null){
                    statement.close();
                }
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
        return list;
    }

    public List<LackOfRoomBean> searchLackOfRoomInfo(String id) {
        List<LackOfRoomBean> list=new ArrayList<LackOfRoomBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_LackOfRoom where L_SId='"+id+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                LackOfRoomBean la=new LackOfRoomBean();
                la.setL_Id(rs.getString("L_Id"));
                la.setL_Sid(rs.getString("L_SId"));
                la.setL_Time(rs.getString("L_Time"));
                list.add(la);
            }
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
        return list;
    }

    public void addLackOfRoom(LackOfRoomBean la) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_LackOfRoom(L_Sid,L_Time) values('"+la.getL_Sid()+"',to_date('"+la.getL_Time()+"','yyyy-mm-dd hh24:mi:ss'))";
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

    public void deleteLackOfRoomInfo(String id, String time) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="delete from T_LackOfRoom where L_SId='"+id+"' and L_Time=to_date('"+time+"','yyyy-mm-dd hh24:mi:ss')";
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
