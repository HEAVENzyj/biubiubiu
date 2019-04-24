<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
    <link rel="stylesheet" href="${APP_PATH}/css/main.css">
    <link rel="stylesheet" href="${APP_PATH}/css/doc.min.css">
    <style>
        .tree li {
            list-style-type: none;
            cursor:pointer;
        }
    </style>
</head>

<body>
<%@include file="/WEB-INF/jsp/common/header.jsp"%>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <%@include file="/WEB-INF/jsp/common/workbench.jsp"%>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <ol class="breadcrumb">
                <li><a href="${APP_PATH}/main/htm">首页</a></li>
                <li><a href="${APP_PATH}/user/index.htm">教师信息列表</a></li>
                <li class="active">教师信息新增</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">新增教师信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form role="form" id="eduBureauForm">
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师编号</label>
                            <input type="text" class="form-control" id="tea_number" placeholder="请输入教师编号">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师姓名</label>
                            <input type="text" class="form-control" id="tea_name" placeholder="请输入教师姓名">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师性别</label>
                            <input type="text" class="form-control" id="tea_sex" placeholder="请输入教师性别">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师住址</label>
                            <input type="text" class="form-control" id="tea_address" placeholder="请输入教师住址">
                        </div>
                        <%--<div class="form-group">
                            <label for="exampleInputPassword1">教师生日</label>
                            <input type="text" class="form-control" id="tea_brithday" placeholder="请输入教师生日">
                        </div>--%>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师电话</label>
                            <input type="text" class="form-control" id="tea_phone" placeholder="请输入教师电话">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师学校</label>
                            <input type="text" class="form-control" id="sch_id" placeholder="请输入教师学校">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师课程</label>
                            <input type="text" class="form-control" id="cou_id" placeholder="请输入教师课程">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师班级</label>
                            <input type="text" class="form-control" id="cla_id" placeholder="请输入教师班级">
                        </div>
                        <%--<div class="form-group">
                            <label for="exampleInputPassword1">注册时间</label>
                            <input type="text" class="form-control" id="tea_createTime" placeholder="请输入注册时间">
                        </div>--%>
                        <button id="insertBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
<script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
<script src="${APP_PATH}/script/docs.min.js"></script>
<script src="${APP_PATH}/jquery/layer/layer.js"></script>
<script type="text/javascript">
    $(function () {
        $(".list-group-item").click(function(){
            if ( $(this).find("ul") ) {
                $(this).toggleClass("tree-closed");
                if ( $(this).hasClass("tree-closed") ) {
                    $("ul", this).hide("fast");
                } else {
                    $("ul", this).show("fast");
                }
            }
        });
    });

    $("#insertBtn").click(function(){
        //提出新增教师信息，并进行非空验证
        var tea_number = $("#tea_number");
        if(tea_number.val() == ""){
            layer.msg("请输入教师编号", {time:1000, icon:5, shift:6}, function(){
                tea_number.focus();
            });
            return;
        }
        var tea_name = $("#tea_name ");
        if(tea_name.val() == ""){
            layer.msg("请输入教师姓名", {time:1000, icon:5, shift:6}, function(){
                tea_name.focus();
            });
            return;
        }
        var tea_sex = $("#tea_sex");
        if(tea_sex.val() == ""){
            layer.msg("请输入教师性别", {time:1000, icon:5, shift:6}, function(){
                tea_sex.focus();
            });
            return;
        }
        var tea_address = $("#tea_address");
        if(tea_address.val() == ""){
            layer.msg("请输入教师地址", {time:1000, icon:5, shift:6}, function(){
                tea_address.focus();
            });
            return;
        }
       /* var tea_brithday = $("#tea_brithday");
        if(tea_brithday.val() == ""){
            layer.msg("请输入教师生日", {time:1000, icon:5, shift:6}, function(){
                tea_sex.focus();
            });
            return;
        }*/
        var tea_phone = $("#tea_phone");
        if(tea_phone.val() == ""){
            layer.msg("请输入教师电话", {time:1000, icon:5, shift:6}, function(){
                tea_phone.focus();
            });
            return;
        }
        var sch_id = $("#sch_id");
        if(sch_id.val() == ""){
            layer.msg("请输入教师学校", {time:1000, icon:5, shift:6}, function(){
                sch_id.focus();
            });
            return;
        }
        var cou_id = $("#cou_id");
        if(cou_id.val() == ""){
            layer.msg("请输入教师课程", {time:1000, icon:5, shift:6}, function(){
                cou_id.focus();
            });
            return;
        }var cla_id = $("#cla_id");
        if(cla_id.val() == ""){
            layer.msg("请输入教师班级", {time:1000, icon:5, shift:6}, function(){
                cla_id.focus();
            });
            return;
        }
       /* var tea_createTime = $("#tea_createTime");
        if(tea_createTime.val() == ""){
            layer.msg("请输入注册时间", {time:1000, icon:5, shift:6}, function(){
                tea_createTime.focus();
            })
            return;
        }*/

        var loadingIndex = -1;
        $.ajax({
            type  : "POST",
            url   : "${APP_PATH}/teacher/insertTeacher.do",
            data  : {
                tea_number : $("#tea_number").val(),
                tea_name : $("#tea_name").val(),
                tea_sex : $("#tea_sex").val(),
                tea_address : $("#tea_address").val(),
                /*tea_brithday : $("#tea_brithday").val(),*/
                tea_phone :$("#tea_phone").val(),
                sch_id : $("#sch_id").val(),
                cou_id : $("#cou_id").val(),
                cla_id : $("#cla_id").val()
                /*tea_createTime : tea_createTime.val()*/
            },
            beforeSend : function(){
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result){
                if(result.success){
                    window.location.href = "${APP_PATH}/teacher/index.htm";
                }else{
                    layer.msg("教师信息新增失败！", {time:1000, icon:5, shift:6});
                }
            }
        })
    });
</script>
</body>
</html>
