<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/9
  Time: 16:20
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
    $('#document').ready(function () {
        $('#addannouncement').click(function () {
            $('#main').load("AddAnnouncement.jsp")
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="panel panel-profile">
            <div>
                <button type="button" class="btn btn-primary" style="position:relative;margin: 20px 20px;" id="addannouncement">增加公告</button>
            </div>
            <div class="tab-content">
                <div class="tab-pane fade in active" id="tab-bottom-left1">
                    <ul class="list-unstyled activity-timeline" id="showannouncementl">
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
