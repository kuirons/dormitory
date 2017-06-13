package com.action;

import com.bean.MessageBean;
import com.bean.UserBean;
import com.dao.MessageDao;
import com.dao.StudentDao;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by Admin on 2017/6/13.
 */
public class getThisUserAllMessage {
    private List<MessageBean> list;

    public List<MessageBean> getList() {
        return list;
    }

    public void setList(List<MessageBean> list) {
        this.list = list;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        HttpServletResponse response=ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        setList(new MessageDao().GetMessageList(((UserBean) (session.getAttribute("userinfo"))).getUsername()));
        JSONArray jsa=new JSONArray();
        for (int i = 0; i <list.size() ; i++) {
            JSONObject jso=new JSONObject();
            jso.put("M_Id",list.get(i).getM_Id());
            jso.put("M_Theme",list.get(i).getM_Theme());
            jso.put("M_From",list.get(i).getM_From());
            jso.put("M_To",list.get(i).getM_To());
            jso.put("M_Content",list.get(i).getM_Content());
            jso.put("M_Flag",list.get(i).getM_Flag());
            jsa.add(jso);
        }
        writer.write(jsa.toString());
        writer.flush();
        writer.close();
    }
}
