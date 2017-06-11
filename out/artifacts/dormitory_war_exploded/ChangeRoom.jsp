<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/5
  Time: 20:24
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
    $('#croomsubmit').click( function() {
        $.ajax({
            type:"post",
            data:$("#changeroomform").serialize(),
            url:"ChangeRoom.action",
            success:function (data) {
                $('#main').load("ManageBuilding.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:"GetAllRoomList.action",
                        datatype:"json",
                        success:function (data2) {
                            var json=JSON.parse(data2)
                            for(var i=0;i<json.length;i++){
                                $('#showroominfo').append('<tr><td>'+json[i]["B_Id"]+'-'+json[i]["B_Room"]+'</td><td>'+json[i]["B_Takenin"]+'</td><td>'+json[i]["B_Maxnum"]+'</td><td>'+json[i]["B_Allownum"]+'</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changemanager(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletemanager(this)">'+"删除"+' </td></tr>')
                            }
                        },
                        error:function () {
                            alert("获取寝室信息失败")
                        }
                    })

                })
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
            <form id="changeroomform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入相关信息</h3>
                    </div>
                    <div class="panel-body">
                        <input type="text" class="form-control" placeholder="您正在修改的寝室为<%=session.getAttribute("changebuildingPidandroom")%>" name="idroom" readonly="readonly">
                        <br>
                        <input type="text" class="form-control" placeholder="已住人数..." name="takenin">
                        <br>
                        <input type="text" class="form-control" placeholder="可住人数..." name="maxnum">
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="croomsubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>

</html>
