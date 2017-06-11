<%--
  Created by IntelliJ IDEA.
  User: kh
  Date: 2017/5/26
  Time: 1:44
  To change this template use File | Settings | File Templates.
  该页面时用来显示管理宿舍管理员页面
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
    //读取数据库中全部管理员的信息，加载在相应表格中
    function bindtomanagertable() {
        <!--获取用户基本信息-->
        $.ajax({
            type:"post",
            url:"GetAllManagerList.action",
            datatype:"json",
            success:function (data2) {
                var json=JSON.parse(data2)
                for(var i=0;i<json.length;i++){
                    $('#showimanagerinfo').append('<tr><td class="managername">'+json[i]["M_Name"]+'</td><td>'+json[i]["M_Phonenum"]+'</td><td>'+json[i]["M_Time"]+'</td><td>'+json[i]["M_Building"]+'</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changemanager(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletemanager(this)">'+"删除"+' </td></tr>')
                }
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    //当用户点击修改，将用户的用户名存入session，然后跳转修改页面
    function changemanager(value) {
        $.ajax({
            type:"post",
            data:{username:$(value).closest('tr').find('td')[0].innerHTML},
            url:"ParamTransitChangeManager.action",
            datatype:null,
            success:function (data2) {
                $('#main').load('ChangeManager.jsp')
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    //当用管理员点击删除用户后，删除该用户的全部信息
    function deletemanager(value) {
        $.ajax({
            type:"post",
            data:{username:$(value).closest('tr').find('td')[0].innerHTML},
            url:"DeleteManager.action",
            datatype:null,
            success:function (data2) {
                bindtomanagertable()
                $('#main').load("ManageHP.jsp")
                bindtomanagertable()
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    $(document).ready(function () {
        //实现搜索功能，支持精确搜索，可以改为模糊搜索，但是绝对不是很有必要
        $('#formanagersearch').click( function() {
            $('#main').load("ManageHP.jsp")
            $.ajax({
                type:"post",
                data:$("#formsearchmanager").serialize(),
                url:"SearchManagerList.action",
                datatype:"json",
                success:function (data2) {
                    var json=JSON.parse(data2)
                    for(var i=0;i<json.length;i++){
                        $('#showimanagerinfo').append('<tr><td>'+json[i]["M_Name"]+'</td><td>'+json[i]["M_Phonenum"]+'</td><td>'+json[i]["M_Time"]+'</td><td>'+json[i]["M_Building"]+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changemanager(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletemanager(this)">'+"删除"+' </td></tr>')
                    }
                },
                error:function () {
                    alert("页面初始化失败")
                }
            })
        })
        $('#addmanager').click( function() {
            $('#main').load("AddManager.jsp")
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="panel panel-profile">
            <div class="clearfix">
                <div style="width: 100%;height: 25%;">
                    <div style="position: relative;left: 15%;">
                        <form class="navbar-form navbar-left" id="formsearchmanager">
                            <div class="input-group">
                                <input type="text" value="" class="form-control" placeholder="用户名..." name="username" id="username">
                                <span class="input-group-btn"><button type="button" class="btn btn-primary" id="formanagersearch">搜索</button></span>
                            </div>
                        </form>
                    </div>
                    <div style="position: relative;left: 50%;">
                        <button type="button" class="btn btn-primary" style="position:relative;margin: 20px 20px;" id="addmanager">增加管理员</button>
                    </div>
                </div>
                <div style="width: 100%;height:70%">
                    <table class="table table-hover" style="width: 70%;text-align: left">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>电话</th>
                            <th>入职时间</th>
                            <th>所属栋号</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody id="showimanagerinfo">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
