package com.db;
import java.util.*;
import java.sql.*;

/**
 * Created by kh on 2017/4/26.
 */
public class DBHelper {
    private String dbUrl = "jdbc:oracle:thin:@localhost:1521:ORCL";
    private String dbUser = "dormitory";
    private String dbPassword = "123456";
    private String jdbcName = "oracle.jdbc.OracleDriver";

    //连接数据库
    public Connection getConn() {
        Connection conn = null;
        try {
            Class.forName(jdbcName);
        } catch (Exception e) {
        }
        try {
            conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
        } catch (SQLException ex) {
        }
        return conn;
    }

    //    测试
    public static void main(String[] args) {
        System.out.print(new DBHelper().getConn());
    }
}
