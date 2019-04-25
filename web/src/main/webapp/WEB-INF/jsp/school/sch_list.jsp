<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	table tbody tr:nth-child(odd){background:#F4F4F4;}
	table tbody td:nth-child(even){color:#C00;}
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
				<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>学校信息列表</h3>
			  </div>
			  <div class="panel-body">
<form class="form-inline" role="form" style="float:left;">
  <div class="form-group has-feedback">
    <div class="input-group">
      <div class="input-group-addon">查询条件</div>
      <input id="queryText" class="form-control has-success" type="text" placeholder="请输入查询条件">
    </div>
  </div>
  <button id="queryBtn" type="button" class="btn btn-warning"><i class="glyphicon glyphicon-search"></i> 查询</button>
  
</form>
<button type="button" class="btn btn-primary" style="float:right;" onclick="window.location.href='${APP_PATH}/school/addSchool.htm'"><i class="glyphicon glyphicon-plus"></i> 新增</button>
<br>
 <hr style="clear:both;">
          <div class="table-responsive">
            <table class="table  table-bordered">
              <thead>
                <tr>
                  <th width="30">#</th>
				  <th width="30"><input type="checkbox"></th>
                  <th>学校名称</th>
                  <th>学校编号</th>
                  <th>学校地址</th>
                </tr>
              </thead>
              <tbody id="dataBody">

              </tbody>
			  <tfoot>
			     <tr >
				     <td colspan="6" align="center">
						<ul class="pagination">
							
						</ul>
					 </td>
				 </tr>

			  </tfoot>
            </table>
          </div>
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
			    
			    <c:if test="${empty param.pageno}">
			   		 pageQuery(1);
			    </c:if>
			    <c:if test="${not empty param.pageno}">
		   			 pageQuery("${param.pageno}");
		   		</c:if>
			  	 
			   
            });
            $("tbody .btn-success").click(function(){
                window.location.href = "assignRole.html";
            });
            $("tbody .btn-primary").click(function(){
                window.location.href = "edit.html";
            });
            
            $("#queryBtn").click(function(){
            	var queryText = $("#queryText");
            	if(queryText.val() == ""){
            		layer.msg("请输入查询条件！", {time:1000, icon:5, shift:6},function(){
            			queryText.focus();
            		});
            		return;
            	}
            	flag = true;
            	pageQuery(1);
            });
            
            var flag = false;
            function pageQuery(pageno){
            	var loadingIndex = -1;
            	var jsonData = {
            			pageno  :  pageno,
            			pagesize : 5
            	}
            	if(flag){
            		jsonData["queryText"]=$("#queryText").val();
            	}
            	$.ajax({
            		type : "POST",
            		url  : "${APP_PATH}/school/queryPageData.do",
            		data : jsonData,
            		beforeSend : function(){
            			loadingIndex = layer.msg('处理中', {icon: 16});
            		},
            		success : function(result){
            			layer.close(loadingIndex);
            			var schoolPage = result.data;
            			if(result.success){
            				var dataContent = "";
            				$.each(schoolPage.data,function(i,school){
            	                dataContent = dataContent + '<tr>';
            	                dataContent = dataContent + '  <td>'+(i+1)+'</td>';
            					dataContent = dataContent + '  <td><input type="checkbox"></td>';
            	                dataContent = dataContent + '  <td>'+school.sch_name+'</td>';
            	                dataContent = dataContent + '  <td>'+school.sch_number+'</td>';
            	                dataContent = dataContent + '  <td>'+school.sch_address+'</td>';
            	                dataContent = dataContent + '</tr>';
            				});
            				$("#dataBody").html(dataContent);            				
            			}else{
            				layer.msg("学校信息查询失败！", {time:1000, icon:5, shift:6});
            			}
            			
            			//生成页码
            			var pageContent = "";
            			if(pageno > 1){
            				pageContent = pageContent + '<li><a href="#" onclick="pageQuery('+(pageno-1)+')">上一页</a></li>';
            			}
            			for(var i = 1;i <= schoolPage.totalsize;i++){
            				if(i == pageno){
            					pageContent = pageContent + '<li class="active"><a href="#">'+i+'</a></li>';
            				}else{
            					pageContent = pageContent + '<li><a href="#" onclick="pageQuery('+i+')">'+i+'</a></li>';
            				}
            			}
            			if(pageno < schoolPage.totalsize){
            				pageContent = pageContent + '<li><a href="#" onclick="pageQuery('+(pageno+1)+')">下一页</a></li>';
            			}
            			$(".pagination").html(pageContent);
            		}
            	})
            }
            
			function deleteUserById(id,sch_name){
				layer.confirm("是否要删除"+sch_name+",请选择？",  {icon: 3, title:'提示'}, function(cindex){
					$.ajax({
						type  : "POST",
						url   : "${APP_PATH}/school/deleteSchoolById.do",
						data  : {
							id  :  id
						},
						success  : function(result){
							if(result.success){
								layer.msg("删除"+sch_name+"成功", {time:1000, icon:5, shift:6});
								pageQuery(1);
							}else{
								layer.msg("用户删除失败", {time:1000, icon:5, shift:6});
							}
						}
					})
				    layer.close(cindex);
				}, function(cindex){
				    layer.close(cindex);
				});
			}
			
			function editUserById(id,pageno){
				window.location.href = "${APP_PATH}/school/editSchool.htm?id="+id+"&pageno="+pageno;
			}
            
            
            
        </script>
  </body>
</html>




















































