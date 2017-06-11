<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/9
  Time: 10:22
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
    function deletelackofroom(value) {
        $.ajax({
            type:"post",
            data:{time:$(value).closest('tr').find('td')[2].innerHTML,id:$(value).closest('tr').find('td')[1].innerHTML},
            url:"DeleteLackOfRoom.action",
            datatype:null,
            success:function (data2) {
                $('#main').load("ManageLackOfRoom.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:"GetAllLackOfRoomList.action",
                        datatyoe:"json",
                        success:function (data) {
                            var json=JSON.parse(data)
                            for(var i=0;i<json.length;i++){
                                $('#showlackofroominfo').append('<tr><td>'+json[i]["L_Name"]+'</td><td>'+json[i]["L_Sid"]+'</td><td>'+json[i]["L_Time"]+'</td><td>'+json[i]["L_Building"]+'-'+json[i]["L_Room"]+'</td><td><button type="button" class="btn btn-danger btn-xs" onclick="deletelackofroom(this)">'+"删除"+' </td></tr>')
                            }
                        },
                        error:function () {
                            alert("加载缺寝信息错误")
                        }
                    })
                })
            },
            error:function () {
                alert("删除失败")
            }
        })
    }
    $(document).ready(function () {
        //实现搜索功能，支持精确搜索，可以改为模糊搜索，但是绝对不是很有必要
        $('#forlackofroomsearch').click( function() {
            $('#main').load("ManageLackOfRoom.jsp")
            $.ajax({
                type:"post",
                data:$("#forsearchlackofroom").serialize(),
                url:"SearchLackOfRoomList.action",
                datatype:"json",
                success:function (data2) {
                    var json=JSON.parse(data2)
                    for(var i=0;i<json.length;i++){
                        $('#showlackofroominfo').append('<tr><td>'+json[i]["L_Name"]+'</td><td>'+json[i]["L_Sid"]+'</td><td>'+json[i]["L_Time"]+'</td><td>'+json[i]["L_Building"]+'-'+json[i]["L_Room"]+'</td><td><button type="button" class="btn btn-danger btn-xs" onclick="deletelackofroom(this)">'+"删除"+' </td></tr>')
                    }
                },
                error:function () {
                    alert("页面初始化失败")
                }
            })
        })
        $('#addlackofroom').click( function() {
            $('#main').load("AddLackOfRoom.jsp")
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
                        <form class="navbar-form navbar-left" id="forsearchlackofroom">
                            <div class="input-group">
                                <input type="text" value="" class="form-control" placeholder="学号..." name="id" id="id">
                                <span class="input-group-btn"><button type="button" class="btn btn-primary" id="forlackofroomsearch">搜索</button></span>
                            </div>
                        </form>
                    </div>
                    <div style="position: relative;left: 50%;">
                        <button type="button" class="btn btn-primary" style="position:relative;margin: 20px 20px;" id="addlackofroom">增加缺寝信息</button>
                    </div>
                </div>
                <div style="width: 100%;height:70%">
                    <table class="table table-hover" style="width: 70%;text-align: left">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>缺寝时间</th>
                            <th>所属栋号</th>
                        </tr>
                        </thead>

                        <tbody id="showlackofroominfo">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
