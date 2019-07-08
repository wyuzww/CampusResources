<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2019/4/9
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%

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
        <jsp:param name="active_id" value="3"/>
    </jsp:include>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-3">
            <ul class="clearfix">
                <h3>论坛中心</h3>
                <li style="display:block">
                    <a class="list-group-item active" title="全部帖子" href="post_all.action">全部帖子</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="我要发帖" href="user/post_toPost.action">我要发帖</a>
                </li>
            </ul>
        </div>

        <div class="col-md-9">

            <div>
                <h3>全部帖子</h3>
            </div>

            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px">

                        <form class=" form-inline" action="post_all.action" method="POST" id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="hidden" name="page" id="page"
                                   value="${empty pageBean.curPage ? 1 : pageBean.curPage }">
                            <input type="text" class="form-control" placeholder="关键词" name="query.query_name" id="query_name"
                                   value="${query.query_name}">
                            <span>&nbsp &nbsp </span>
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
                                <c:forEach  items="${pageBean.list }" var="all_post">

                                    <a href="javascript:goGet('user/post_detail.action', {'pid':'${all_post.post_id}'})" class="list-group-item">
                                        <h4 style="color: blue" class="list-group-item-heading">${all_post.post_title }
                                            <c:choose>
                                                <c:when test="${all_post.post_user.user_level == '学生'}">
                                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </h4>
                                        <h6 class="text">${all_post.post_text }</h6>
                                        <span class="muted"><i
                                                class="glyphicon glyphicon-user"></i>${all_post.post_user.user_id }</span>
                                        <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                                        <span class="muted"><i class="glyphicon glyphicon-time"></i><fmt:formatDate
                                                value="${all_post.post_time}" pattern="yyyy-MM-dd"/></span>
                                    </a>
                                </c:forEach>
                            </ul>
                        </div>
                        <%@ include file="pagination.jsp" %>
                    </div>
                </div>
                <%--<%@ include file="pageBean.jsp" %>--%>
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
    }

</script>
</body>
</html>
