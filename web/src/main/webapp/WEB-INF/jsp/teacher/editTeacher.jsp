<%--
  Created by IntelliJ IDEA.
  User: zhangyoujun
  Date: 2019/4/25
  Time: 16:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="GB18030">
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
                <li><a href="${APP_PATH}/teacher/index.htm">教师信息列表</a></li>
                <li class="active">修改教师信息</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">修改教师信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form id="EdubureauForm" role="form">
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师编号</label>
                            <input type="text" class="form-control" id="tea_number" value="${teacher.tea_number}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师名称</label>
                            <input type="text" class="form-control" id="tea_name" value="${teacher.tea_name}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师性别</label>
                            <input type="text" class="form-control" id="tea_sex" value="${teacher.tea_sex}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师地址</label>
                            <input type="text" class="form-control" id="tea_address" value="${teacher.tea_address}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师生日</label>
                            <input type="date" class="form-control" id="tea_brithday" value="${teacher.tea_brithday}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师电话</label>
                            <input type="text" class="form-control" id="tea_phone" value="${teacher.tea_phone}">
                        </div>
                        <%--<div class="form-group">
                            <label for="exampleInputPassword1">教师学校</label>
                            <input type="text" class="form-control" id="sch_id" value="${teacher.sch_id}">
                        </div>--%>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师课程</label>
                            <input type="text" class="form-control" id="cou_id" value="${teacher.cou_id}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">教师班级</label>
                            <input type="text" class="form-control" id="cla_id" value="${teacher.cla_id}">
                        </div>

                        <button id="updateBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-edit"></i> 修改</button>
                        <button id="resetBtn" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title" id="myModalLabel">帮助</h4>
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

    $("#resetBtn").click(function(){
        //reset()方法是DOM对象的方法，jq对象没有，需要将jq对象转换为DOM对象
        $("#EdubureauForm")[0].reset();
    });

    var loadingIndex = -1;
    $("#updateBtn").click(function(){
        $.ajax({
            type : "POST",
            url  : "${APP_PATH}/teacher/updateTeacher.do",
            data : {
                tea_number : $("#tea_number").val(),
                tea_name : $("#tea_name").val(),
                tea_sex : $("#tea_sex").val(),
                tea_address : $("#tea_address").val(),
                tea_brithday : $("#tea_brithday").val(),
                tea_phone :$("#tea_phone").val(),
                cou_id : $("#cou_id").val(),
                cla_id : $("#cla_id").val(),
                id  : "${param.id}"
            },
            beforeSend : function(){
                loadingIndex = layer.msg('处理中,请稍后', {icon: 16});
            },
            success : function(result){
                if(result.success){
                    layer.close(loadingIndex);
                    layer.msg("教师信息修改成功", {time:1000, icon:5, shift:6},function(){
                        window.location.href = "${APP_PATH}/teacher/index.htm?pageno="+${param.pageno};
                    });
                }else{
                    layer.msg("教师信息修改失败", {time:1000, icon:5, shift:6});
                }
            }
        })
    });


</script>
</body>
</html>
