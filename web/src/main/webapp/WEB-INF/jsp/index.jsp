<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="keys" content="">
    <meta name="author" content="">
	<link rel="stylesheet" href="${APP_PATH}/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/font-awesome.min.css">
	<link rel="stylesheet" href="${APP_PATH}/css/login.css">
  </head>
  <body>
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <div><a class="navbar-brand" href="index.html" style="font-size:32px;">伟航教育管理平台</a></div>
        </div>
      </div>
    </nav>
	<br><br><br><br><br><br><br>
    <div class="container">
      <form class="form-signin" role="form">
        <h3 class="form-signin-heading"><i class="glyphicon glyphicon-user"></i> 用户登录</h3>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="user_account" placeholder="请输入登录账号" autofocus>
			<span class="glyphicon glyphicon-user form-control-feedback"></span>
		  </div>
		  <div class="form-group has-success has-feedback">
			<input type="text" class="form-control" id="user_password" placeholder="请输入登录密码" style="margin-top:10px;">
			<span class="glyphicon glyphicon-lock form-control-feedback"></span>
		  </div>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
          <br>
        </div>
        <a class="btn btn-lg btn-success btn-block" onclick="doLogin()" > 登录</a>
      </form>
    </div>
    <script src="${APP_PATH}/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/bootstrap/js/bootstrap.min.js"></script>
    <script src="${APP_PATH}/jquery/layer/layer.js"></script>
    <script>
 	function doLogin(){
		var user_account = $("#user_account").val();
		if(user_account == ""){
			alert("登录账号不能为空");
			return;
		}
		var user_password = $("#user_password").val();
		if(user_password == ""){
			alert("登录密码不能为空");
			return;
		}
		
		var loadingIndex = -1;
		$.ajax({
			type : "POST",
			url  : "${APP_PATH}/login.do",
			data : {
				user_account : user_account,
				user_password : user_password
			},
			before : function(){
				loadingIndex = layer.msg('处理中,请稍后', {icon: 16});
			},
           	success : function(result) {
           		layer.close(loadingIndex);
           		if(result.success){
           			window.location.href = "${APP_PATH}/main.htm";
           		}else{
           			layer.msg("用户登录失败，请重新登录！", {time:1000, icon:5, shift:6});
           		}
           	}
		})
	} 
    
    </script>
  </body>
</html>







































