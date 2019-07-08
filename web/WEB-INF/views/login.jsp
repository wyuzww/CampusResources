<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2019/4/9
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html>
<head>
    <title>校园资源共享平台</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>


<body>
<header>
    <jsp:include page="before/header.jsp" flush="true" >
        <jsp:param name="active_id" value="0"/>
    </jsp:include>
</header>
<section class=" container">
    <div class="panel panel-default" style="margin: 40px">
        <div class="row clearfix">
            <div class="col-md-12" style="text-align: center"> <h2>用户登录</h2></div>
            <div class="col-md-12 column" style="margin: 20px">


                <div class="col-md-3"></div>

                <form class="col-md-9 form-horizontal" role="form" action="user_login.action" method="post">

                    <div class="form-group">
                        <c:choose>
                            <c:when test="${not empty error }">
                                <div class="alert alert-dismissable alert-danger col-sm-7">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                    <h4>
                                        提示!
                                    </h4> <strong> ${error} </strong>
                                </div>
                            </c:when>
                        </c:choose>

                    </div>

                    <div class="form-group">
                        <label for="user_id" class="col-sm-2 control-label">User</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="user_id" id="user_id" value="${inputUser.user_id}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="user_password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" name="user_password" id="user_password" value="${inputUser.user_password}" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">登录</button>
                            <button type="reset" class="btn btn-danger">重置</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
