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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/md5.js"></script>
    <%--<script type="text/javascript" src="resources/js/default.js"></script>--%>
    <script type="text/javascript">

        var user_level = "${currentUser.user_level}";

        var url;


        function deleteUser() {
            if (user_level == "超级管理员") {

            } else {
                $.messager.alert("系统提示", "您没有这个权限！");
                return;
            }

            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].user_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("admin/admin_delUser.action", {delIds: ids}, function (result) {
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.del_Num + "</font>条数据！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function searchUser() {
            $('#dg').datagrid('load', {
                user_id: $('#f_user_id').val(),
            });
        }


        function openAddStudentDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "添加学生信息");
            resetValue();
            url = "admin/admin_addStudent.action";
        }

        function saveUser() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {

                    if ($('#user_id').val() == "" || $('#user_password').val() == "" || $('#student_name').val() == "" || $('#student_class').val() == "") {
                        $.messager.alert("系统提示", "请输入必填内容！");
                        return false;
                    }
                    return $(this).form("validate");
                },
                success: function (result) {
                    var json = $.parseJSON(result);
                    console.info(json)
                    if (json.success == "false") {
                        $.messager.alert("系统提示", json.msg);
                        return;
                    } else {
                        $.messager.alert("系统提示", json.msg);
                        $("#dlg").dialog("close");
                        $("#dg").datagrid("reload");
                    }
                }
            });
        }

        function resetValue() {
            $("#user_id").val("");
            $("#user_password").val("");
            $("#student_name").val("");
            $("#student_class").val("");
        }

        function closeDialog() {
            $("#dlg").dialog("close");
            resetValue();
        }
    </script>
</head>
<body>
<table id="dg" title="管理学生帐号" class="easyui-datagrid"
       data-options="url:'admin/admin_allStudent.action',pagination:true,rownumbers:true,fitColumns:true, fit:true " toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="user_id" width="100" align="center" >帐号</th>
        <th field="user_password" width="100" align="center">密码</th>
        <th field="student_name" width="100" align="center"  data-options="formatter:function(value,rec){return rec.user_student.student_name}">姓名</th>
        <th field="student_sex" width="50" align="center" data-options="formatter:function(value,rec){return rec.user_student.student_sex}">性别</th>
        <th field="student_birth" width="100" align="center" data-options="formatter:function(value,rec){return rec.user_student.student_birth}">生日</th>
        <th field="student_class" width="50" align="center"data-options="formatter:function(value,rec){return rec.user_student.student_class}">班级</th>
        <th field="student_desc" width="150" align="center" data-options="formatter:function(value,rec){return rec.user_student.student_desc}">个人说明</th>
        <th field="user_level" width="50" align="center">权限</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center" >
    <div>
        <a href="javascript:openAddStudentDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
        <a href="javascript:deleteUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>&nbsp;帐号：&nbsp;<input type="text" name="f_user_id" id="f_user_id" size="10"/>
        <a href="javascript:searchUser()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a></div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 570px;height: 250px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post">
        <table cellspacing="5px;">
            <tr>
                <td>帐号：</td>
                <td><input type="text" name="user_id" id="user_id" class="easyui-validatebox"
                           required="true"/></td>
                <td>密码：</td>
                <td><input type="text" name="user_password" id="user_password" class="easyui-validatebox"
                           required="true"/></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td><input type="text" name="user_student.student_name" id="student_name" class="easyui-validatebox"
                           required="true"/></td>
                <td>班级：</td>
                <td><input type="text" name="user_student.student_class" id="student_class" class="easyui-validatebox"
                           required="true"/></td>
            </tr>
        </table>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:saveUser()" class="easyui-linkbutton" iconCls="icon-ok">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
</div>
</body>
</html>
