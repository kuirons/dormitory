<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/14
  Time: 16:12
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
    function sendmessage(value) {
        $.ajax({
            type:"post",
            data:{to:$(value).closest('tr').find('td').find('a')[0].innerHTML},
            url:"ParamTransitReplyMessage.action",
            datatype:null,
            success:function (data2) {
                $('#main').load("SendMessage.jsp")
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="panel panel-profile">
            <div class="clearfix">
                <div class="custom-tabs-line tabs-line-bottom left-aligned">
                    <ul class="nav" role="tablist">
                        <li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab"><%=session.getAttribute("thestudentinformation")%><span class="badge" id="countin"></span></a></li>
                    </ul>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade in active" id="tab-bottom-left1">
                        <div class="table-responsive">
                            <table class="table project-table">
                                <thead>
                                <tr>
                                    <th>室友</th>
                                    <th>电话</th>
                                    <th>简介</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="showallroommate">
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