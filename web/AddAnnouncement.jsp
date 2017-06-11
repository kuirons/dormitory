<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/9
  Time: 17:41
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
    $('#announcementsubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#addannouncementform").serialize(),
            url:"AddAnnouncement.action",
            success:function (data2) {
                $('#main').load("ManageAnnouncement.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:"GetAllAnnouncementList.action",
                        datatyoe:"json",
                        success:function (data) {
                            var json=JSON.parse(data)
                            for(var i=0;i<json.length;i++){
                                $('#showannouncementl').append('<li><i class="fa fa-plus activity-icon"></i> <p>'+json[i]["A_Content"] +'<span class="timestamp">'+json[i]["A_Time"]+'</span></a></li>')
                            }
                        },
                        error:function () {
                            alert("加载公告信息错误")
                        }
                    })
                })
            },
            error:function () {
                alert("添加公告失败")
            }
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="addannouncementform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="标题..." name="title">
                        <br>
                        <textarea class="form-control" placeholder="公告内容..." rows="6" name="content"></textarea>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="announcementsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
