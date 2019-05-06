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
                <li><a href="${APP_PATH}/user/index.htm">通知列表</a></li>
                <li class="active">新增通知</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">新增通知<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form role="form" id="eduBureauForm">
                        <div class="form-group">
                            <label for="exampleInputPassword1">通知标题</label>
                            <input type="text" class="form-control" id="inf_headline" placeholder="请输入通知标题">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">通知内容</label>
                            <textarea style="width:100%;height:150px; OVERFLOW: visible"  id="inf_content">请输入通知内容</textarea>
                            <%--<input type="text" style="width: 100%;height: 200px;" class="form-control" id="inf_content" placeholder="请输入通知内容">--%>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">发布人</label>
                            <input type="text" class="form-control" id="inf_U_name" placeholder="请输入发布人或发布单位名称">
                        </div>
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
        //提出新增通知信息，并进行非空验证
        var inf_headline = $("#inf_headline");
        if(inf_headline.val() == ""){
            layer.msg("请输入通知标题", {time:1000, icon:5, shift:6}, function(){
                inf_headline.focus();
            });
            return;
        }
        var inf_content = $("#inf_content");
        if(inf_content.val() == ""){
            layer.msg("请输入通知内容", {time:1000, icon:5, shift:6}, function(){
                inf_content.focus();
            });
            return;
        }
        var inf_content = $("#inf_U_name");
        if(inf_content.val() == ""){
            layer.msg("请输入发布人或发布单位", {time:1000, icon:5, shift:6}, function(){
                inf_content.focus();
            });
            return;
        }

        var loadingIndex = -1;
        $.ajax({
            type  : "POST",
            url   : "${APP_PATH}/inform/insertInform.do",
            data  : {
                inf_headline : $("#inf_headline").val(),
                inf_content : $("#inf_content").val(),
                inf_U_name : $("#inf_U_name").val(),
            },

            beforeSend : function(){
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result){
                if(result.success){
                    layer.alert("通知添加成功！", {icon:6, time:2000, shift:6});
                    setTimeout("window.location.href = \"${APP_PATH}/inform/index.htm\";",2000);
                }else{
                    layer.msg("通知新增失败！", {icon:5, time:2000, shift:6});
                }
            }
        })
    });
</script>
</body>
</html>
