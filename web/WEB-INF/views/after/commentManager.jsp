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
        var url;

        function deleteComment() {
            var selectedRows = $("#dg").datagrid('getSelections');
            if (selectedRows.length == 0) {
                $.messager.alert("系统提示", "请选择要删除的评论！");
                return;
            }
            var strIds = [];
            for (var i = 0; i < selectedRows.length; i++) {
                strIds.push(selectedRows[i].comment_id);
            }
            var ids = strIds.join(",");
            $.messager.confirm("系统提示", "您确认要删掉这<font color=red>" + selectedRows.length + "</font>条评论吗？", function (r) {
                if (r) {
                    $.post("admin/admin_delComment.action", {delIds: ids}, function (result) {
                        // var json = $.parseJSON(result);
                        if (result.success == "true") {
                            $.messager.alert("系统提示", "您已成功删除<font color=red>" + result.del_Num + "</font>条评论！");
                            $("#dg").datagrid("reload");
                        } else {
                            $.messager.alert('系统提示', result.msg);
                        }
                    }, "json");
                }
            });
        }

    </script>
</head>
<body>
<table id="dg" title="管理评论信息" class="easyui-datagrid"
       data-options="url:'admin/admin_allComment.action',pagination:true,rownumbers:true,fitColumns:true, fit:true "  toolbar="#tb" >
    <thead>
    <tr>
        <th field="cb" checkbox="true"></th>
        <th field="comment_id" width="50" align="center">评论编号</th>
        <th field="post_title" width="50" align="center"  data-options="formatter:function(value,rec){return rec.comment_post.post_title}">帖子标题</th>
        <th field="comment_text" width="100" align="center">评论内容</th>
        <th field="comment_uid" width="50" align="center"  data-options="formatter:function(value,rec){return rec.comment_user.user_id}">作者</th>
        <th field="comment_time" width="50" align="center">评论时间</th>

    </tr>
    </thead>
</table>

<div id="tb" align="center">
    <div>
        <a href="javascript:deleteComment()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
    </div>
    <div>
</div>
</div>
</body>
</html>
