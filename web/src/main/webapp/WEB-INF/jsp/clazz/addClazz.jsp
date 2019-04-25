<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="GB18030">
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
				  <li><a href="${APP_PATH}/main.htm">首页</a></li>
				  <li><a href="${APP_PATH}/clazz/index.htm">班级信息列表</a></li>
				  <li class="active">班级信息新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">新增班级信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="ClazzForm">
				  <div class="form-group">
					<label for="exampleInputPassword1">班级名称</label>
					<input type="text" class="form-control" id="cla_name" placeholder="请输入班级名称">
				  </div>
				  <button id="insertBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
				  <button id="resetBtn" type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
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
            
            $("#resetBtn").click(function(){
            	$("#ClazzForm")[0].reset();
            });
            
            $("#insertBtn").click(function(){
            	//提出新增用户信息，并进行非空验证
            	var cla_name = $("#cla_name");
            	if(cla_name.val() == ""){
            		 layer.msg("请输入班级名称", {time:1000, icon:5, shift:6}, function(){
            			 cla_name.focus();
            		 });
            		 return;
            	}
            	
            	var loadingIndex = -1;
            	$.ajax({
            		type  : "POST",
            		url   : "${APP_PATH}/clazz/insertClazz.do",
            		data  : {
            			cla_name : cla_name.val(),
            			sch_id   : "${loginUser.sch_id}"
            		},
            		beforeSend : function(){
            			loadingIndex = layer.msg('处理中', {icon: 16});
            		},
            		success : function(result){
            			if(result.success){
            				window.location.href = "${APP_PATH}/clazz/index.htm";
            			}else{
            				layer.msg("班级信息新增失败！", {time:1000, icon:5, shift:6});
            			}
            		}
            	})
            	
            	
            });
            
            
            
            
            
        </script>
  </body>
</html>









































