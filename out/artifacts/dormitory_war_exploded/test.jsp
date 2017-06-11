<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/4/27
  Time: 21:30
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
<script type="text/javascript" src="Script/jquery-3.2.1.js"></script>
<script>
    $(document).ready(function () {
        $(".two1").toggle(function () {
            $(".text").animate({height: 'toggle', opacity: 'toggle'}, "slow");
        }, function () {
            $(".text").animate({height: 'toggle', opacity: 'toggle'}, "slow");
        });
        $(".two2").toggle(function () {
            $(".text1").animate({height: 'toggle', opacity: 'toggle'}, "slow");
        }, function () {
            $(".text1").animate({height: 'toggle', opacity: 'toggle'}, "slow");
        });
    });
</script>
<style>
    * {
        padding: 0;
        margin: 0;
        color: #000;
    }

    a {
        text-decoration: none;
    }

    dl {
        background: #eee;
        width: 100px;
    }

    dt {
        font-weight: bold;
        cursor: pointer;
    }

    dt, dd {
        width: 100px;
        height: 30px;
        line-height: 30px;
        border-bottom: 1px solid #ccc;
    }
</style>
<body>
<dl id="two">
    <dt class="two1">指标库管理</dt>
    <dd class="text"><a href="javascript:void(0)">单项工程指标</a></dd>
    <dd class="text"><a href="javascript:void(0)">综合指标</a></dd>
    <dd class="text"><a href="javascript:void(0)">单元指标</a></dd>
    <span class="">
<dd class="text"><a href="javascript:void(0)">分部分项指标</a></dd>
<dd class="text"><a href="javascript:void(0)">工程量指标</a></dd>
</span>
    <dd class="text"><a href="javascript:void(0)">指标审核</a></dd>
    <dd class="text"><a href="javascript:void(0)">我的共享指标</a></dd>

    <dt class="two2">市政管理</dt>
    <dd class="text1"><a href="javascript:void(0)">单项工程指标</a></dd>
    <dd class="text1"><a href="javascript:void(0)">综合指标</a></dd>
    <dd class="text1"><a href="javascript:void(0)">单元指标</a></dd>
    <span>
<dd class="text1"><a href="javascript:void(0)">分部分项指标</a></dd>
<dd class="text1"><a href="javascript:void(0)">工程量指标</a></dd>
</span>
    <dd class="text1"><a href="javascript:void(0)">指标审核</a></dd>
    <dd class="text1"><a href="javascript:void(0)">我的共享指标</a></dd>

</dl>
</body>
</html>
