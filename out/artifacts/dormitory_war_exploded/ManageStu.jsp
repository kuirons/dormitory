<%--
  Created by IntelliJ IDEA.
  User: kh
  Date: 2017/6/3
  Time: 21:56
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
    //从数据库中获取全部学生的信息，绑定到相应表格中
//    function bindStudentInfoToTable() {
//        $.ajax({
//            type:"post",
//            url:'GetAllStuInfoList.action',
//            datatyoe:"json",
//            success:function (data) {
//                var json=JSON.parse(data)
//                for(var i=0;i<json.length;i++){
//                    $('#showstuinfo').append('<tr><td>'+json[i]["S_Name"]+'</td><td>'+json[i]["S_Id"]+'</td><td>'+json[i]["S_Phonenum"]+'</td><td>'+json[i]["S_Building"]+'-'+json[i]["S_Room"]+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changestudent(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletestudent(this)">'+"删除"+' </td></tr>')
//                }
//
//            },
//            error:function () {
//                alert("加载学生信息错误")
//            }
//        })
//
//    }
    //当用户点击修改，将用户的用户名存入session，然后跳转修改页面
    function changestudent(value) {
        $.ajax({
            type:"post",
            data:{id:$(value).closest('tr').find('td')[1].innerHTML},
            url:"ParamTransitChangeStudent.action",
            datatype:null,
            success:function (data2) {
                $('#main').load('ChangeStudent.jsp')
            },
            error:function () {
                alert("页面初始化失败")
            }
        })
    }
    //当用管理员点击删除用户后，删除该用户的全部信息
    function deletestudent(value) {
        $.ajax({
            type:"post",
            data:{username:$(value).closest('tr').find('td')[0].innerHTML},
            url:"DeleteStudent.action",
            datatype:null,
            success:function (data2) {
                $('#main').load("ManageStu.jsp",function () {
                    $.ajax({
                        type:"post",
                        url:'GetAllStuInfoList.action',
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
            },
            error:function () {
                alert("删除学生信息失败")
            }
        })
    }
    $(document).ready(function () {
        //实现搜索功能，支持精确搜索，可以改为模糊搜索，但是绝对不是很有必要
        $('#studentsearch').click( function() {
            $('#main').load("ManageStu.jsp")
            $.ajax({
                type:"post",
                data:$("#forsearchstuinfo").serialize(),
                url:"SearchStudentList.action",
                datatype:"json",
                success:function (data2) {
                    var json=JSON.parse(data2)
                    for(var i=0;i<json.length;i++){
                        $('#showstuinfo').append('<tr><td>'+json[i]["S_Name"]+'</td><td>'+json[i]["S_Id"]+'</td><td>'+json[i]["S_Phonenum"]+'</td><td>'+(typeof(json[i]["S_Building"])=="undefined"?"":json[i]["S_Building"]+'-')+(typeof(json[i]["S_Room"])=="undefined"?"":json[i]["S_Room"])+'</td><td><button type="button" class="btn btn-warning btn-xs"  onClick="changestudent(this)">'+"修改"+'</button>&nbsp;<button type="button" class="btn btn-danger btn-xs" onclick="deletestudent(this)">'+"删除"+' </td></tr>')
                    }
                },
                error:function () {
                    alert("页面初始化失败")
                }
            })
        })
        $('#addstudent').click( function() {
            <%
            if("系统管理员".equals(((UserBean)session.getAttribute("userinfo")).getUsertype())){
            %>
            $('#main').load("AddStudent.jsp")
            <%
            }
            else{
                %>
            $('#main').load("MAddStudent.jsp")
            <%
        }
        %>
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
                        <form class="navbar-form navbar-left" id="forsearchstuinfo">
                            <div class="input-group">
                                <input type="text" value="" class="form-control" placeholder="用户名..." name="username" id="username">
                                <span class="input-group-btn"><button type="button" class="btn btn-primary" id="studentsearch">搜索</button></span>
                            </div>
                        </form>
                    </div>
                    <div style="position: relative;left: 50%;">
                        <button type="button" class="btn btn-primary" style="position:relative;margin: 20px 20px;" id="addstudent">增加学生</button>
                    </div>
                </div>
                <div style="width: 100%;height:70%">
                    <table class="table table-hover" style="width: 70%;text-align: left">
                        <thead>
                        <tr>
                            <th>姓名</th>
                            <th>学号</th>
                            <th>电话</th>
                            <th>寝室号</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody id="showstuinfo">
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

</html>
