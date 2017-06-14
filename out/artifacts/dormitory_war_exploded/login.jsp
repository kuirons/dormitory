<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/4/26
  Time: 21:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!doctype html>
<html lang="en" class="fullscreen-bg">

<head>
    <title>成都信息工程大学宿舍管理系统</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">

</head>
<!--jquery-->
<script type="text/javascript" src="Script/jquery-3.2.1.js"></script>
<script>
    $(document).ready(function () {
        $('.form-auth-small :input').blur(function () {
            if($(this).is('#username')){
                if(this.value){
                    this.setCustomValidity("") //将现有提示信息设置未空
                }else if(this.validity.valueMissing){
                    this.setCustomValidity("请输入用户名!")
                }
                if(this.validity.patternMismatch){
                    this.setCustomValidity("用户名长度3到12")
                }
            }
            if($(this).is('#password')){
                if(this.value){
                    this.setCustomValidity("")
                }else if(this.validity.valueMissing){
                    this.setCustomValidity("请输入密码!")
                }
                if(this.validity.patternMismatch){
                    this.setCustomValidity("密码长度在6到12")
                }
            }
        }).focus(function () {
            $(this).triggerHandler("blur")
        })
        $('#forgetpassword').click(function () {
            alert("前联系管理员，电话：13724629381")
        })
//        $('#send').click(function () {
//            $('.form-auth-small :input').trigger("blur")
//        })
    })
</script>
<%
    //request.getAttrbute返回的是一个对象
    if(request.getAttribute("msg")!=null){
        %>
<script>alert("<%=request.getAttribute("msg").toString()%>")</script>
<%
    }
%>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <div class="vertical-align-wrap">
        <div class="vertical-align-middle">
            <div class="auth-box ">
                <div class="left">
                    <div class="content">
                        <div class="header">
                            <h3>成都信息工程大学宿舍管理系统</h3>
                        </div>
                        <form class="form-auth-small" action="GoLogin.action" method="post">
                            <div class="form-group">
                                <label for="username" class="control-label sr-only">Username</label>
                                <input type="text" class="form-control" id="username" name="username" autofocus placeholder="请输入用户名..." pattern="^[\u4e00-\u9fa5A-Za-z0-9]{2,12}$" required="required">
                            </div>
                            <div class="form-group">
                                <label for="password" class="control-label sr-only">Password</label>
                                <input type="password" class="form-control" id="password" name="password" placeholder="请输入密码...." pattern="^[a-zA-Z0-9]{6,12}$" required="required">
                            </div>
                            <div class="form-group clearfix">
                                <label class="fancy-checkbox element-left">
                                    <select class="form-control" name="usertype">
                                        <option value=" ">请选择</option>
                                        <option value="系统管理员">系统管理员</option>
                                        <option value="宿舍管理员">宿舍管理员</option>
                                        <option value="学生">学生</option>
                                    </select>
                                </label>
                            </div>
                            <button type="submit" class="btn btn-primary btn-lg btn-block" id="send">登录</button>
                            <div class="bottom">
                                <span class="helper-text"><i class="fa fa-lock"></i> <a href="javascript:void(0)" id="forgetpassword">忘记密码?</a></span>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
    </div>
</div>
<!-- END WRAPPER -->
</body>

</html>
