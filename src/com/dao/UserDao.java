package com.dao;

import com.db.DBHelper;
import java.sql.*;
import com.bean.UserBean;
/**
 * Created by Admin on 2017/4/26.
 */
public class UserDao {
    //验证登陆
    public UserBean CheckLogin(String username, String password, String usertype) {
        UserBean userinfo=new UserBean();
        Statement stat = null;
        ResultSet rs = null;
        String sql = "select * from T_Login where L_Name='" + username + "' and L_Password='" + password + "' and L_Usertype='" + usertype + "'";
        Connection conn = new DBHelper().getConn();
        try {
            stat = conn.createStatement();
            rs = stat.executeQuery(sql);
            while (rs.next()) {
                userinfo.setUserid(rs.getString("L_Id"));
                userinfo.setPassword(rs.getString("L_Password"));
                userinfo.setUsername(rs.getString("L_Name"));
                userinfo.setUsertype(rs.getString("L_Usertype"));
            }
        } catch (SQLException ex) {
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (rs != null) {
                    rs.close();
                }
                if (stat != null) {
                    stat.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return userinfo;
    }

    public static void main(String[] args) {
        UserDao test=new UserDao();
        System.out.print(test.CheckLogin("管理员","adminadmin","系统管理员"));
    }
}
