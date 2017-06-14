<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/13
  Time: 22:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.bean.UserBean" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script src="Script/jquery-3.2.1.js"></script>
<script>
    $('#studentsubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#addstudentform").serialize(),
            url:"AddStudent.action",
            success:function (data2) {
                $('#main').load("ManageStu.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:'GetAllStuInfoList.action',
                        datatyoe:"json",
                        success:function (data) {
                            var json=JSON.parse(data)
                            for(var i=0;i<json.length;i++){
                                $('#showstuinfo').append('<tr><td>'+json[i]["S_Name"]+'</td><td>'+json[i]["S_Id"]+'</td><td>'+json[i]["S_Phonenum"]+'</td><td>'+(typeof(json[i]["S_Building"])=="undefined"?"":json[i]["S_Building"])+'-'+(typeof(json[i]["S_Room"])=="undefined"?"":json[i]["S_Room"])+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changestudent(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletestudent(this)">'+"删除"+' </td></tr>')
                            }

                        },
                        error:function () {
                            alert("加载学生信息错误")
                        }
                    })
                })
            },
            error:function () {
                alert("添加学生失败")
            }
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="addstudentform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="学号..." name="id">
                        <br>
                        <input type="text" class="form-control" placeholder="学生姓名..." name="username">
                        <br>
                        <input type="text" class="form-control" placeholder="电话号码..." name="phonenum">
                        <br>
                        <textarea class="form-control" placeholder="个人简介..." rows="4" name="information"></textarea>
                        <br>
                        <select class="form-control" name="building">
                            <option value="">请选择...</option>
                            <option value=<%=session.getAttribute("thebuildingforselectvalue") %>><%=session.getAttribute("thebuildingforselectvalue")%></option>
                        </select>
                        <br>
                        <input type="text" class="form-control" placeholder="寝室号..." name="room"></textarea>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="studentsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>
