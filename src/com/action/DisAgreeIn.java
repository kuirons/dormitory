package com.action;

import com.bean.MessageBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.MessageDao;
import com.dao.RequestDao;
import com.dao.StudentDao;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;

/**
 * Created by Admin on 2017/6/8.
 */
public class DisAgreeIn {
    private String disagreereason;

    public String getDisagreereason() {
        return disagreereason;
    }

    public void setDisagreereason(String disagreereason) {
        this.disagreereason = disagreereason;
    }

    public void execute() throws Exception{
        HttpSession session= ServletActionContext.getRequest().getSession();
        String buildingandroom=session.getAttribute("disagreebuildingandroom").toString();
        String id=session.getAttribute("disagreeinid").toString();
        //处理参数中的<p>标签
        id=id.replace("<p>","");
        id=id.replace("</p>","");
        buildingandroom=buildingandroom.replace("<p>","");
        buildingandroom=buildingandroom.replace("</p>","");
        StudentBean student=new StudentDao().getStudentInfoById(id);
        //用于通知学生处理结果的message
        MessageBean message=new MessageBean();
        //放入基本信息
        message.setM_From(((UserBean)session.getAttribute("userinfo")).getUsername());
        message.setM_To(student.getS_Name());
        //将该申请的状态改为已处理
        new RequestDao().inChangeThisRequestStatus(id,buildingandroom);
        //发送失败消息
        message.setM_Theme("请求失败");
        message.setM_Content(disagreereason);
        message.setM_Flag("3");
        new MessageDao().addMessage(message);
    }
}
