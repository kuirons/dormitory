<%--
  Created by IntelliJ IDEA.
  User: kh
  Date: 2017/5/26
  Time: 7:54
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
    $('#cmanagersubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#changemanagerform").serialize(),
            url:"ChangeManager.action",
            success:function (data) {
                bindtomanagertable();
                $('#main').load("ManageHP.jsp")
                bindtomanagertable();
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
            <form id="changemanagerform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="您正在修改的楼宇管理员名字为<%=session.getAttribute("changemanagerPusername")%>" name="name" readonly="readonly">
                        <br>
                        <input type="text" class="form-control" placeholder="入职时间..." name="time">
                        <br>
                        <input type="text" class="form-control" placeholder="电话号码..." name="phonenum">
                        <br>
                        <textarea class="form-control" placeholder="个人简介..." rows="4" name="information"></textarea>
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
                        <input type="button" class="btn btn-primary" value="提交" id="cmanagersubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>
