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
    <title></title>
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

        function deletePost() {
            // if (user_level == "超级管理员") {
            //
            // } else {
            //     $.messager.alert("系统提示", "您没有这个权限！");
            //     return;
            // }
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的帖子！");
                return;
            }

            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].post_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>个帖子吗？", function (r) {
                if (r) {
                    $.post("admin/admin_delPost.action", {delIds: ids}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.del_Num + "</font>个帖子！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function searchPost() {
            $('#dg').datagrid('load', {
                'query.query_name': $('#f_post_title').val(),
                'query.query_type': $('#f_user_level').combobox("getValue"),
            });
        }

    </script>
</head>
<body>
<table id="dg" title="管理帖子信息" class="easyui-datagrid"
       data-options="url:'admin/admin_allPost.action',pagination:true,rownumbers:true,fitColumns:true, fit:true " toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="post_id" width="50" align="center">帖子编号</th>
        <th field="post_title" width="50" align="center">帖子标题</th>
        <th field="post_text" width="100" align="center">帖子内容</th>
        <th field="post_uid" width="50" align="center" data-options="formatter:function(value,rec){return rec.post_user.user_id}">作者</th>
        <th field="user_level" width="50" align="center" data-options="formatter:function(value,rec){return rec.post_user.user_level}">作者类别</th>
        <th field="post_time" width="50" align="center">发布时间</th>

    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:deletePost()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
        &nbsp;帖子标题：&nbsp;<input type="text" name="f_post_title" id="f_post_title" size="10"/>
        &nbsp;作者类别：&nbsp;
        <select class="easyui-combobox" id="f_user_level" name="f_user_level" editable="false" panelHeight="auto"  size="20">
            <option value="">请选择... </option>
            <option value="学生">学生</option>
            <option value="教师">教师</option>
        </select>
        <a href="javascript:searchPost()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>
</div>
</body>
</html>
