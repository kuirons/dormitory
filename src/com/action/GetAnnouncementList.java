package com.action;

import com.bean.AnnouncementBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import jdk.nashorn.internal.runtime.regexp.joni.ast.AnchorNode;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by kh on 2017/5/25.
 */
public class GetAnnouncementList {
    private List<AnnouncementBean> list;

    public List<AnnouncementBean> getList() {
        return list;
    }

    public void setList(List<AnnouncementBean> list) {
        this.list = list;
    }

    public void getAnnouncementList(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter writer=response.getWriter();
            list =new CommonDao().getAnnouncementList(null,((UserBean)session.getAttribute("userinfo")).getUsername(),null,0);
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
