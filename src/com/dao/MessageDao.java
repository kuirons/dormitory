package com.dao;

import java.sql.*;
import com.bean.*;
import java.util.*;
import com.db.DBHelper;

/**
 * Created by kh on 2017/5/18.
 */
public class MessageDao {
    public List<MessageBean> GetMessageList(String username){
        List<MessageBean> list=new ArrayList<MessageBean>();
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="select * from T_Message where M_To ='"+username+"'";
        try{
            stat= conn.createStatement();
            rs=stat.executeQuery(sql);
            while (rs.next()){
                MessageBean m=new MessageBean();
                m.setM_Id(rs.getString("M_Id"));
                m.setM_Theme(rs.getString("M_Theme"));
                m.setM_From(rs.getString("M_From"));
                m.setM_To(rs.getString("M_To"));
                m.setM_Content(rs.getString("M_Content"));
                m.setM_Flag(rs.getString("M_Flag"));
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
    //增加消息
    public void addMessage(MessageBean message) {
        Statement stat=null;
        ResultSet rs=null;
        Connection conn=new DBHelper().getConn();
        String sql="insert into T_Message(M_Theme,M_From,M_To,M_Content,M_Flag) values('"+message.getM_Theme()+"','"+message.getM_From()+"','"+message.getM_To()+"','"+message.getM_Content()+"','"+message.getM_Flag()+"')";
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
        MessageDao test=new MessageDao();
        if(test.GetMessageList("管理员")==null){
            System.out.print("获取失败");
        }
        else{
            List<MessageBean> testlist=test.GetMessageList("管理员");
            String s=testlist.get(1).getM_Theme();
            System.out.print(s);
        }
    }
}
