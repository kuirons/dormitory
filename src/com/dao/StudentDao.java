package com.dao;

import com.bean.StudentBean;
import com.bean.StudentBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.db.DBHelper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by kh on 2017/6/1.
 */
public class StudentDao {
    //获取全部学生列表
    public List<StudentBean> getAllStuInfo(UserBean userinfo){
        List<StudentBean> list=new ArrayList<StudentBean>();
        Statement statement=null;
        ResultSet resultSet=null;
        Connection connection=new DBHelper().getConn();
        String sql;
        if("系统管理员".equals(userinfo.getUsertype())){
            sql= "select * from T_Student";
        }
        else{
            sql="select * from T_Student where S_Building='"+(new CommonDao().getManagerInfo(userinfo.getUsername())).getM_Building()+"'";
        }
        try{
            statement=connection.createStatement();
            resultSet=statement.executeQuery(sql);
            while(resultSet.next()){
                StudentBean stu=new StudentBean();
                stu.setS_Building(resultSet.getString("S_Building"));
                stu.setS_Id(resultSet.getString("S_Id"));
                stu.setS_Name(resultSet.getString("S_Name"));
                stu.setS_Phonenum(resultSet.getString("S_Phonenum"));
                stu.setS_Room(resultSet.getString("S_Room"));
                stu.setS_Information(resultSet.getString("S_Information"));
                list.add(stu);
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

    //查找学生信息(使用姓名查找）
    public StudentBean getStudentInfo(String username){
        StudentBean ma=new StudentBean();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Student where S_Name='"+username+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                ma.setS_Building(rs.getString("S_Building"));
                ma.setS_Id(rs.getString("S_Id"));
                ma.setS_Information(rs.getString("S_Information"));
                ma.setS_Name(rs.getString("S_Name"));
                ma.setS_Phonenum(rs.getString("S_Phonenum"));
                ma.setS_Room(rs.getString("S_Room"));
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
        return ma;
    }

    public StudentBean getStudentInfoById(String id){
        StudentBean ma=new StudentBean();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Student where S_Id='"+id+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                ma.setS_Building(rs.getString("S_Building"));
                ma.setS_Id(rs.getString("S_Id"));
                ma.setS_Information(rs.getString("S_Information"));
                ma.setS_Name(rs.getString("S_Name"));
                ma.setS_Phonenum(rs.getString("S_Phonenum"));
                ma.setS_Room(rs.getString("S_Room"));
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
        return ma;
    }

    //查找学生信息
    public List<StudentBean> searchManagerInfo(String username){
        List<StudentBean> list=new ArrayList<StudentBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Student where S_Name='"+username+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                StudentBean ma=new StudentBean();
                ma.setS_Building(rs.getString("S_Building"));
                ma.setS_Id(rs.getString("S_Id"));
                ma.setS_Information(rs.getString("S_Information"));
                ma.setS_Name(rs.getString("S_Name"));
                ma.setS_Phonenum(rs.getString("S_Phonenum"));
                ma.setS_Room(rs.getString("S_Room"));
                list.add(ma);
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

    public void addStudent(StudentBean s){
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_Student(S_Id,S_Name,S_Phonenum,S_Information,S_Building,S_Room) values('"+s.getS_Id()+"','"+s.getS_Name()+"','"+s.getS_Phonenum()+"','"+s.getS_Information()+"','"+s.getS_Building()+"','"+s.getS_Room()+"')";
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


    public void deleteStudent(String username) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="delete from T_Student where S_Name='"+username+"'";
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

    public void changeStudent(StudentBean s, String id) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Student set S_Name='"+s.getS_Name()+"',S_Phonenum='"+s.getS_Phonenum()+"',S_Building='"+s.getS_Building()+"',S_Room='"+s.getS_Room()+"' where S_Id='"+id+"'";
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

    public static void main(String[] args) {
        List<StudentBean> list=new LinkedList<>();
        StudentDao test=new StudentDao();
        test.deleteStudent("test");
    }
}
