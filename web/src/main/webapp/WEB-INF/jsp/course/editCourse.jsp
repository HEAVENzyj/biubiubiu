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
				  <li><a href="${APP_PATH}/course/index.htm">课程信息列表</a></li>
				  <li class="active">修改课程信息</li>
				</ol>
			<div class="panel panel-default">
              <div class="panel-heading">修改课程信息<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
			  <div class="panel-body">
				<form id="CourseForm" role="form">
				  <div class="form-group">
					<label for="exampleInputPassword1">课程名称</label>
					<input type="text" class="form-control" id="cou_name" value="${course.cou_name}">
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
            	$("#CourseForm")[0].reset();
            });
            
            var loadingIndex = -1;
            $("#updateBtn").click(function(){
            	$.ajax({
            		type : "POST",
            		url  : "${APP_PATH}/course/updateCourse.do",
            		data : {
            			cou_name : $("#cou_name").val(),
            			id           : "${param.id}"
            		},
            		beforeSend : function(){
            			loadingIndex = layer.msg('处理中,请稍后', {icon: 16});
            		},
            		success : function(result){
            			if(result.success){
            				layer.close(loadingIndex);
            				layer.msg("课程修改成功", {time:1000, icon:5, shift:6},function(){
            					window.location.href = "${APP_PATH}/course/index.htm?pageno="+${param.pageno};
            				});
            			}else{
            				layer.msg("课程修改失败", {time:1000, icon:5, shift:6});
            			}
            		}
            	})
            });
            
            
        </script>
  </body>
</html>
































