<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2017/6/6
  Time: 19:57
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
    function agreein(value) {
        $.ajax({
            type: "post",
            data: {id: $(value).closest('tr').find('td')[1].innerHTML,buildingandroom:$(value).closest('tr').find('td')[3].innerHTML},
            url: "AgreeIn.action",
            datatype: "json",
            success: function (data2) {
                var jsonn=JSON.parse(data2)
                alert(jsonn['message'])
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
    }
    function disagreein(value) {
        $.ajax({
            type: "post",
            data: {id: $(value).closest('tr').find('td')[1].innerHTML,buildingandroom:$(value).closest('tr').find('td')[3].innerHTML},
            url: "ParamTransitDisagree.action",
            datatype: "",
            success: function (data2) {
                $('#main').load('DisagreeMessage.jsp')
            },
            error: function () {
                alert("信息修改失败")
            }
        })
    }
    function agreeout(value) {
        $.ajax({
            type: "post",
            data: {id: $(value).closest('tr').find('td')[1].innerHTML,buildingandroom:$(value).closest('tr').find('td')[3].innerHTML},
            url: "AgreeOut.action",
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
    }
    function disagreeout(value) {
        $.ajax({
            type: "post",
            data: {id: $(value).closest('tr').find('td')[1].innerHTML,buildingandroom:$(value).closest('tr').find('td')[3].innerHTML},
            url: "ParamTransitDisagree.action",
            datatype: "",
            success: function (data2) {
                $('#main').load('DisagreeMessage.jsp')
            },
            error: function () {
                alert("信息修改失败")
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
                        <li class="active"><a href="#tab-bottom-left1" role="tab" data-toggle="tab">迁入请求<span class="badge" id="countin"></span></a></li>
                        <li><a href="#tab-bottom-left2" role="tab" data-toggle="tab">迁出请求<span class="badge" id="countout"></span></a></li>
                        <li><a href="#tab-bottom-left3" role="tab" data-toggle="tab">已处理请求</a></li>
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
                    <div class="tab-pane fade" id="tab-bottom-left2">
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
                                <tbody id="showoutrequest">
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="tab-bottom-left3">
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
                                <tbody id="finishrequest">
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
