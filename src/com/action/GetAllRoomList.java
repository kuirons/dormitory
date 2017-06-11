package com.action;

import com.bean.BuildingBean;
import com.bean.UserBean;
import com.dao.BuildingDao;
import com.dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Admin on 2017/6/5.
 */
public class GetAllRoomList {
    private List<BuildingBean> list;

    public List<BuildingBean> getList() {
        return list;
    }

    public void setList(List<BuildingBean> list) {
        this.list = list;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        setList(new BuildingDao().getAllRoomInfo(((UserBean) (session.getAttribute("userinfo")))));
        JSONArray jsa=new JSONArray();
        for (int i = 0; i <list.size() ; i++) {
            JSONObject jso=new JSONObject();
            jso.put("B_Id",list.get(i).getB_Id());
            jso.put("B_Room",list.get(i).getB_Room());
            jso.put("B_Takenin",list.get(i).getB_Takenin());
            jso.put("B_Maxnum",list.get(i).getB_Maxnum());
            jso.put("B_Allownum",list.get(i).getB_Allownum());
            jsa.add(jso);
        }
        writer.write(jsa.toString());
        writer.flush();
        writer.close();
    }

    public static void main(String[] args) {
    }
}
