package com.action;

import com.bean.LackOfRoomBean;
import com.bean.ManagerBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import com.dao.LackOfRoomDao;
import com.dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Admin on 2017/6/9.
 */
public class GetAllLackOfRoomList {
    private List<LackOfRoomBean> list;

    public List<LackOfRoomBean> getList() {
        return list;
    }

    public void setList(List<LackOfRoomBean> list) {
        this.list = list;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        setList(new LackOfRoomDao().getAllLackOfRoomInfo());
        JSONArray jsa=new JSONArray();
        UserBean userinfo=(UserBean) session.getAttribute("userinfo");
        ManagerBean manager=new CommonDao().getManagerInfo(userinfo.getUsername());
        for (int i = 0; i <list.size() ; i++) {
            JSONObject jso=new JSONObject();
            jso.put("L_Sid",list.get(i).getL_Sid());
            jso.put("L_Id",list.get(i).getL_Id());
            jso.put("L_Time",list.get(i).getL_Time());
            StudentBean stu=new StudentDao().getStudentInfoById(list.get(i).getL_Sid());
            jso.put("L_Name",stu.getS_Name());
            jso.put("L_Building",stu.getS_Building());
            jso.put("L_Room",stu.getS_Room());
            if ("系统管理员".equals(userinfo.getUsertype())) {
                jsa.add(jso);
            } else if (manager.getM_Building().equals(jso.getString("L_Building"))) {
                jsa.add(jso);
            }

        }
        writer.write(jsa.toString());
        writer.flush();
        writer.close();
    }
}
