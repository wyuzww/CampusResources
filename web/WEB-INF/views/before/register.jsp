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
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
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
    <jsp:include page="header.jsp" flush="true" >
        <jsp:param name="active_id" value="0"/>
    </jsp:include>
</header>
<section class=" container">
    <div class="panel panel-default" style="margin: 40px">
        <div class="row clearfix">
            <div class="col-md-12" style="text-align: center"><h2>用户注册</h2></div>
            <div class="col-md-12 column" style="margin: 20px">


                <div class="col-md-3"></div>

                <form class="col-md-9 form-horizontal" role="form" action="register_register.action" method="post">
                    <div class="form-group">
                        <c:choose>
                            <c:when test="${not empty msg }">
                                <div class="alert alert-dismissable alert-success col-sm-7">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                    <h4>
                                        提示!
                                    </h4> <strong>${msg}</strong>
                                </div>
                            </c:when>
                            <c:when test="${not empty error}">
                                <div class="alert alert-dismissable alert-danger col-sm-7">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                    <h4>
                                        提示!
                                    </h4> <strong>${error}</strong>
                                </div>
                            </c:when>
                        </c:choose>
                    </div>

                    <div class="form-group">
                        <label for="register_id" class="col-sm-2 control-label">User</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="register_id" id="register_id" required value="${inputRegister.register_id}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register_password" class="col-sm-2 control-label">Password</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" name="register_password" id="register_password" value="${inputRegister.register_password}"
                                   required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register_password_confirm" class="col-sm-2 control-label">ConfirmPassword</label>
                        <div class="col-sm-4">
                            <input type="password" class="form-control" name="register_password_confirm" value="${register_password_confirm}"
                                   id="register_password_confirm" required/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="register_level" class="col-sm-2 control-label">UserLevel</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="register_level" id="register_level" required>
                                <option value="学生">学生</option>
                                <option value="教师">教师</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group" id="register_class_form">
                        <label for="register_class" class="col-sm-2 control-label">StudentClass</label>
                        <div class="col-sm-4">
                            <input type="text" class="form-control" name="register_class" id="register_class" required value="${inputRegister.register_class}"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="submit" class="btn btn-default">注册</button>
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

<script>
    $(function () {
        if (${not empty inputRegister.register_level})  {
            $("#register_level").val('${inputRegister.register_level}');
        }

        if ($('#register_level').val() == "学生") {
            $('#register_class_form').show();
        } else {
            $('#register_class_form').hide();
            $('#register_class').attr("required", false);
        }
    });
    $("#register_level").change(function () {
        if ($('#register_level').val() == "学生") {
            $('#register_class_form').show();
        } else {
            $('#register_class_form').hide();
            $('#register_class').attr("required", false);
        }
    });

</script>
</body>
</html>
