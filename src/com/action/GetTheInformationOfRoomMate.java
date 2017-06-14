package com.action;

import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.StudentDao;
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
public class GetTheInformationOfRoomMate {
    private List<StudentBean> list;

    public List<StudentBean> getList() {
        return list;
    }

    public void setList(List<StudentBean> list) {
        this.list = list;
    }

    public void execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        setList(new StudentDao().getStuInfoByBuildingAndRoom(session.getAttribute("thestudentinformation").toString()));
        JSONArray jsa = new JSONArray();
        for (int i = 0; i < list.size(); i++) {
            JSONObject jso = new JSONObject();
            jso.put("S_Id", list.get(i).getS_Id());
            jso.put("S_Name", list.get(i).getS_Name());
            jso.put("S_Phonenum", list.get(i).getS_Phonenum());
            jso.put("S_Building", list.get(i).getS_Building());
            jso.put("S_Room", list.get(i).getS_Room());
            jso.put("S_Information", list.get(i).getS_Information());
            jsa.add(jso);
        }
        writer.write(jsa.toString());
        writer.flush();
        writer.close();
    }
}
