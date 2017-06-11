<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/4/28
  Time: 11:11
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
    <!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
<form action="#" id="houseAdd">
    <p>
        <label for="jobnum" class="hpa">工号：</label>
        <input type="text" id="jobnum" name="jobnum"/>
    </p>
    <p>
        <label for="name" class="hpa">姓名：</label>
        <input type="text" id="name" name="name"/>
    </p>
    <p>
        <label for="gender" class="hpa">性别：</label>
        <select id="gender" name="gender">
            <option value="">请选择</option>
            <option value="男">男</option>
            <option value="女">女</option>
        </select>
    </p>
    <p>
        <label for="position" class="hpa">所属栋数：</label>
        <input type="text" id="position" name="position">
    </p>
    <p>
        <input type="button" value="添加">
    </p>
</form>
</body>
</html>
