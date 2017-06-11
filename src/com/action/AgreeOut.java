package com.action;

import com.bean.BuildingBean;
import com.bean.MessageBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.BuildingDao;
import com.dao.MessageDao;
import com.dao.RequestDao;
import com.dao.StudentDao;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by Admin on 2017/6/9.
 */
public class AgreeOut {
    private String id;
    private String buildingandroom;

    public String getBuildingandroom() {
        return buildingandroom;
    }

    public void setBuildingandroom(String buildingandroom) {
        this.buildingandroom = buildingandroom;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public void execute() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        //用于通知学生处理结果的message
        //处理参数中的<p>标签
        id = id.replace("<p>", "");
        id = id.replace("</p>", "");
        buildingandroom = buildingandroom.replaceAll("<p>", "");
        buildingandroom = buildingandroom.replaceAll("</p>", "");
        StudentBean student = new StudentDao().getStudentInfoById(id);
        MessageBean message = new MessageBean();
        //放入基本信息
        message.setM_From(((UserBean) session.getAttribute("userinfo")).getUsername());
        message.setM_To(student.getS_Name());
        //先修改原来寝室的信息
        BuildingBean building = new BuildingDao().searchRoomInfoByBuildingAndRoom(buildingandroom);
        building.setB_Allownum(String.valueOf(Integer.parseInt(building.getB_Allownum()) + 1));
        building.setB_Takenin(String.valueOf(Integer.parseInt(building.getB_Takenin()) - 1));
        new BuildingDao().inChangeRoomInfo(building);

        //发送成功消息
        message.setM_Theme("请求成功");
        message.setM_Content("您的请求已获批准，可搬出原寝室");
        message.setM_Flag("1");
        new MessageDao().addMessage(message);
        //然后将该申请的状态改为已处理
        new RequestDao().inChangeThisRequestStatus(id, buildingandroom);
    }
}
