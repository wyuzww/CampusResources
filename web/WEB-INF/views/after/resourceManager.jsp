<%@ page import="com.ethan.entity.User" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2019/4/9
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>校园资源共享平台</title>
    <base href="<%=basePath%>">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/themes/icon.css">
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/jquery.easyui.min.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/resources/jquery-easyui-1.6.10/locale/easyui-lang-zh_CN.js"></script>
    <%--<script type="text/javascript" src="resources/js/default.js"></script>--%>
    <script type="text/javascript">
        var user_level = "${currentUser.user_level}";
        var url;

        function formatGood(val, row) {
            if (val == 1) {
                return '是';
            } else {
                return '否';
            }
        }

        function deleteResource() {
            // if (user_level == "超级管理员") {
            //
            // } else {
            //     $.messager.alert("系统提示", "您没有这个权限！");
            //     return;
            // }
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的资源！");
                return;
            }

            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].resource_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>个资源吗？", function (r) {
                if (r) {
                    $.post("admin/admin_delRes.action", {delIds: ids, flagText: "delete"}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.del_Num + "</font>个资源！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function setGood() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要标优的资源！");
                return;
            }

            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].resource_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要标优这<font color=red>" + selectedRows.length + "</font>个资源吗？", function (r) {
                if (r) {
                    $.post("admin/admin_setGood.action", {delIds: ids, flagText: "update"}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功标优<font color=red>" + result.del_Num + "</font>个资源！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function searchResource() {
            $('#dg').datagrid('load', {
                'query.query_name': $('#f_resource_name').val(),
                'query.query_type': $('#f_user_level').combobox("getValue"),
                'query.query_cate': $('#f_resource_cid').combobox("getValue")
            });
        }

    </script>
</head>
<body>
<table id="dg" title="管理资源信息" class="easyui-datagrid"
       data-options="url:'admin/admin_allRes.action',pagination:true,rownumbers:true,fitColumns:true, fit:true " toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="resource_id" width="50" align="center">资源编号</th>
        <th field="resource_name" width="50" align="center">资源名称</th>
        <th field="resource_cid" width="50" align="center" hidden="true">资源类别号</th>
        <th field="category_name" width="50" align="center" data-options="formatter:function(value,rec){return rec.resource_category.category_name}">资源类别</th>
        <th field="resource_level" width="50" align="center">资源等级</th>
        <th field="resource_uid" width="50" align="center" data-options="formatter:function(value,rec){return rec.resource_uploadUser.user_id}">作者</th>
        <th field="user_level" width="50" align="center" data-options="formatter:function(value,rec){return rec.resource_uploadUser.user_level}">作者类别</th>
        <th field="resource_time" width="50" align="center">上传时间</th>
        <th field="resource_good" width="50" align="center" data-options="formatter:formatGood">是否优秀</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:setGood()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">设为优秀</a>
        <a href="javascript:deleteResource()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;资源名称：&nbsp;<input type="text" name="f_resource_name" id="f_resource_name" size="10"/>
        &nbsp;资源类别：&nbsp;<input class="easyui-combobox" name="f_resource_cid" id="f_resource_cid" size="20"
                              data-options="panelHeight:'auto',editable:false,valueField:'category_id',textField:'category_name',url:'admin/admin_allCateList.action'"/>
        &nbsp;作者类别：&nbsp;
        <select class="easyui-combobox" id="f_user_level" name="f_user_level" editable="false" panelHeight="auto"  size="20">
            <option value="">请选择... </option>
            <option value="学生">学生</option>
            <option value="教师">教师</option>
        </select>
        <a href="javascript:searchResource()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>
</div>
</body>
</html>
