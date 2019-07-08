<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2019/4/9
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<html>
<head>
    <title>校园资源共享平台</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0 , maximum-scale=1.0 , user-scalable=no">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
</head>


<body >

<header>
    <jsp:include page="header.jsp" flush="true" >
        <jsp:param name="active_id" value="1"/>
    </jsp:include>
</header>
<section class="panel panel-default container">
    <%--<s:debug></s:debug>--%>

    <div class="row" style="margin: 5px">

        <div class="col-md-8">

            <div class="panel panel-default">

                <div class="panel-heading">
                    <h2><a href="res_all.action" class="panel-info">推荐资源<span class="label"><i class="glyphicon glyphicon-thumbs-up" style="color: red"></i></span></a></h2>
                </div>

                <ul class="list-group">
                    <c:forEach var="heat_resource" items="${ resourceList }">

                        <a href="javascript:goGet('user/res_detail.action', {'rid':'${heat_resource.resource_id}'})"  title="${heat_resource.resource_name}" class="list-group-item">
                            <h4 style="color: blue" class="list-group-item-heading">${heat_resource.resource_name}
                                <c:choose>
                                    <c:when test="${heat_resource.resource_uploadUser.user_level == '学生'}">
                                        <%--<sup style="border-radius: 5px;font-size: 1px;background-color: #c7ddef;color: blue">学生</sup>--%>
                                        <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                    </c:when>
                                    <c:otherwise>
                                        <%--<sup style="border-radius: 5px;font-size: 1px;background-color: gray;color: yellow">教师</sup>--%>
                                        <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                    </c:otherwise>
                                </c:choose>
                                <c:choose>
                                    <c:when test="${heat_resource.resource_good == 1}">
                                        <%--<sup style="border-radius: 5px;font-size: 1px;background-color: pink;color: red">优质</sup>--%>
                                        <span class="badge "style="background-color: pink;color: red">优质</span>
                                    </c:when>
                                </c:choose>
                            </h4>
                            <h6 class="text"
                                style="overflow: hidden;text-overflow: ellipsis">${heat_resource.resource_desc}</h6>
                            <span class="muted"><i class="glyphicon glyphicon-user"></i>${heat_resource.resource_uploadUser.user_id}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="text">资源类别：${heat_resource.resource_category.category_name}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="text">资源等级：${heat_resource.resource_level}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="muted"><i class="glyphicon glyphicon-time"></i><fmt:formatDate
                                    value="${heat_resource.resource_time}" pattern="yyyy-MM-dd"/></span>
                        </a>
                    </c:forEach>
                    <a href="res_all.action" class="see-more list-group-item " style="color: blue">查看更多...</a>
                </ul>
            </div>

            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2><a href="post_all.action" class="panel-info">热门帖子<span class="label"><i class="glyphicon glyphicon-fire" style="color: red"></i></span></a></h2>
                </div>
                <ul class="list-group">
                    <c:forEach var="heat_post" items="${postList }">
                        <a href="javascript:goGet('user/post_detail.action', {'pid':'${heat_post.post_id}'})" title="${heat_post.post_title}"
                           class="list-group-item">
                            <h4 style="color: blue" class="list-group-item-heading">${heat_post.post_title}
                                <c:choose>
                                    <c:when test="${heat_post.post_user.user_level == '学生'}">
                                        <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                    </c:when>
                                    <c:otherwise>
                                        <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                    </c:otherwise>
                                </c:choose>
                            </h4>
                            <h6 class="text" style="overflow: hidden;text-overflow: ellipsis">${heat_post.post_text}</h6>
                            <span class="muted"><i
                                    class="glyphicon glyphicon-user"></i>${heat_post.post_user.user_id}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="muted"><i class="glyphicon glyphicon-time"></i><fmt:formatDate
                                    value="${heat_post.post_time}" pattern="yyyy-MM-dd"/></span>
                        </a>
                    </c:forEach>
                    <a href="post_all.action" class="see-more list-group-item" style="color: blue">查看更多...</a>
                </ul>
            </div>

        </div>


        <aside class="sidebar col-md-4">
            <div class="fixed">
                <div class="widget widget_search">
                    <form class="navbar-form" action="user/user_findUser.action" method="POST">
                        <div class="input-group">
                            <input type="hidden" name="page" id="page"
                                   value="${empty pageBean.curPage ? 1 : pageBean.curPage }">
                            <input type="text" name="query.query_name" class="form-control" size="35" placeholder="请输入关键字"
                                   maxlength="15" required
                                   autocomplete="off">
                            <span class="input-group-btn">
									<button class="btn btn-info btn-search" id="search" type="submit">搜索</button>
								</span>
                        </div>
                    </form>
                </div>
            </div>

            <div class="widget widget_hot">
                <h3>最新评论<span class="label"><i class="glyphicon glyphicon-pencil" style="color: palevioletred"></i></span></h3>
                <ul>
                    <c:forEach var="new_comment" items="${commentList }">
                        <li style="display:block" >
                            <a class="list-group-item " style="color: black;background: #EFF5FF" title="${new_comment.comment_post.post_title}" href="javascript:goGet('user/post_detail.action', {'pid':'${new_comment.comment_post.post_id}'})">
                                <h5 class="list-group-item-heading" style="color: blue">${new_comment.comment_post.post_title}</h5>
                                <span class="text" style="overflow: hidden;text-overflow: ellipsis">${new_comment.comment_text}</span>
                                <span><p></p></span>
                                    <%--<span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>--%>
                                <span class="muted"><i
                                        class="glyphicon glyphicon-user"></i>${new_comment.comment_user.user_id}</span>
                                <span>&nbsp &nbsp</span>
                                <span class="muted"><i
                                        class="glyphicon glyphicon-time"></i><fmt:formatDate value="${new_comment.comment_time}"
                                                                                             pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                    <a href="post_all.action" class="see-more list-group-item" style="color: blue">查看更多...</a>
                </ul>
            </div>
        </aside>
    </div>
</section>


<!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery) -->
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<!-- 包括所有已编译的插件 -->
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jsUtils.js"></script>
</body>
</html>
