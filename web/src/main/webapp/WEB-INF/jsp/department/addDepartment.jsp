<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/21
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<html>
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

                <div class="panel-heading">
                    新增部门信息
                    <div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal">
                        <i class="glyphicon glyphicon-question-sign"></i>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form" id="eduBureauForm">
                        <div class="form-group">
                            <label for="exampleInputPassword1">所属单位</label>
                            <input type="text" class="form-control" id="pid" placeholder="请输入教师编号">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">名称</label>
                            <input type="text" class="form-control" id="name" placeholder="请输入部门名称">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">备注</label>
                            <input type="text" class="form-control" id="remarks" placeholder="请输入教师性别">
                        </div>

                        <button id="insertBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                        <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                    </form>
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
        var tea_number = $("#pid");
        if(tea_number.val() == ""){
            layer.msg("请输入其所属单位", {time:1000, icon:5, shift:6}, function(){
                tea_number.focus();
            });
            return;
        }
        var tea_name = $("#name ");
        if(tea_name.val() == ""){
            layer.msg("请输入名称", {time:1000, icon:5, shift:6}, function(){
                tea_name.focus();
            });
            return;
        }

        var loadingIndex = -1;
        $.ajax({
            type  : "POST",
            url   : "${APP_PATH}/department/insertDepartment.do",
            data  : {
                pid : $("#pid").val(),
                name : $("#name").val(),
                remarks : $("#remarks").val()
                /*tea_createTime : tea_createTime.val()*/
            },

            beforeSend : function(){
                loadingIndex = layer.msg('处理中', {icon: 16});
            },
            success : function(result){
                if(result.success){
                    layer.alert("添加成功！", {icon:6, time:2000, shift:6});
                    setTimeout("window.location.href = \"${APP_PATH}/department/index.htm\";",2000);
                }else{
                    layer.msg("新增失败！请联系管理员。", {icon:5, time:2000, shift:6});
                }
            }
        })
    });
</script>
</body>
</html>
