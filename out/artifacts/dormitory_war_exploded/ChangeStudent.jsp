<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/4
  Time: 22:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.bean.UserBean" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="en">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
</head>
<script src="Script/jquery-3.2.1.js"></script>
<script>
    $('#cstudentsubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#changestudentform").serialize(),
            url:"ChangeStudent.action",
            success:function (data) {
                $('#main').load("ManageStu.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:'GetAllStuInfoList.action',
                        datatyoe:"json",
                        success:function (data) {
                            var json=JSON.parse(data)
                            for(var i=0;i<json.length;i++){
                                $('#showstuinfo').append('<tr><td>'+json[i]["S_Name"]+'</td><td>'+json[i]["S_Id"]+'</td><td>'+json[i]["S_Phonenum"]+'</td><td>'+json[i]["S_Building"]+'-'+json[i]["S_Room"]+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changestudent(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletestudent(this)">'+"删除"+' </td></tr>')
                            }

                        },
                        error:function () {
                            alert("修改学生信息错误")
                        }
                    })
                })

            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="changestudentform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="您正在修改的学生学号为<%=session.getAttribute("changestudentPid")%>" name="id" readonly="readonly">
                        <br>
                        <input type="text" class="form-control" placeholder="姓名..." name="name">
                        <br>
                        <input type="text" class="form-control" placeholder="电话号码..." name="phonenum">
                        <br>
                        <select class="form-control" name="building">
                            <option value="1栋">1栋</option>
                            <option value="2栋">2栋</option>
                            <option value="3栋">3栋</option>
                            <option value="4栋">4栋</option>
                            <option value="5栋">5栋</option>
                            <option value="6栋">6栋</option>
                        </select>
                        <br>
                        <input type="text" class="form-control" placeholder="寝室号..." name="room">
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="cstudentsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>
