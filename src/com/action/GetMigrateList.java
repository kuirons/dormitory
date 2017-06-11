package com.action;

import com.bean.MigrateBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import com.dao.MessageDao;
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
public class GetMigrateList {
    private List<MigrateBean> list;

    public List<MigrateBean> getList() {
        return list;
    }

    public void setList(List<MigrateBean> list) {
        this.list = list;
    }

    public void getMigrateList(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter writer=response.getWriter();
            if(((UserBean)session.getAttribute("userinfo")).getUsertype().equals("系统管理员")){
                list=new CommonDao().getMigrate(((UserBean)session.getAttribute("userinfo")).getUsertype(),null);
            }
            else{
                list=new CommonDao().getMigrate(((UserBean)session.getAttribute("userinfo")).getUsertype(),new CommonDao().getManagerInfo(((UserBean)session.getAttribute("userinfo")).getUsername()).getM_Building());
            }
            JSONArray jsa=new JSONArray();
            JSONObject jso=null;
            for(int i=0;i<list.size();i++){
                jso=new JSONObject();
                jso.put("M_Id",list.get(i).getM_Id());
                jso.put("M_Name",list.get(i).getM_Name());
                jso.put("M_Time",list.get(i).getM_Time());
                jso.put("M_Reason", list.get(i).getM_Reason());
                jso.put("M_Type",list.get(i).getM_Type());
                jso.put("M_Building",list.get(i).getM_Bulding());
                jso.put("M_Room",list.get(i).getM_Room());
                jsa.add(jso);
            }
            writer.write(jsa.toString());
            writer.flush();
            writer.close();
        }catch (Exception e){

        }
    }
}
