package com.dao;
import com.bean.*;
import com.db.DBHelper;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by kh on 2017/5/25.
 */
public class CommonDao {
    //该函数获取迁入迁出请求表，第一个参数时用户的类型，第二个参数时用户所属的栋号
    public List<MigrateBean> getMigrate(String usertype,String buildingnum){
        List<MigrateBean> list=new ArrayList<MigrateBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql=null;
        if(usertype.equals("系统管理员")){
            sql="select * from T_Migrate";
        }
        else{
            sql="select * from T_Migrate where M_Bulding='"+buildingnum+"'";
        }
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                MigrateBean m=new MigrateBean();
                m.setM_Bulding(rs.getString("M_Bulding"));
                m.setM_Id(rs.getString("M_Id"));
                m.setM_Name(rs.getString("M_Name"));
                m.setM_Reason(rs.getString("M_Reason"));
                m.setM_Room(rs.getString("M_Room"));
                m.setM_Time(rs.getString("M_Time"));
                m.setM_Type(rs.getString("M_Type"));
                list.add(m);
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

    //根据用户名获取用户全部信息(搜索)
    public ManagerBean getManagerInfo(String username){
        ManagerBean ma=new ManagerBean();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Manager where M_Name='"+username+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                ma.setM_Building(rs.getString("M_Building"));
                ma.setM_Id(rs.getString("M_Id"));
                ma.setM_Informatrion(rs.getString("M_Information"));
                ma.setM_Name(rs.getString("M_Name"));
                ma.setM_Phonenum(rs.getString("M_Phonenum"));
                ma.setM_Time(rs.getDate("M_Time").toString());
                ma.setM_Type(rs.getString("M_Type"));
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

    //获取全部宿舍管理员信息供系统管理员使用
    public List<ManagerBean> getAllManagerInfo(){
        List<ManagerBean> list=new ArrayList<ManagerBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Manager where M_Type='宿舍管理员' order by M_Time";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                ManagerBean ma=new ManagerBean();
                ma.setM_Building(rs.getString("M_Building"));
                ma.setM_Id(rs.getString("M_Id"));
                ma.setM_Informatrion(rs.getString("M_Information"));
                ma.setM_Name(rs.getString("M_Name"));
                ma.setM_Phonenum(rs.getString("M_Phonenum"));
                ma.setM_Time(rs.getDate("M_Time").toString());
                ma.setM_Type(rs.getString("M_Type"));
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

    //0表示按用户名称获取用户发送过的公告，1表示获取某栋的公告表
    public List<AnnouncementBean> getAnnouncementList(String usertype,String username,String buildingnum,int flag){
        List<AnnouncementBean> list=new ArrayList<AnnouncementBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql=null;
        if(flag==0){
            sql="select * from T_Announcement where A_UName ='"+username+"' order by A_Time DESC";
        }
        else{
            if(usertype.equals("系统管理员")){
                sql="select * from T_Announcement order by A_Time DESC";
            }
            else{
                sql="select * from T_Announcement where A_Building='"+buildingnum+"' order by A_Time DESC";
            }
        }
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                AnnouncementBean a=new AnnouncementBean();
                a.setA_Content(rs.getString("A_Content"));
                a.setA_Id(rs.getString("A_Id"));
                a.setA_Title(rs.getString("A_Title"));
                a.setA_UName(rs.getString("A_UName"));
                a.setA_UType(rs.getString("A_UType"));
                a.setA_Building(rs.getString("A_Building"));
                a.setA_Time(rs.getString("A_Time"));
                list.add(a);
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
    //搜索
    public List<ManagerBean> searchManagerInfo(String username){
        List<ManagerBean> list=new ArrayList<ManagerBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Manager where M_Name='"+username+"'";
        try{
            stat=conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                ManagerBean ma=new ManagerBean();
                ma.setM_Building(rs.getString("M_Building"));
                ma.setM_Id(rs.getString("M_Id"));
                ma.setM_Informatrion(rs.getString("M_Information"));
                ma.setM_Name(rs.getString("M_Name"));
                ma.setM_Phonenum(rs.getString("M_Phonenum"));
                ma.setM_Time(rs.getDate("M_Time").toString());
                ma.setM_Type(rs.getString("M_Type"));
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
//增加
    public void addManager(ManagerBean m){
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_Manager(M_Name,M_Time,M_Phonenum,M_Information,M_Building,M_Type) values('"+m.getM_Name()+"',to_date('"+m.getM_Time()+"','yyyy-mm-dd'),'"+m.getM_Phonenum()+"','"+m.getM_Informatrion()+"','"+m.getM_Building()+"','宿舍管理员')";
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

    //修改
    public void changeManager(ManagerBean m,String username){
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Manager set M_Time=to_date('"+m.getM_Time()+"','yyyy-mm-dd'),M_Phonenum='"+m.getM_Phonenum()+"',M_Information='"+m.getM_Informatrion()+"',M_Building='"+m.getM_Building()+"' where M_Name='"+username+"'";
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

    //删除管理员
    public void deleteManager(String username){
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="delete from T_Manager where M_Name='"+username+"'";
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
        CommonDao test=new CommonDao();
        System.out.print(test.getManagerInfo("管理员").getM_Informatrion());
    }

    public void changeMangerInformation(ManagerBean ma) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="update T_Manager set M_Phonenum='"+ma.getM_Phonenum()+"',M_Information='"+ma.getM_Informatrion()+"' where M_Name='"+ma.getM_Name()+"'";
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
