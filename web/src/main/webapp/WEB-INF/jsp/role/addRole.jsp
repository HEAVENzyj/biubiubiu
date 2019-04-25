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
				  <li><a href="${APP_PATH}/main.htm">首页</a></li>
				  <li><a href="${APP_PATH}/role/index.htm">角色信息列表</a></li>
				  <li class="active">角色新增</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">新增角色信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form role="form" id="roleForm">
				  <div class="form-group">
					<label for="exampleInputPassword1">角色名称</label>
					<input type="text" class="form-control" id="role_name" placeholder="请输入角色名称">
				  </div>
				  <div class="form-group">
					<label for="exampleInputPassword1">角色描述</label>
					<input type="text" class="form-control" id="role_desc" placeholder="请输入角色描述">
				  </div>
				  <button id="insertBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 保存</button>
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
            	$("#roleForm")[0].reset();
            })
            
            $("#insertBtn").click(function(){
            	//提出新增用户信息，并进行非空验证
            	var role_name = $("#role_name");
            	if(role_name.val() == ""){
            		 layer.msg("请输入角色名称", {time:1000, icon:5, shift:6}, function(){
            			 role_name.focus();
            		 });
            		 return;
            	}
            	
            	var loadingIndex = -1;
            	$.ajax({
            		type  : "POST",
            		url   : "${APP_PATH}/role/insertRole.do",
            		data  : {
            			role_name : $("#role_name").val(),
            			role_desc : $("#role_desc").val()
            		},
            		beforeSend : function(){
            			loadingIndex = layer.msg('处理中', {icon: 16});
            		},
            		success : function(result){
            			if(result.success){
            				window.location.href = "${APP_PATH}/role/index.htm";
            			}else{
            				layer.msg("角色新增失败！", {time:1000, icon:5, shift:6});
            			}
            		}
            	})
            });
            
            
            
            
            
        </script>
  </body>
</html>









































