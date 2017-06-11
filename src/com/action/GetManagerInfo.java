package com.action;

import com.bean.ManagerBean;
import com.bean.UserBean;
import com.dao.CommonDao;
import com.sun.deploy.net.HttpResponse;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by kh on 2017/5/25.
 */
public class GetManagerInfo {
    private ManagerBean mInfo;

    public ManagerBean getmInfo() {
        return mInfo;
    }

    public void setmInfo(ManagerBean mInfo) {
        this.mInfo = mInfo;
    }

    public void getManagerInfo(){
        try{
            HttpSession session= ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out=response.getWriter();
            mInfo=new CommonDao().getManagerInfo(((UserBean)session.getAttribute("userinfo")).getUsername());
            JSONObject jso=new JSONObject();
            jso.put("M_Id",mInfo.getM_Id());
            jso.put("M_Name",mInfo.getM_Name());
            jso.put("M_Time",mInfo.getM_Time());
            jso.put("M_Phonenum",mInfo.getM_Phonenum());
            jso.put("M_Information",mInfo.getM_Informatrion());
            jso.put("M_Building",mInfo.getM_Building());
            out.write(jso.toString());
            out.flush();
            out.close();
        }catch (Exception e){

        }
    }

//    public static void main(String[] args) {
//        GetManagerInfo test=new GetManagerInfo();
//        System.out.print(test.getManagerInfo());
//    }
}
