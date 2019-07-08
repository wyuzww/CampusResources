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
        var url;

        function openAddRegisterDialog() {
            $("#dlg").dialog("open").dialog("setTitle", "批量导入帐号");
            url = "admin/admin_addRegisterFile.action";
        }

        function checkUser() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0 ) {
                $.messager.alert("系统提示", "请选择要审核通过的数据！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].register_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要通过这<font color=red>" + selectedRows.length + "</font>条数据吗？", function (r) {
                if (r) {
                    $.post("admin/admin_approveRegister.action", {delIds: ids}, function (result) {
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功审核<font color=red>" + result.del_Num + "</font>条数据！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

        function save() {
            $("#fm").form("submit", {
                url: url,
                onSubmit: function () {
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

    </script>
</head>
<body>
<table id="dg" title="管理注册帐号信息" class="easyui-datagrid"
       data-options="url:'admin/admin_allRegister.action',pagination:true,rownumbers:true,fitColumns:true, fit:true " toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="register_id" width="50" align="center">帐号</th>
        <th field="register_password" width="50" align="center">密码</th>
        <th field="register_name" width="50" align="center">姓名</th>
        <th field="register_class" width="50" align="center">班级</th>
        <th field="register_level" width="50" align="center">权限</th>
    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:openAddRegisterDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">批量导入</a>
        <a href="javascript:checkUser()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">审核通过</a>
    </div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 370px;height: 250px;padding: 10px 20px"
     closed="true" buttons="#dlg-buttons">
    <form id="fm" method="post" enctype="multipart/form-data">
            <input name="registerFile" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,
            application/vnd.ms-excel" class="easyui-filebox" plain="true" data-options="buttonText:'选择文件'" required/>
    </form>
</div>

<div id="dlg-buttons">
    <a href="javascript:save()" class="easyui-linkbutton" iconCls="icon-ok">导入</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>

</div>
</body>
</html>
