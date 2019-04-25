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
	<style>
	.tree li {
        list-style-type: none;
		cursor:pointer;
	}
	.tree-closed {
	    height : 40px;
	}
	.tree-expanded {
	    height : auto;
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
			<div class="panel panel-default">
			  <div class="panel-heading">
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>学校信息</h3>
			  </div>
			  <div class="panel-body">

            <form class="well form-search">
					<h5>学校名称</h5><input id="sch_name" type="text" class="form-control" style="margin-top:10px;">
					<h5>学校图标</h5><input id="sch_img" type="text" class="form-control" style="margin-top:10px;">
     				<h5>学校编号</h5><input id="sch_number" type="text" class="form-control" style="margin-top:10px;">
     				<h5>学校类型</h5><input id="sch_type" type="text" class="form-control" style="margin-top:10px;">
     				<h5>学校校训</h5><input id="sch_motto" type="text" class="form-control" style="margin-top:10px;">
     				<h5>学校地址</h5><input id="sch_address" type="text" class="form-control" style="margin-top:10px;">
     				<h5>学校简介</h5><input id="sch_desc" type="text" class="form-control" style="margin-top:10px;">
     				<button id="saveBtn" type="button" class="btn btn-default btn-success dropdown-toggle" style="margin-top:10px;"> 
     				保存
				    </button>
				    <button id="resetBtn" type="button" class="btn btn-default btn-success dropdown-toggle" style="margin-top:10px;"> 
     				重置
				    </button>
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
            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole.html";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit.html";
            });
            
            $("#saveBtn").click(function(){
            	var sch_name = $("#sch_name");
            	if(sch_name.val() == ""){
        			layer.msg("学校名称不能为空！", {time:1000, icon:5, shift:6},function(){
        				sch_name.focus();
        			});
        			return;
        		}
            	
            	var eb_name = $("#eb_name");
            	if(eb_name.val() == ""){
        			layer.msg("教育局名称不能为空！", {time:1000, icon:5, shift:6},function(){
        				eb_name.focus();
        			});
        			return;
        		}
            	
            	var jsonData = {
            			id       : "${loginUser.sch_id}",
            			sch_name : $("#sch_name").val(),
            			sch_img  : $("#sch_img").val(),
            			sch_number : $("#sch_number").val(),
            			sch_type  : $("#sch_type").val(),
            			sch_motto : $("#sch_motto").val(),
            			sch_address : $("#sch_address").val(),
            			sch_desc  : $("#sch_desc").val()
            	};
            	var loadingIndex = -1;
            	$.ajax({
            		type  :  "POST",
            		url   :  "${APP_PATH}/school/updateSchool.do",
            		data  :  jsonData,
            		beforeSend : function(){
            			loadingIndex = layer.msg('处理中', {icon: 16});
            		},
            		success : function(result){
            			if(result.success){
            				window.location.href = "${APP_PATH}/school/index.htm";
            			}else{
            				layer.msg("新增学校失败！", {time:1000, icon:5, shift:6});
            			}
            		}
            	});
            });
            
            
        
            
            	
            
		
			
		
            
            
            
        </script>
  </body>
</html>
