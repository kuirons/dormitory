package com.dao;

import com.bean.RequestBean;
import com.bean.RequestBean;
import com.bean.UserBean;
import com.db.DBHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Admin on 2017/6/7.
 */
public class RequestDao {

    public List<RequestBean> getAllRequest(UserBean userinfo) {
        List<RequestBean> list=new ArrayList<RequestBean>();
        Statement statement=null;
        ResultSet resultSet=null;
        Connection connection=new DBHelper().getConn();
        String sql;
        if("系统管理员".equals(userinfo.getUsertype())){
            sql= "select * from T_Request";
        }
        else{
            sql="select * from T_Request where R_Building='"+(new CommonDao().getManagerInfo(userinfo.getUsername())).getM_Building()+"'";
        }
        try{
            statement=connection.createStatement();
            resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                RequestBean re=new RequestBean();
                re.setR_id(resultSet.getString("R_Id"));
                re.setR_From(resultSet.getString("R_From"));
                re.setR_Reason(resultSet.getString("R_Reason"));
                re.setR_Type(resultSet.getString("R_Type"));
                re.setR_Status(resultSet.getString("R_Status"));
                re.setR_Building(resultSet.getString("R_Building"));
                re.setR_Room(resultSet.getString("R_Room"));
                list.add(re);
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

    public void inChangeThisRequestStatus(String id, String buildingandroom) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Request set R_Status='已处理' where R_From='"+id+"' and R_Building='"+buildingandroom.split("-")[0]+"' and R_Room='"+buildingandroom.split("-")[1]+"'";
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
