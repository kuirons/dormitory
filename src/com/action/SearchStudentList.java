package com.action;

import com.bean.StudentBean;
import com.dao.CommonDao;
import com.dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by kh on 2017/6/3.
 */
public class SearchStudentList {
    private String username;

    private List<StudentBean> list;

    public List<StudentBean> getList() {
        return list;
    }

    public void setList(List<StudentBean> list) {
        this.list = list;
    }

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
            list =new StudentDao().searchManagerInfo(username);
            JSONArray jsa=new JSONArray();
            JSONObject jso=null;
            for(int i=0;i<list.size();i++){
                jso=new JSONObject();
                jso.put("S_Id",list.get(i).getS_Id());
                jso.put("S_Name",list.get(i).getS_Name());
                jso.put("S_Phonenum", list.get(i).getS_Phonenum());
                jso.put("S_Information",list.get(i).getS_Information());
                jso.put("S_Building",list.get(i).getS_Building());
                jso.put("S_Room",list.get(i).getS_Room());
                jsa.add(jso);
            }
            writer.write(jsa.toString());
            writer.flush();
            writer.close();
        }catch (Exception e){

        }
    }

    public static void main(String[] args) {
        SearchStudentList test=new SearchStudentList();
        test.setUsername("李华");
        test.searchManagerList();
    }
}
