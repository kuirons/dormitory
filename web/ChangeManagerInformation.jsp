<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/12
  Time: 22:07
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
    $(document).ready(function () {
        $('#changemanagerinformationsubmit').click( function() {
            $.ajax({
                type:"post",
                data:$("#changemanagerinformationform").serialize(),
                url:"ChangeManagerInformation.action",
                success:function (data) {
                    $('#main').load("Userinfo.jsp")
                },
                error:function () {
                    alert("修改信息失败")
                }
            })
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="changemanagerinformationform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="新的电话号码..." name="newphonenum">
                        <br>
                        <textarea class="form-control" placeholder="新的个人简介..." rows="4" name="newinformation"></textarea>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="changemanagerinformationsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>
