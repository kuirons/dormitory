package com.action;

import com.bean.ManagerBean;
import com.dao.CommonDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by kh on 2017/5/26.
 */
public class SearchManagerList {
    private String username;

    public List<ManagerBean> getList() {
        return list;
    }

    public void setList(List<ManagerBean> list) {
        this.list = list;
    }

    private List<ManagerBean> list;
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void searchManagerList(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter writer=response.getWriter();
            list =new CommonDao().searchManagerInfo(username);
            JSONArray jsa=new JSONArray();
            JSONObject jso=null;
            for(int i=0;i<list.size();i++){
                jso=new JSONObject();
                jso.put("M_Id",list.get(i).getM_Id());
                jso.put("M_Name",list.get(i).getM_Name());
                jso.put("M_Time",list.get(i).getM_Time());
                jso.put("M_Phonenum", list.get(i).getM_Phonenum());
                jso.put("M_Information",list.get(i).getM_Informatrion());
                jso.put("M_Building",list.get(i).getM_Building());
                jso.put("M_Type",list.get(i).getM_Type());
                jsa.add(jso);
            }
            writer.write(jsa.toString());
            writer.flush();
            writer.close();
        }catch (Exception e){

        }
    }
}
