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
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <jsp:include page="header.jsp" flush="true" >
        <jsp:param name="active_id" value="0"/>
    </jsp:include>
</header>
<section class="panel panel-default container">
    <div>
        <ul class="breadcrumb">
            <li class="active">
                其他操作
            </li>
            <li>
                查找用户
            </li>
        </ul>
    </div>
    <div class="row">
        <div class="col-md-1"></div>

        <div class="col-md-10">

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px">
                        <form id="form-search" class="navbar-form" action="user/user_findUser.action" method="POST" >
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="hidden" name="page" id="page"
                                   value="${empty pageBean.curPage ? 1 : pageBean.curPage }">
                            <input type="text" class="form-control" placeholder="请输入关键字" name="query.query_name" id="query_name"
                                   value="${query.query_name}">
                            <span>&nbsp</span>
                            <label class="form-inline">用户类别</label>
                            <select id="query_type" class="form-control " name="query.query_type">
                                <option value="">全部</option>
                                <option value="学生">学生</option>
                                <option value="教师">教师</option>
                            </select>
                            <span> &nbsp </span>
                            <a id="search_btn" class="btn btn-info">搜索</a>
                        </form>
                        <div class="panel panel-default">
                            <ul class="list-group">
                                <c:forEach var="find_user" items="${pageBean.list }">
                                    <a href="javascript:goGet('user/user_personCenter.action', {'uid':'${find_user.user_id}'})" title="${find_user.user_id}"
                                       class="list-group-item">
                                        <h4>${find_user.user_id}
                                            <c:choose>
                                                <c:when test="${find_user.user_level == '学生'}">
                                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                                    <c:choose>
                                                        <c:when test="${empty find_user.user_student.student_desc or find_user.user_student.student_desc == ''}">
                                                            <span style="margin-left: 30px;margin-right: 20px;font-size: small;text-align: center">这个人很懒！什么也没留下！</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="margin-left: 30px;margin-right: 20px;font-size: small;text-align: center">${find_user.user_student.student_desc}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:when test="${find_user.user_level == '教师'}">
                                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                                    <c:choose>
                                                        <c:when test="${empty find_user.user_teacher.teacher_desc or find_user.user_teacher.teacher_desc == ''}">
                                                            <span style="margin-left: 30px;margin-right: 20px;font-size: small;text-align: center">这个人很懒！什么也没留下！</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <span style="margin-left: 30px;margin-right: 20px;font-size: small;text-align: center">${find_user.user_teacher.teacher_desc}</span>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                            </c:choose>
                                        </h4>
                                    </a>
                                </c:forEach>
                            </ul>
                        </div>
                        <%@ include file="pagination.jsp" %>
                    </div>
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

    $("#search_btn").click(function () {
        $("#form-search").submit();
    });

    $(function () {
        $("#query_name").val("${query.query_name}");
        $("#query_type").val("${query.query_type}");
    });

    function pageClick(page) {
        // console.log(page);
        $("#page").val(page);
        $("#query_name").val('${query.query_name}');
        $("#query_type").val('${query.query_type}');
        $("#form-search").submit();
    };

</script>
</body>
</html>
