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
    session.invalidate();
    response.sendRedirect("user_toLogin.action");
%>

<html>
<head>
    <title>校园资源共享平台</title>
</head>
<body>
退出登录
</body>
</html>
