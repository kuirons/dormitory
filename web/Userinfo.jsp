<%--
  Created by IntelliJ IDEA.
  User: kh
  Date: 2017/5/25
  Time: 2:36
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
    //    获取userinfo界面需要的数据
    function getdata() {
        //获取待处理消息的数量
        $.ajax({
            type:"post",
            url:"Message.action",
            datatype:"json",
            scriptCharset: 'utf-8',
            success:function (data) {
                var json = JSON.parse(data);
                messagenum=json.length
                $('#forhomepageinfo').append('<div class="col-md-4 stat-item" id="formessage">'+json.length+'<span>待处理消息</span></div>')
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
        <!--获取请求-->
        $.ajax({
            type: "post",
            url: "GetAllRequest.action",
            datatype: "json",
            success: function (data) {
                var count=0
                var json = JSON.parse(data)
                for (var i = 0; i < json.length; i++) {
                    if(json[i]["R_Status"]==='未处理'){
                        count++
                    }
                }
                $('#forhomepageinfo').append('<div class="col-md-4 stat-item" id="forbeg">'+count+'<span>待处理请求</span> </div>');

            }
        })
        <!--获取该用户发送的公告-->
        $.ajax({
            type:"post",
            url:"GetAnnouncement.action",
            datatype:"json",
            success:function (data1) {
                var json = JSON.parse(data1);
                $('#forhomepageinfo').append('<div class="col-md-4 stat-item" id="forbeg">'+json.length+'<span>已发布公告</span> </div>');
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
        <!--获取用户基本信息-->
        $.ajax({
            type:"post",
            url:"GetManagerInfo.action",
            datatype:"json",
            success:function (data2) {
                var json=JSON.parse(data2)
                $('#basicinfo').append('<li>'+"入职时间" +'<span>'+json["M_Time"]+'</span></li>');
                $('#basicinfo').append('<li>'+"电话" +'<span>'+json["M_Phonenum"]+'</span></li>');
                if(json["M_Building"]==null){
                    $('#basicinfo').append('<li>'+"所属栋号" +'<span>'+"空"+'</span></li>');
                }
                else{
                    $('#basicinfo').append('<li>'+"所属栋号" +'<span>'+json["M_Building"]+'</span></li>');
                }
                $('#aboutinfo').append('<p>'+json["M_Information"]+'</p>')
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
        <!--获取对应栋数的公告信息-->
        $.ajax({
            type:"post",
            url:"GetAllAnnouncementList.action",
            datatype:"json",
            success:function (data2) {
                var json=JSON.parse(data2)
                for(var i=0;i<json.length&&i<8;i++){
                    $('#showannouncement').append('<li><i class="fa fa-plus activity-icon"></i> <p>'+json[i]["A_Content"] +'<span class="timestamp">'+json[i]["A_Time"]+'</span></p> </li>')

                }
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    $(document).ready(function () {
        getdata()
        $('#lookoverallannouncement').click(function () {
            $('#main').load("ManageAnnouncement.jsp",function () {
                $.ajax({
                    type:"post",
                    url:"GetAllAnnouncementList.action",
                    datatype:"json",
                    success:function (data) {
                        var json=JSON.parse(data)
                        for(var i=0;i<json.length;i++){
                            $('#showannouncementl').append('<li><i class="fa fa-plus activity-icon"></i> <p>'+json[i]["A_Content"] +'<span class="timestamp">'+json[i]["A_Time"]+'</span></a></li>')
                        }
                    },
                    error:function () {
                        alert("加载公告信息错误")
                    }
                })
            })
        })
        $('#changemanagerinformation').click(function () {
            $('#main').load("ChangeManagerInformation.jsp")
        })
    })
</script>
<body>
<div class="main-content">
    <div class="container-fluid">
        <div class="panel panel-profile">
            <div class="clearfix">
                <!-- LEFT COLUMN -->
                <div class="profile-left">
                    <!-- PROFILE HEADER -->
                    <div class="profile-header">
                        <div class="overlay"></div>
                        <div class="profile-main">
                            <img src="assets/img/administrator.jpg" class="img-circle" alt="Avatar" style="width: 200px;height: 200px">
                            <h3 class="name"><%=((UserBean)session.getAttribute("userinfo")).getUsername().toString()%></h3>
                            <span class="online-status status-available">在线</span>
                        </div>
                        <div class="profile-stat">
                            <div class="row" id="forhomepageinfo">
                            </div>
                        </div>
                    </div>
                    <!-- END PROFILE HEADER -->
                    <!-- PROFILE DETAIL -->
                    <div class="profile-detail">
                        <div class="profile-info">
                            <h4 class="heading">基本信息</h4>
                            <ul class="list-unstyled list-justify" id="basicinfo">
                            </ul>
                        </div>
                        <div class="profile-info" id="aboutinfo">
                            <h4 class="heading">简介</h4>
                        </div>
                        <div class="text-center"><a href="javascript:void(0)" class="btn btn-primary" id="changemanagerinformation">修改信息</a></div>
                    </div>
                    <!-- END PROFILE DETAIL -->
                </div>
                <!-- END LEFT COLUMN -->
                <!-- RIGHT COLUMN -->
                <div class="profile-right">
                    <h4 class="heading">近期公告</h4>
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab-bottom-left3">
                            <ul class="list-unstyled activity-timeline" id="showannouncement">
                            </ul>
                            <div class="margin-top-30 text-center"><a href="javascript:void(0)" id="lookoverallannouncement" class="btn btn-default">查看全部公告</a></div>
                        </div>
                        <div class="tab-pane fade" id="tab-bottom-left4">
                            <div class="table-responsive">
                                <table class="table project-table">
                                    <thead>
                                    <tr>
                                        <th>Title</th>
                                        <th>Progress</th>
                                        <th>Leader</th>
                                        <th>Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <td><a href="#">Spot Media</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
                                                    <span>60% Complete</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user2.png" alt="Avatar" class="avatar img-circle"> <a href="#">Michael</a></td>
                                        <td><span class="label label-success">ACTIVE</span></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">E-Commerce Site</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="33" aria-valuemin="0" aria-valuemax="100" style="width: 33%;">
                                                    <span>33% Complete</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle"> <a href="#">Antonius</a></td>
                                        <td><span class="label label-warning">PENDING</span></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Project 123GO</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="68" aria-valuemin="0" aria-valuemax="100" style="width: 68%;">
                                                    <span>68% Complete</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle"> <a href="#">Antonius</a></td>
                                        <td><span class="label label-success">ACTIVE</span></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Wordpress Theme</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;">
                                                    <span>75%</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user2.png" alt="Avatar" class="avatar img-circle"> <a href="#">Michael</a></td>
                                        <td><span class="label label-success">ACTIVE</span></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Project 123GO</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                    <span>100%</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user1.png" alt="Avatar" class="avatar img-circle" /> <a href="#">Antonius</a></td>
                                        <td><span class="label label-default">CLOSED</span></td>
                                    </tr>
                                    <tr>
                                        <td><a href="#">Redesign Landing Page</a></td>
                                        <td>
                                            <div class="progress">
                                                <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100" style="width: 100%;">
                                                    <span>100%</span>
                                                </div>
                                            </div>
                                        </td>
                                        <td><img src="assets/img/user5.png" alt="Avatar" class="avatar img-circle" /> <a href="#">Jason</a></td>
                                        <td><span class="label label-default">CLOSED</span></td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="custom-tabs-line tabs-line-bottom left-aligned">
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
