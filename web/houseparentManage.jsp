<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/4/28
  Time: 8:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <base href="<%=basePath%>">

    <title>My JSP 'MyJsp.jsp' starting page</title>

    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <link rel="stylesheet" type="text/css" href="Style/houseparentManage.css">

</head>

<script type="text/javascript" src="Script/jquery-3.2.1.js"></script>
<script !src="">
    $(document).ready(function () {
        $('#houseparentAdd').mouseover(function () {
            $(this).css("color","red")
        }).mouseout(function () {
            $(this).css("color","blue")
        }).click(function () {
            $('#houseparentContent').load('houseparentAdd.jsp')
        })
    })
</script>
<body>
<div id="houseparentTitle">
    <p id="hc">宿舍管理员管理</p>
</div>
<div id="houseparentFunctionbar">
    <form action="#">
        <p>
            <span>功能导航：</span>
            <span><a href="javascript:void(0)" id="houseparentAdd">添加宿舍管理员</a></span>
            <span id="hs">
                <label for="houseparentSearch">搜索（工号）：</label>
                <input type="text" id="houseparentSearch"/>
                <input type="button" value="搜索">
            </span>
        </p>
    </form>
</div>
<div id="houseparentContent"></div>
</body>
</html>
