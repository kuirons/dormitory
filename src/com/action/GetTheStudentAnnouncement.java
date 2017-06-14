package com.action;

import com.bean.AnnouncementBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Admin on 2017/6/14.
 */
public class GetTheStudentAnnouncement {
    private List<AnnouncementBean> list;

    public List<AnnouncementBean> getList() {
        return list;
    }

    public void setList(List<AnnouncementBean> list) {
        this.list = list;
    }

    public void getTheStudentAnnouncementList(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter writer=response.getWriter();
            String b=(session.getAttribute("thestudentinformation").toString()).split("-")[0];
            list =new CommonDao().getAnnouncementList("学生",null,b,1);
            JSONArray jsa=new JSONArray();
            JSONObject jso=null;
            for(int i=0;i<list.size();i++){
                jso=new JSONObject();
                jso.put("A_Id",list.get(i).getA_Id());
                jso.put("A_Title",list.get(i).getA_Title());
                jso.put("A_Content",list.get(i).getA_Content());
                jso.put("A_UType", list.get(i).getA_UType());
                jso.put("A_UName",list.get(i).getA_UName());
                jso.put("A_Building",list.get(i).getA_Building());
                jso.put("A_Time",list.get(i).getA_Time());
                jsa.add(jso);
            }
            writer.write(jsa.toString());
            writer.flush();
            writer.close();
        }catch (Exception e){

        }
    }
}
