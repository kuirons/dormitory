package com.action;

import com.bean.BuildingBean;
import com.bean.MessageBean;
import com.bean.StudentBean;
import com.bean.UserBean;
import com.dao.BuildingDao;
import com.dao.MessageDao;
import com.dao.RequestDao;
import com.dao.StudentDao;
import net.sf.json.JSON;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * Created by Admin on 2017/6/7.
 */
public class AgreeIn {
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

    public void execute() throws Exception{
        HttpSession session=ServletActionContext.getRequest().getSession();
        //用于通知学生处理结果的message
        //处理参数中的<p>标签
        id=id.replace("<p>","");
        id=id.replace("</p>","");
        buildingandroom=buildingandroom.replaceAll("<p>","");
        buildingandroom=buildingandroom.replaceAll("</p>","");
        StudentBean student=new StudentDao().getStudentInfoById(id);
        MessageBean message=new MessageBean();
        //放入基本信息
        message.setM_From(((UserBean)session.getAttribute("userinfo")).getUsername());
        message.setM_To(student.getS_Name());
        JSONObject json=new JSONObject();
        HttpServletResponse response= ServletActionContext.getResponse();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer=response.getWriter();
        //判断用户申请的寝室是否还可以加入人
        BuildingBean buildingBean=new BuildingDao().searchRoomInfoByBuildingAndRoom(buildingandroom);
        int allownum=Integer.parseInt(buildingBean.getB_Allownum());
        if(allownum>0){
            //可以加入先修改原来寝室的信息
            BuildingBean building=new BuildingDao().searchRoomInfoByBuildingAndRoom(buildingandroom);
            building.setB_Allownum(String.valueOf(Integer.parseInt(building.getB_Allownum())+1));
            building.setB_Takenin(String.valueOf(Integer.parseInt(building.getB_Takenin())-1));
            new BuildingDao().inChangeRoomInfo(building);
            //然后修改新寝室的信息
            buildingBean.setB_Takenin(String.valueOf(Integer.parseInt(buildingBean.getB_Takenin())+1));
            buildingBean.setB_Allownum(String.valueOf(Integer.parseInt(buildingBean.getB_Allownum())-1));
            new BuildingDao().inChangeRoomInfo(buildingBean);
            //然后修改学生的信息
            student.setS_Building(buildingandroom.split("-")[0]);
            student.setS_Room(buildingandroom.split("-")[1]);
            new StudentDao().changeStudentRoomInfo(student);
            //返回结果成功
            json.put("message","迁入成功");
            //发送成功消息
            message.setM_Theme("请求成功");
            message.setM_Content("您的请求已获批准，可搬入申请的寝室");
            message.setM_Flag("1");
            new MessageDao().addMessage(message);
        }
        else{
            json.put("message","寝室人数已满，无法迁入");
            message.setM_Theme("请求成功,但请求寝室已满");
            message.setM_Content("您的请求已获批准，但是请求寝室人数已满，无法迁入");
            message.setM_Flag("2");
            new MessageDao().addMessage(message);
        }
        //然后将该申请的状态改为已处理
        new RequestDao().inChangeThisRequestStatus(id,buildingandroom);
        writer.write(json.toString());
        writer.flush();
        writer.close();
    }
}
