<%--
  Created by IntelliJ IDEA.
  User: zhangyoujun
  Date: 2019/4/29
  Time: 10:52
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
                <li><a href="${APP_PATH}/inform/index.htm">通知列表</a></li>
                <li class="active">通知信息</li>
            </ol>
            <div class="panel panel-default">
                <div class="panel-heading">修改通知<div style="float:right;cursor:pointer;" data-toggle="modal" data-target="#myModal"><i class="glyphicon glyphicon-question-sign"></i></div></div>
                <div class="panel-body">
                    <form id="EdubureauForm" role="form">
                        <div class="form-group">
                            <label for="exampleInputPassword1">通知标题</label>
                            <input type="text" class="form-control" id="inf_headline" value="${inform.inf_headline}">
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">通知内容</label><br />
                            <%--<input type="text"  class="bs" value="${inform.inf_content}">--%>
                            <textarea style="width:100%;height:150px; OVERFLOW: visible"  id="inf_content">${inform.inf_content}</textarea>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">发布人</label>
                            <input type="text" class="form-control" id="inf_U_name" value="${inform.inf_U_name}">
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
            url  : "${APP_PATH}/inform/updateInform.do",
            data : {
                inf_headline : $("#inf_headline").val(),
                inf_content : $("#inf_content").val(),
                inf_U_name: $("#inf_U_name").val(),
                id  : "${param.id}"
            },
            beforeSend : function(){
                loadingIndex = layer.msg('处理中,请稍后', {icon: 16});
            },
            success : function(result){
                if(result.success){
                    layer.close(loadingIndex);
                    layer.msg("修改成功!", {time:1000, icon:6, shift:6},function(){
                        setTimeout("",2000);
                        window.location.href = "${APP_PATH}/inform/index.htm?pageno="+${param.pageno};
                    });
                }else{
                    layer.msg("修改失败!", {time:1000, icon:5, shift:6});
                }
            }
        })
    });

    //使文本框随着里面内容的多少而改变自身大小.
    /*$(function(){
        //propertychange监听input里面的字符变化,属性改变事件
        $('.bs').bind('input propertychange', function() {
            var $this = $(this);
            console.log($this);
            var text_length = $this.val().length;//获取当前文本框的长度
            var current_width = parseInt(text_length) *16;//该16是改变前的宽度除以当前字符串的长度,算出每个字符的长度
            console.log(current_width)
            $this.css("width",current_width+"px");
        });
    })*/
</script>
</body>
</html>
