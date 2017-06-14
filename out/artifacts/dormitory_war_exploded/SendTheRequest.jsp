<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/14
  Time: 19:40
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
        $('#sendrequestsubmit').click(function () {
            $.ajax({
                type:"post",
                url:"SendTheRequest.action",
                data:$('#sendtherequestform').serialize(),
                success:function (data) {
                    $('#main').load("StuInfo.jsp")
                },
                error:function () {
                    alert("发送请求失败")
                }
            })
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="sendtherequestform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <textarea class="form-control" placeholder="理由..." rows="4" name="reason"></textarea>
                        <br>
                        <select class="form-control" name="type">
                            <option value="">请选择...</option>
                            <option value="迁入">迁入</option>
                            <option value="迁出">迁出</option>
                        </select>
                        <br>
                        <select class="form-control" name="building">
                            <option value="">请选择...</option>
                            <option value="1栋">1栋</option>
                            <option value="2栋">2栋</option>
                            <option value="3栋">3栋</option>
                            <option value="4栋">4栋</option>
                            <option value="5栋">5栋</option>
                            <option value="6栋">6栋</option>
                        </select>
                        <br>
                        <input type="text" class="form-control" placeholder="寝室号..." name="room"></textarea>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="sendrequestsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>