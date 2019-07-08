<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
<html>
<head>
    <title>校园资源共享平台</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet">
</head>


<body>
<header>
    <jsp:include page="header.jsp" flush="true">
        <jsp:param name="active_id" value="4"/>
    </jsp:include>
</header>

<section class="panel panel-default container">
    <div>
        <ul class="breadcrumb">
            <li class="active">
                用户主页
            </li>
            <li>
                ${person.user_id}的主页
            </li>
        </ul>
    </div>
    <div class="row">

        <div class="col-md-2">
            <ul class="clearfix">
                <h3>他的主页</h3>
                <li style="display:block">
                    <a class="list-group-item active" title="他的信息"
                       href="user/user_personCenter.action?uid=${person.user_id}">他的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="他的资源"
                       href="user/user_personRes.action?uid=${person.user_id}">他的资源</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="他的帖子" href="user/user_personPost.action?uid=${person.user_id}">他的帖子</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <c:choose>
                    <c:when test="${person.user_level == '学生'}">
                        <h3>用户信息<span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                        </h3>
                    </c:when>
                    <c:otherwise>
                        <h3>用户信息<span class="badge " style="background-color: gray;color: yellow">教师</span>
                        </h3>
                    </c:otherwise>
                </c:choose>
            </div>

            <div class="panel panel-default ">
                <div class="container">
                    <c:choose>
                        <c:when test="${person.user_level == '学生'}">

                            <div style="margin: 20px">

                                <form class="col-md-9 form-horizontal" role="form">
                                    <c:choose>
                                        <c:when test="${not empty success}">
                                            <div class="alert alert-dismissable alert-success">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${success}</strong>
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty failed}">
                                            <div class="alert alert-dismissable alert-danger">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${failed}</strong>
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty repeat}">
                                            <div class="alert alert-dismissable alert-danger">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${repeat}</strong>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">帐号</label>
                                        <div class="col-sm-4">
                                            <input type="text" readonly class="form-control" value="${person.user_id}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" readonly
                                                   value="${person.user_student.student_name}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="s_user_sex" disabled>
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <label class="col-sm-2 control-label">班级</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control"  readonly
                                                   value="${person.user_student.student_class}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">生日</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" readonly disabled
                                                   value="<fmt:formatDate value="${person.user_student.student_birth}" pattern="yyyy-MM-dd"/>"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人说明</label>
                                        <div class="col-sm-4">
                                    <textarea class="form-control" rows="4" readonly
                                              style="resize: none">${person.user_student.student_desc}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-10">
                                            <button type="button" class="btn btn-info" onclick="addFollow('${person.user_id}');return false;">关注用户</button>
                                        </div>
                                    </div>
                                </form>
                            </div>

                        </c:when>
                        <c:when test="${person.user_level == '教师'}">
                            <div style="margin: 20px">
                                <form class="col-md-9 form-horizontal" role="form">
                                    <c:choose>
                                        <c:when test="${not empty success}">
                                            <div class="alert alert-dismissable alert-success">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${success}</strong>
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty failed}">
                                            <div class="alert alert-dismissable alert-danger">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${failed}</strong>
                                            </div>
                                        </c:when>
                                        <c:when test="${not empty repeat}">
                                            <div class="alert alert-dismissable alert-danger">
                                                <button type="button" class="close" data-dismiss="alert"
                                                        aria-hidden="true">×
                                                </button>
                                                <h4>
                                                    提示!
                                                </h4> <strong>${repeat}</strong>
                                            </div>
                                        </c:when>
                                    </c:choose>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">帐号</label>
                                        <div class="col-sm-4">
                                            <input type="text" readonly class="form-control" value="${person.user_id}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">姓名</label>
                                        <div class="col-sm-4">
                                            <input type="text" class="form-control" readonly
                                                   value="${person.user_teacher.teacher_name}"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">性别</label>
                                        <div class="col-sm-4">
                                            <select class="form-control" id="t_user_sex" disabled>
                                                <option value="男">男</option>
                                                <option value="女">女</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">生日</label>
                                        <div class="col-sm-4">
                                            <input class="form-control" readonly disabled
                                                   value="<fmt:formatDate value="${person.user_teacher.teacher_birth}" pattern="yyyy-MM-dd"/>"/>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-sm-2 control-label">个人说明</label>
                                        <div class="col-sm-4">
                                    <textarea class="form-control" rows="4" readonly
                                              style="resize: none">${person.user_teacher.teacher_desc}</textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-3 col-sm-10">
                                            <button type="button" class="btn btn-info" onclick="addFollow('${person.user_id}');return false;">关注用户</button>
                                        </div>
                                    </div>
                                </form>

                            </div>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</section>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jsUtils.js"></script>
<script>

    $(function () {
        $("#s_user_sex").val("${person.user_student.student_sex}");
        $("#t_user_sex").val("${person.user_teacher.teacher_sex}");
    });

    function addFollow(uid) {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/user_addFollow.action',
            data:{'uid':uid},
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_personCenter.action?uid=${person.user_id}",{'code':data.code}));
            },
            error:function () {
                alert("操作失败！");
                window.location.reload();
            },
        });
    };

</script>
</body>
</html>
