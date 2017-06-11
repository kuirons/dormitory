package com.action;

import com.bean.MessageBean;
import com.bean.UserBean;
import com.dao.MessageDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;
import java.io.PrintWriter;
import java.util.List;

import java.io.*;
/**
 * Created by kh on 2017/5/18.
 */
public class Message {
    private List<MessageBean> listAll;

    private String result;
    public List<MessageBean> getListAll() {

        return listAll;
    }

    public void setListAll(List<MessageBean> listAll) {
        this.listAll = listAll;
    }

    public String getResult() {
        return result;
    }

    public void setResult(String result) {
        this.result = result;
    }

    public void myAjaxAction(){
        try {
            HttpSession session=ServletActionContext.getRequest().getSession();
            HttpServletResponse response=ServletActionContext.getResponse();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter writer=response.getWriter();
            listAll=new MessageDao().GetMessageList(((UserBean)session.getAttribute("userinfo")).getUsername());
            JSONArray jsa=new JSONArray();
            JSONObject jso=null;
            for(int i=0;i<listAll.size();i++){
                jso=new JSONObject();
                jso.put("M_Id",listAll.get(i).getM_Id());
                jso.put("M_Theme",listAll.get(i).getM_Theme());
                jso.put("M_From",listAll.get(i).getM_From());
                jso.put("M_To", listAll.get(i).getM_To());
                jso.put("M_Content",listAll.get(i).getM_Content());
                jso.put("M_Flag",listAll.get(i).getM_Flag());
                jsa.add(jso);
            }
            writer.write(jsa.toString());
            writer.flush();
            writer.close();
        }catch (Exception e){}
    }

//    public static void main(String[] args) {
//        Message test=new Message();
//        test.listAll=new MessageDao().GetMessageList("管理员");
//        JSONArray jsa=new JSONArray();
//        JSONObject jso=null;
//        for(int i=0;i<test.listAll.size();i++){
//            jso=new JSONObject();
//            jso.put("M_Id",test.listAll.get(i).getM_Id());
//            jso.put("M_Theme",test.listAll.get(i).getM_Theme());
//            jso.put("M_From",test.listAll.get(i).getM_From());
//            jso.put("M_To", test.listAll.get(i).getM_To());
//            jso.put("M_Content",test.listAll.get(i).getM_Content());
//            jso.put("M_Flag",test.listAll.get(i).getM_Flag());
//            jsa.add(jso);
//        }
//        System.out.print(jsa.toString());
//    }
}
