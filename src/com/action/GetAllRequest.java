package com.action;

import com.bean.RequestBean;
import com.bean.UserBean;
import com.dao.BuildingDao;
import com.dao.RequestDao;
import com.dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Admin on 2017/6/7.
 */
public class GetAllRequest {
    private List<RequestBean> list;

    public List<RequestBean> getList() {
        return list;
    }

    public void setList(List<RequestBean> list) {
        this.list = list;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        setList(new RequestDao().getAllRequest(((UserBean) (session.getAttribute("userinfo")))));
        JSONArray jsa=new JSONArray();
        for (int i = 0; i <list.size() ; i++) {
            JSONObject jso=new JSONObject();
            jso.put("R_Id",list.get(i).getR_id());
            jso.put("R_From",list.get(i).getR_From());
            jso.put("R_Reason",list.get(i).getR_Reason());
            jso.put("R_Type",list.get(i).getR_Type());
            jso.put("R_Status",list.get(i).getR_Status());
            jso.put("R_Building",list.get(i).getR_Building());
            jso.put("R_Room",list.get(i).getR_Room());
            jso.put("R_Name",(new StudentDao().getStudentInfoById(list.get(i).getR_From())).getS_Name());
            jsa.add(jso);
        }
        writer.write(jsa.toString());
        writer.flush();
        writer.close();
    }
}
