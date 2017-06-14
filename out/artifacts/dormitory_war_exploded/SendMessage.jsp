<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/14
  Time: 19:25
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

<script>
    $('#replysubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#replymessageform").serialize(),
            url:"ReplyMessage.action",
            success:function (data2) {
                $('#main').load("InformationOfRoom.jsp",function () {
                    $.ajax({
                        type: "post",
                        url: "GetTheInformationOfRoomMate.action",
                        datatype: "json",
                        success: function (data) {
                            var json = JSON.parse(data)
                            for (var i = 0; i < json.length; i++) {
                                $('#showallroommate').append('<tr> <td><img src="assets/img/user' + Math.floor(Math.random()*9) + '.jpg" alt="Avatar" class="avatar img-circle"> <a href="#">' + json[i]["S_Name"] + '</a></td> <td><p>' + json[i]["S_Phonenum"] + '</p></td> <td><p>' + json[i]["S_Information"] + '</p></td><td><button type="button" style="height: 27px" class="btn btn-success btn-xs" onClick="sendmessage(this)">' + "发送消息" + '</button> </td></tr>')
                            }
                        }
                    })
                })
            },
            error:function () {
                alert("回复信息失败")
            }
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="replymessageform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="主题..." name="theme">
                        <br>
                        <textarea class="form-control" placeholder="内容..." rows="4" name="content"></textarea>
                        <br>
                        <select class="form-control" name="flag">
                            <option value="1">普通</option>
                            <option value="2">重要</option>
                            <option value="3">紧急</option>
                        </select>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="replysubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>

