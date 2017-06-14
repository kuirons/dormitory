package com.action;

import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.StudentDao;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by Admin on 2017/6/14.
 */
public class GetStudentInfo {
    private StudentBean stuInfo;

    public StudentBean getstuInfo() {
        return stuInfo;
    }

    public void setstuInfo(StudentBean stuInfo) {
        this.stuInfo = stuInfo;
    }

    public void getStudentInfo(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            stuInfo=new StudentDao().getStudentInfo(((UserBean)session.getAttribute("userinfo")).getUsername());
            JSONObject jso=new JSONObject();
            jso.put("S_Name",stuInfo.getS_Name());
            jso.put("S_Id",stuInfo.getS_Id());
            jso.put("S_Phonenum",stuInfo.getS_Phonenum());
            jso.put("S_Building",stuInfo.getS_Building());
            jso.put("S_Room",stuInfo.getS_Room());
            jso.put("S_Information",stuInfo.getS_Information());
            out.write(jso.toString());
            out.flush();
            out.close();
        }catch (Exception e){

        }
    }
}
