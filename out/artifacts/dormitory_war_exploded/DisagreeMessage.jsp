<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/8
  Time: 22:08
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
    $('#messagesubmit').click(function () {
        $.ajax({
            type: "post",
            data: $('#addmessageform').serialize(),
            url: "DisAgreeIn.action",
            datatype: "",
            success: function (data2) {
                $('#main').load("ManageInAndOut.jsp", function () {
                    $.ajax({
                        type: "post",
                        url: "GetAllRequest.action",
                        datatype: "json",
                        success: function (data) {
                            var countin = 0
                            var countout = 0
                            var json = JSON.parse(data)
                            for (var i = 0; i < json.length; i++) {
                                if (json[i]["R_Status"] != '已处理') {
                                    if (json[i]["R_Type"] === '迁入') {
                                        $('#showinrequest').append('<tr> <td><img src="assets/img/user' + parseInt(json[i]["R_Id"]) % 8 + '.jpg" alt="Avatar" class="avatar img-circle"> <a href="#">' + json[i]["R_Name"] + '</a></td> <td><p>' + json[i]["R_From"] + '</p></td> <td><p>' + json[i]["R_Reason"] + '</p></td><td><p>' + json[i]["R_Building"]+'-'+json[i]["R_Room"] + '</p></td> <td><span class="label label-warning">未处理</span></td><td><button type="button" style="height: 27px" class="btn btn-success btn-xs" onClick="agreein(this)">' + "同意" + '</button>&nbsp;<button type="button" style="height: 27px" class="btn btn-danger btn-xs" onclick="disagreein(this)">' + "不同意" + ' </td></tr>')
                                        countin++
                                    }
                                    else {
                                        $('#showoutrequest').append('<tr> <td><img src="assets/img/user' + parseInt(json[i]["R_Id"]) % 8 + '.jpg" alt="Avatar" class="avatar img-circle"> <a href="#">' + json[i]["R_Name"] + '</a></td> <td><p>'  + json[i]["R_From"] + '</p></td> <td><p>'+ json[i]["R_Reason"] + '</p></td><td><p>' + json[i]["R_Building"]+'-'+json[i]["R_Room"] + '</p></td> <td><span class="label label-warning">未处理</span></td><td><button type="button" style="height: 27px" class="btn btn-success btn-xs" onClick="agreeout(this)">' + "同意" + '</button>&nbsp;<button type="button" style="height: 27px" class="btn btn-danger btn-xs" onclick="disagreeout(this)">' + "不同意" + ' </td></tr>')
                                        countout++
                                    }
                                }
                                else{
                                    $('#finishrequest').append('<tr> <td><img src="assets/img/user' + parseInt(json[i]["R_Id"]) % 8 + '.jpg" alt="Avatar" class="avatar img-circle"> <a href="#">' + json[i]["R_Name"] + '</a></td> <td><p>' + json[i]["R_From"] + '</p></td> <td><p>' + json[i]["R_Reason"] + '</p></td><td><p>' + json[i]["R_Building"]+'-'+json[i]["R_Room"] + '</p></td> <td><span class="label label-success">已处理</span></td><td><button type="button" style="height: 27px" class="btn btn-success btn-xs">' + "不可操作" + '</button> </td></tr>')
                                }
                            }
                            $('#countin').append(countin)
                            $('#countout').append(countout)
                        }
                    })
                })

            },
            error: function () {
                alert("信息修改失败")
            }
        })

    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div style="width: 50%;position: relative;left: 25%;">
            <form id="addmessageform">
                <div class="panel">
                    <div class="panel-heading">
                        <h3 class="panel-title">请输入拒绝理由</h3>
                    </div>
                    <div class="panel-body">
                        <textarea class="form-control" placeholder="理由..." rows="5" name="disagreereason"></textarea>
                        <br>
                        <input type="button" class="btn btn-primary" value="提交" id="messagesubmit"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
