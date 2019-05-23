<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <link rel="stylesheet" href="${APP_PATH}/ztree/css/metroStyle/metroStyle.css" rel="stylesheet" type="text/css"/>
    <style>
        .tree li {
            list-style-type: none;
            cursor: pointer;
        }
        .ztree{
            font-size: 30px;
        }

        table tbody tr:nth-child(odd) {
            background: #F4F4F4;
        }

        table tbody td:nth-child(even) {
            color: #CC3300;
        }

    </style>
</head>

<body>

<%@include file="/WEB-INF/jsp/common/header.jsp" %>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
            <div class="tree">
                <%@include file="/WEB-INF/jsp/common/workbench.jsp" %>
            </div>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>部门信息列表</h3>
                </div>
                <div class="panel-body">
                    <form class="form-inline" role="form" style="float:left;">
                        <div class="form-group has-feedback">
                            <div class="input-group">
                                <div class="input-group-addon">查询条件</div>
                                <input id="queryText" class="form-control has-success" type="text"
                                       placeholder="请输入查询条件">
                            </div>
                        </div>
                        <button id="queryBtn" type="button" class="btn btn-warning"><i
                                class="glyphicon glyphicon-search"></i> 查询
                        </button>
                    </form>

                    <br>
                    <hr>
                    <div style="width: 100%;">
                        <table style="width: 100%;">
                            <tr>
                                <td style="width: 500px;height: 550px; font-size: 50px;">
                                    <ul id="treeDemo" class="ztree"></ul>
                                </td>
                                <td  id="addDep" style="display: none">
                                    <%--增加部门信息开始--%>
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
                                                <input type="text" readonly="readonly" class="form-control" id="pname">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">名称</label>
                                                <input type="text" class="form-control" id="name" placeholder="请输入部门名称">
                                            </div>
                                            <div class="form-group">
                                                <label for="exampleInputPassword1">备注</label>
                                                <input type="text" class="form-control" id="remarks">
                                            </div>

                                            <button id="insertBtn" type="button" class="btn btn-success"><i class="glyphicon glyphicon-plus"></i> 新增</button>
                                            <button type="button" class="btn btn-danger"><i class="glyphicon glyphicon-refresh"></i> 重置</button>
                                        </form>
                                    </div>
                                    <%--增加部门结束--%>
                                </td>
                            </tr>
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
<script type="text/javascript" src="${APP_PATH}/ztree/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="${APP_PATH}/ztree/js/jquery.ztree.all.min.js" ></script>
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
    var settingss = {

        edit:{
            enable: true,
            drag:{
                isMove:true,
                prev:true,
                autoOpenTime: 0
            },
            editNameSelectAll: true,
            showRemoveBtn: true,
            showRenameBtn: true,
            removeTitle: "删除节点",
            renameTitle: "编辑节点名称",

        },
        /*callback: {
            onRename: zTreeOnRename,//修改
            onRemove: zTreeOnRemove,//删除
            onClick: zTreeOnClickRight,

        },*/
        view: {
            addHoverDom: addHoverDom,
            removeHoverDom: removeHoverDom,
            selectedMulti: true,
            showIcon: true,
            showLine: true
        },
        data: {
            simpleData: {
                enable: true,  //true 、 false 分别表示 使用 、 不使用 简单数据模式
                idKey: "id",  //节点数据中保存唯一标识的属性名称
                pIdKey: "pid",    //节点数据中保存其父节点唯一标识的属性名称
                rootPId: 0  //用于修正根节点父节点数据，即 pIdKey 指定的属性值
            },
            key: {
                name: "name"  //zTree 节点数据保存节点名称的属性名称  默认值："name"
            }
        },
        check:{
            enable:true,  //true 、 false 分别表示 显示 、不显示 复选框或单选框
            nocheckInherit:true  //当父节点设置 nocheck = true 时，设置子节点是否自动继承 nocheck = true
        }
    };

    var newCount = 1;
    function addHoverDom(treeId,treeNode){
        var sObj = $("#" + treeNode.tId + "_span");
        if (treeNode.editNameFlag || $("#addBtn_"+treeNode.tId).length>0) return;
        var addStr = "<span class='button add' id='addBtn_" + treeNode.tId+ "' title='添加子节点' onfocus='this.blur();'  onclick='changeDiv()'></span>";
        sObj.after(addStr);
        var btn = $("#addBtn_"+treeNode.tId);
        if (btn) btn.bind("click", function() {
            var zTree = $.fn.zTree.getZTreeObj("treeDemo");
            $("#pname").val(treeNode.name);
            changeDiv=function(){
                /*通过div 的id获取中间div的对象*/
                var divObj=document.getElementById("addDep");
                /*如果div是显示的话就隐藏，否则就显示*/
                if(divObj.style.display=="none"){
                    divObj.style.display="";
                }
            }
            /*var newnade = {id: (100 + newCount), name: "new node" + (newCount++)};
            zTree.addNodes(treeNode, newnade);*/

            /*$.ajax({
                url: "${APP_PATH}/department/insertDepartment.do",
                data: {
                    ParentId: treeNode.id
                },
                type: "post",
                success: function (data) {

                    if (data.message == "success") {
                        //此方法是js在前段增加节点方法，一定要通过后台返回的id来增加，不然新增的节点会出现节点id为null的问题
                        zTree.addNodes(treeNode, { id: data.id, ParentId: treeNode.id, name: "new node" + (newCount++) });
                    }
                    else {
                        $.messageBox5s('@Resource.Tip', "新增节点失败！联系管理员！");
                    }
                }
            })

            return false;*/
        });
    };

    function removeHoverDom(treeId, treeNode) {
        $("#addBtn_"+treeNode.tId).unbind().remove();
    };

    $(document).ready(function(){
        $.ajax({
            type:"POST",
            url:"${APP_PATH}/department/selectDepartments.do",
            async:true,
            success:function(result){
                zTreeObj = $.fn.zTree.init($("#treeDemo"), settingss, result.data); //初始化树
                zTreeObj.expandAll(true); //true 节点全部展开、false节点收缩
            }
        });
    });
    $("#insertBtn").click(function(){
        //提出新增部门信息，并进行非空验证
        var name = $("#name ");
        if(name.val() == ""){
            layer.msg("请输入名称", {time:1000, icon:5, shift:6}, function(){
                name.focus();
            });
            return;
        }

        var loadingIndex = -1;
        $.ajax({
            type  : "POST",
            url   : "${APP_PATH}/department/insertDepartment.do",
            data  : {
                pname : $("#pname").val(),
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