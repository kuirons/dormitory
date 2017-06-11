<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/9
  Time: 15:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ page import="com.bean.UserBean" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<script src="Script/jquery-3.2.1.js"></script>
<script>
    $('#lackofroomsubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#addlackofroomform").serialize(),
            url:"AddLackOfRoom.action",
            success:function (data2) {
                $('#main').load("ManageLackOfRoom.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:"GetAllLackOfRoomList.action",
                        datatyoe:"json",
                        success:function (data) {
                            var json=JSON.parse(data)
                            for(var i=0;i<json.length;i++){
                                $('#showlackofroominfo').append('<tr><td>'+json[i]["L_Name"]+'</td><td>'+json[i]["L_Sid"]+'</td><td>'+json[i]["L_Time"]+'</td><td>'+json[i]["L_Building"]+'-'+json[i]["L_Room"]+'</td><td><button type="button" class="btn btn-danger btn-xs" onclick="deletelackofroom(this)">'+"删除"+' </td></tr>')
                            }
                        },
                        error:function () {
                            alert("加载缺寝信息错误")
                        }
                    })

                })
            },
            error:function () {
                alert("添加缺寝信息失败")
            }
        })
    })
</script>
<!doctype html>
<html lang="en">
<head>
    <title>首页</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
</head>

<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="addlackofroomform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="学号..." name="id">
                        <br>
                        <input type="text" class="form-control" placeholder="缺寝时间..." name="time">
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="lackofroomsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
