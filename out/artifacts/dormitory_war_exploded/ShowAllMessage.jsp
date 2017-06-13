<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/13
  Time: 17:38
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

<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="panel panel-profile">
            <div class="clearfix">
                <div class="custom-tabs-line tabs-line-bottom left-aligned">
                    <ul class="nav" role="tablist">
                        <li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">全部消息<span class="badge" id="countin"></span></a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab-bottom-left1">
                        <div class="table-responsive">
                            <table class="table project-table">
                                <thead>
                                <tr>
                                    <th>请求来自于</th>
                                    <th>学号</th>
                                    <th>理由</th>
                                    <th>楼宇</th>
                                    <th>处理状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="showinrequest">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
