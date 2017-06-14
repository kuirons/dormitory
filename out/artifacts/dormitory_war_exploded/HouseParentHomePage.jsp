<%--
  Created by IntelliJ IDEA.
  User: kh
  Date: 2017/5/17
  Time: 0:45
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
    <!-- VENDOR CSS -->
    <link rel="stylesheet" href="assets/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/vendor/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/vendor/linearicons/style.css">
    <link rel="stylesheet" href="assets/vendor/chartist/css/chartist-custom.css">
    <!-- MAIN CSS -->
    <link rel="stylesheet" href="assets/css/main.css">
    <!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
    <link rel="stylesheet" href="assets/css/demo.css">
    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
    <!-- ICONS -->
    <link rel="apple-touch-icon" sizes="76x76" href="assets/img/apple-icon.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/img/favicon.png">
</head>

<script src="Script/jquery-3.2.1.js"></script>
<script>
    var messagenum=0
    //读取数据库中全部管理员的信息，加载在相应表格中
    function bindtotable() {
        $.ajax({
            type:"post",
            url:"GetAllManagerList.action?randow="+Math.random(),
            datatype:"json",
            success:function (data2) {
                var json=JSON.parse(data2)
                for(var i=0;i<json.length;i++){
                    $('#showimanagerinfo').append('<tr><td>'+json[i]["M_Name"]+'</td><td>'+json[i]["M_Phonenum"]+'</td><td>'+json[i]["M_Time"]+'</td><td>'+json[i]["M_Building"]+'</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changemanager(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletemanager(this)">'+"删除"+' </td></tr>')
                }
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    function seeAllThemMessage() {
        $('#main').load("ShowAllMessage.jsp",function () {
            $.ajax({
                type:"post",
                url:"getThisUserAllMessage.action",
                datatype:"json",
                success:function (data2) {
                    var json=JSON.parse(data2)
                    for(var i=0;i<json.length;i++){
                        $('#showallmessage').append('<tr> <td><img src="assets/img/user' + parseInt(json[i]["M_Id"]) % 8 + '.jpg" alt="Avatar" class="avatar img-circle"> <a href="#">' + json[i]["M_From"] + '</a></td> <td><p>' + json[i]["M_Theme"] + '</p></td> <td><p>' + json[i]["M_Content"] + '</p></td><td><button type="button" style="height: 27px" class="btn btn-success btn-xs" onclick="reply(this)">' + "回复" + '</button> </td></tr>')
                    }
                },
                error:function () {
                    alert("获取消息失败")
                }
            })
        })
    }
    //从数据库中获取全部学生的信息，绑定到相应表格中
    $(document).ready(function () {
        $('#main').load("Userinfo.jsp")
        <!--获取message，该message用于主页面的消息加载，和userinfo页面的信息加载不重复-->
        $.ajax({
            type:"post",
            url:"Message.action",
            datatype:"json",
            scriptCharset: 'utf-8',
            success:function (data) {
                var json = JSON.parse(data);
                messagenum=json.length
                $('#messagecount').append(json.length)
//                $('#forhomepageinfo').append('<div class="col-md-4 stat-item" id="formessage">'+json.length+'<span>待处理消息</span></div>')
                for(var i=0;i<json.length&&i<5;i++){
                    <!--通过判断将标志位转换成相应图标-->
                    if(json[i]["M_Flag"]==="3"){
                        $('#messagecontent').append('<li><a href="#" class="notification-item"><span class="dot bg-danger"></span>'+json[i]["M_Content"]+'</a></li>')
                    }
                    else if(json[i]["M_Flag"]==="2"){
                        $('#messagecontent').append('<li><a href="#" class="notification-item"><span class="dot bg-warning"></span>'+json[i]["M_Content"]+'</a></li>')
                    }
                    else{
                        $('#messagecontent').append('<li><a href="#" class="notification-item"><span class="dot bg-success"></span>'+json[i]["M_Content"]+'</a></li>')
                    }
                }
                $('#messagecontent').append('<li><a href="javascript:void(0)" class="more" onclick="seeAllThemMessage()">查看全部信息</a></li>')
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
        //点击主页按钮返回主页
        $('#homepageclick').click(function () {
            $('#main').load("Userinfo.jsp")
        })
        $('#managehpclick').click(function () {
            $('#main').load('ManageHP.jsp',function () {
                bindtotable()
            })
        })
        $('#managestuclick').click(function () {
            $('#main').load("ManageStu.jsp",function () {
                $.ajax({
                    type:"post",
                    url:"GetAllStuInfoList.action?randow="+Math.random(),
                    datatyoe:"json",
                    success:function (data) {
                        var json=JSON.parse(data)
                        for(var i=0;i<json.length;i++){
                            $('#showstuinfo').append('<tr><td>'+json[i]["S_Name"]+'</td><td>'+json[i]["S_Id"]+'</td><td>'+json[i]["S_Phonenum"]+'</td><td>'+(typeof(json[i]["S_Building"])=="undefined"?"":json[i]["S_Building"]+'-')+(typeof(json[i]["S_Room"])=="undefined"?"":json[i]["S_Room"])+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changestudent(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletestudent(this)">'+"删除"+' </td></tr>')
                        }

                    },
                    error:function () {
                        alert("加载学生信息错误")
                    }
                })

            })
        })
        $('#manageroomclick').click(function () {
            $('#main').load("ManageBuilding.jsp",function () {
                $.ajax({
                    type:"post",
                    url:"GetAllRoomList.action",
                    datatype:"json",
                    success:function (data2) {
                        var json=JSON.parse(data2)
                        for(var i=0;i<json.length;i++){
                            $('#showroominfo').append('<tr><td>'+json[i]["B_Id"]+'-'+json[i]["B_Room"]+'</td><td>'+json[i]["B_Takenin"]+'</td><td>'+json[i]["B_Maxnum"]+'</td><td>'+json[i]["B_Allownum"]+'</td><td><button type="button" class="btn btn-warning btn-xs" onClick="changebuilding(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletebuilding(this)">'+"删除"+' </td></tr>')
                        }
                    },
                    error:function () {
                        alert("获取寝室信息失败")
                    }
                })
            })
        })
        $('#manageinandout').click(function () {
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
        })
        $('#managelackofroom').click(function () {
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
        })
        $('#manageannouncement').click(function () {
            $('#main').load("ManageAnnouncement.jsp",function () {
                $.ajax({
                    type:"post",
                    url:"GetAllAnnouncementList.action",
                    datatyoe:"json",
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
        $('#changepassword').click(function () {
            $('#main').load("ChangePassword.jsp")
        })
        $('#logout').click(function () {
            $.ajax({
                type:"post",
                url:"Logout.action",
                success: function (date) {
                    window.location.href = "login.jsp"
                }
            })
        })
    })
</script>
<body>
<!-- WRAPPER -->
<div id="wrapper">
    <!-- NAVBAR -->
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="brand">
            <a href="index.html"><img src="assets/img/logo-dark.png" alt="Klorofil Logo" class="img-responsive logo"></a>
        </div>
        <div class="container-fluid">
            <div class="navbar-btn">
                <button type="button" class="btn-toggle-fullwidth"><i class="lnr lnr-arrow-left-circle"></i></button>
            </div>
            <div id="navbar-menu">
                <ul class="nav navbar-nav navbar-right">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle icon-menu" data-toggle="dropdown">
                            <i class="lnr lnr-alarm"></i>
                            <span class="badge bg-danger" id="messagecount"></span>
                        </a>
                        <ul class="dropdown-menu notifications" id="messagecontent">
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img src="assets/img/houseparent.jpg" class="img-circle" alt="Avatar"> <span><%=((UserBean)session.getAttribute("userinfo")).getUsername().toString() %></span> <i class="icon-submenu lnr lnr-chevron-down"></i></a>
                        <ul class="dropdown-menu">
                            <li><a href="javascript:void(0)" id="changepassword"><i class="lnr lnr-cog"></i> <span>修改密码</span></a></li>
                            <li><a href="javascript:void(0)" id="logout"><i class="lnr lnr-exit"></i> <span>注销登录</span></a></li>
                        </ul>
                    </li>
                    <!-- <li>
                        <a class="update-pro" href="#downloads/klorofil-pro-bootstrap-admin-dashboard-template/?utm_source=klorofil&utm_medium=template&utm_campaign=KlorofilPro" title="Upgrade to Pro" target="_blank"><i class="fa fa-rocket"></i> <span>UPGRADE TO PRO</span></a>
                    </li> -->
                </ul>
            </div>
        </div>
    </nav>
    <!-- END NAVBAR -->
    <!-- LEFT SIDEBAR -->
    <div id="sidebar-nav" class="sidebar">
        <div class="sidebar-scroll">
            <nav>
                <ul class="nav">
                    <li><a href="javascript:void(0)" class="active" id="homepageclick"><i class="lnr lnr-home"></i> <span>主页</span></a></li>
                    <li><a href="javascript:void(0)" class="" id="managestuclick"><i class="lnr lnr-users"></i> <span>学生管理</span></a></li>
                    <li><a href="javascript:void(0)" class="" id="manageroomclick"><i class="lnr lnr-apartment"></i> <span>楼宇管理</span></a></li>
                    <li><a href="javascript:void(0)" class="" id="managelackofroom"><i class="lnr lnr-file-add"></i> <span>缺寝登记</span></a></li>
                    <li><a href="javascript:void(0)" class="" id="manageinandout"><i class="lnr lnr-menu"></i> <span>变动登记</span></a></li>
                    <li><a href="javascript:void(0)" class="" id="manageannouncement"><i class="lnr lnr-list"></i> <span>公告管理</span></a></li>
                </ul>
            </nav>
        </div>
    </div>
    <!-- END LEFT SIDEBAR -->
    <!-- MAIN -->
    <div class="main" id="main">
        <!--该处加载导航对应的main-content-->
    </div>
    <!-- END MAIN -->
    <div class="clearfix"></div>
    <footer>
        <div class="container-fluid">
        </div>
    </footer>
</div>
<!-- END WRAPPER -->
<!-- Javascript -->
<script src="assets/vendor/jquery/jquery.min.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.min.js"></script>
<script src="assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<script src="assets/vendor/jquery.easy-pie-chart/jquery.easypiechart.min.js"></script>
<script src="assets/vendor/chartist/js/chartist.min.js"></script>
<script src="assets/scripts/klorofil-common.js"></script>
<script>
    $(function() {
        var data, options;

        // headline charts
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [23, 29, 24, 40, 25, 24, 35],
                [14, 25, 18, 34, 29, 38, 44],
            ]
        };

        options = {
            height: 300,
            showArea: true,
            showLine: false,
            showPoint: false,
            fullWidth: true,
            axisX: {
                showGrid: false
            },
            lineSmooth: false,
        };

        new Chartist.Line('#headline-chart', data, options);


        // visits trend charts
        data = {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            series: [{
                name: 'series-real',
                data: [200, 380, 350, 320, 410, 450, 570, 400, 555, 620, 750, 900],
            }, {
                name: 'series-projection',
                data: [240, 350, 360, 380, 400, 450, 480, 523, 555, 600, 700, 800],
            }]
        };

        options = {
            fullWidth: true,
            lineSmooth: false,
            height: "270px",
            low: 0,
            high: 'auto',
            series: {
                'series-projection': {
                    showArea: true,
                    showPoint: false,
                    showLine: false
                },
            },
            axisX: {
                showGrid: false,

            },
            axisY: {
                showGrid: false,
                onlyInteger: true,
                offset: 0,
            },
            chartPadding: {
                left: 20,
                right: 20
            }
        };

        new Chartist.Line('#visits-trends-chart', data, options);


        // visits chart
        data = {
            labels: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
            series: [
                [6384, 6342, 5437, 2764, 3958, 5068, 7654]
            ]
        };

        options = {
            height: 300,
            axisX: {
                showGrid: false
            },
        };

        new Chartist.Bar('#visits-chart', data, options);


        // real-time pie chart
        var sysLoad = $('#system-load').easyPieChart({
            size: 130,
            barColor: function(percent) {
                return "rgb(" + Math.round(200 * percent / 100) + ", " + Math.round(200 * (1.1 - percent / 100)) + ", 0)";
            },
            trackColor: 'rgba(245, 245, 245, 0.8)',
            scaleColor: false,
            lineWidth: 5,
            lineCap: "square",
            animate: 800
        });

        var updateInterval = 3000; // in milliseconds

//        setInterval(function() {
//            var randomVal;
//            randomVal = getRandomInt(0, 100);
//
//            sysLoad.data('easyPieChart').update(randomVal);
//            sysLoad.find('.percent').text(randomVal);
//        }, updateInterval);

        function getRandomInt(min, max) {
            return Math.floor(Math.random() * (max - min + 1)) + min;
        }

    });
</script>
</body>

</html>
