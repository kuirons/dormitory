<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/5
  Time: 10:34
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
    //读取数据库中全部寝室的信息，加载在相应表格中
    function bindtoroomtable() {
        <!--获取寝室基本信息-->
        $.ajax({
            type: "post",
            url: "GetAllRoomList.action",
            datatype: "json",
            success: function (data2) {
                var json = JSON.parse(data2)
                for (var i = 0; i < json.length; i++) {
                    $('#showroominfo').append('<tr><td>' + json[i]["B_Id"] + '-' + json[i]["B_Room"] + '</td><td>' + json[i]["B_Takenin"] + '</td><td>' + json[i]["B_Maxnum"] + '</td><td>' + json[i]["B_Allownum"] + '</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changebuilding(this)">' + "修改" + '</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletebuilding(this)">' + "删除" + ' </td></tr>')
                }
            },
            error: function () {
                alert("获取寝室信息失败")
            }
        })
    }
    //当用户点击修改，将用户的用户名存入session，然后跳转修改页面
    function changebuilding(value) {
        $.ajax({
            type: "post",
            data: {idroom: $(value).closest('tr').find('td')[0].innerHTML},
            url: "ParamTransitChangeBuilding.action",
            datatype: null,
            success: function (data2) {
                $('#main').load('ChangeRoom.jsp')
            },
            error: function () {
                alert("修改寝室信息失败")
            }
        })
    }
    //当用管理员点击删除用户后，删除该用户的全部信息
    function deletebuilding(value) {
        $.ajax({
            type: "post",
            data: {idandroom: $(value).closest('tr').find('td')[0].innerHTML},
            url: "DeleteRoom.action",
            datatype: null,
            success: function (data2) {
                $('#main').load("ManageBuilding.jsp", function () {
                    $.ajax({
                        type: "post",
                        url: "GetAllRoomList.action",
                        datatype: "json",
                        success: function (data2) {
                            var json = JSON.parse(data2)
                            for (var i = 0; i < json.length; i++) {
                                $('#showroominfo').append('<tr><td>' + json[i]["B_Id"] + '-' + json[i]["B_Room"] + '</td><td>' + json[i]["B_Takenin"] + '</td><td>' + json[i]["B_Maxnum"] + '</td><td>' + json[i]["B_Allownum"] + '</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changebuilding(this)">' + "修改" + '</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletebuilding(this)">' + "删除" + ' </td></tr>')
                            }
                        },
                        error: function () {
                            alert("获取寝室信息失败")
                        }
                    })
                })
            },
            error: function () {
                alert("删除寝室信息失败")
            }
        })
    }
    $(document).ready(function () {
        //实现搜索功能，支持精确搜索，可以改为模糊搜索，但是绝对不是很有必要
        $('#forroomsearch').click(function () {
            $('#main').load("ManageBuilding.jsp")
//            $.ajax({
//                type: "post",
//                data: $("#forsearchroom").serialize(),
//                url: "SearchRoomList.action",
//                datatype: "json",
//                success: function (data2) {
//                    var json = JSON.parse(data2)
//                    for (var i = 0; i < json.length; i++) {
//                        $('#showroominfo').append('<tr><td>' + json[i]["B_Id"] + '-' + json[i]["B_Room"] + '</td><td>' + json[i]["B_Takenin"] + '</td><td>' + json[i]["B_Maxnum"] + '</td><td>' + json[i]["B_Allownum"] + '</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changebuilding(this)">' + "修改" + '</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletebuilding(this)">' + "删除" + ' </td></tr>')
//                    }
//                },
//                error: function () {
//                    alert("搜索失败")
//                }
//            })
        })
        $('#addroom').click(function () {
            $('#main').load("AddRoom.jsp")
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
                        <form class="navbar-form navbar-left" id="forsearchroom">
                            <div class="input-group">
                                <input type="text" value="" class="form-control" placeholder="寝室号（x-xxxx)..." name="id"
                                       id="id">
                                <span class="input-group-btn"><button type="button" class="btn btn-primary"
                                                                      id="forroomsearch">搜索</button></span>
                            </div>
                        </form>
                    </div>
                    <div style="position: relative;left: 50%;">
                        <button type="button" class="btn btn-primary" style="position:relative;margin: 20px 20px;"
                                id="addroom">增加寝室
                        </button>
                    </div>
                </div>
                <div style="width: 100%;height:70%">
                    <table class="table table-hover" style="width: 70%;text-align: left">
                        <thead>
                        <tr>
                            <th>寝室号</th>
                            <th>已住人数</th>
                            <th>可住人数</th>
                            <th>可迁入人数</th>
                            <th>操作</th>
                        </tr>
                        </thead>

                        <tbody id="showroominfo">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>

