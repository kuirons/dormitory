package com.dao;

import com.bean.UserBean;
import com.db.DBHelper;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by Admin on 2017/6/9.
 */
public class AnnouncementDao {
    public void addAnnouncement(String title, String content) {
        HttpSession session= ServletActionContext.getRequest().getSession();
        UserBean user=(UserBean) session.getAttribute("userinfo");
        String building=new CommonDao().getManagerInfo(user.getUsername()).getM_Building();
        Date date=new Date();
        DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time=format.format(date);
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_Announcement(A_Title,A_Content,A_UType,A_UName,A_Building,A_Time) values('"+title+"','"+content+"','"+user.getUsertype()+"','"+user.getUsername()+"','"+building+"',to_date('"+time+"','yyyy-mm-dd hh24:mi:ss'))";
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
