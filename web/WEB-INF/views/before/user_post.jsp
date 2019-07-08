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
        <jsp:param name="active_id" value="4"/>
    </jsp:include>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-2">
            <ul class="clearfix">
                <h3>个人中心</h3>
                <li style="display:block">
                    <a class="list-group-item " title="我的信息" href="user/user_center.action">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item " title="修改密码" href="user/user_toUpdatePwd.action">修改密码</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item " title="我的资源" href="user/user_myRes.action">我的资源</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="我的帖子" href="user/user_myPost.action">我的帖子</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="我的关注" href="user/user_myFollow.action">我的关注</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="我的收藏" href="user/user_myCollect.action">我的收藏</a>
                </li>
            </ul>
        </div>

        <div class="col-md-10">

            <div>
                <h3>我的帖子</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px">
                        <form class=" form-inline" action="user/user_myPost.action" method="POST" id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <input type="hidden" name="page" id="page"
                                   value="${empty pageBean.curPage ? 1 : pageBean.curPage }">
                            <input type="text" class="form-control" placeholder="关键词" name="query.query_name" id="query_name"
                                   value="${query.query_name}">
                            <span> &nbsp </span>
                            <a id="search_btn" class="btn btn-info">搜索</a>
                        </form>

                        <c:choose>
                            <c:when test="${not empty success}">
                                <div class="alert alert-dismissable alert-success">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                    <h4>
                                        提示!
                                    </h4> <strong>${success}</strong>
                                </div>
                            </c:when>
                            <c:when test="${not empty failed}">
                                <div class="alert alert-dismissable alert-danger">
                                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                    </button>
                                    <h4>
                                        提示!
                                    </h4> <strong>${failed}</strong>
                                </div>
                            </c:when>
                        </c:choose>

                        <div class="panel panel-default">
                            <ul class="list-group">
                                <c:forEach var="all_post" items="${pageBean.list  }">
                                    <a href="javascript:goGet('user/post_detail.action', {'pid':'${all_post.post_id}'})" class="list-group-item">
                                        <h4 class="list-group-item-heading">${all_post.post_title}
                                            <c:choose>
                                                <c:when test="${all_post.post_user.user_level == '学生'}">
                                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <div class="navbar-right" style="margin-right: 10px">
                                                <button title="删除帖子" class="btn btn-danger btn-sm"
                                                        onclick="delPost(${all_post.post_id});return false;">
                                                    删除帖子
                                                </button>
                                            </div>
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
    });

    function pageClick(page) {
        // console.log(page);

        $("#page").val(page);
        $("#query_name").val('${query.query_name}');
        $("#form-search").submit();
    };
    function delPost(pid) {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/post_delPostByUser.action',
            data:{'pid':pid},
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_myPost.action",{'code':data.code}));
            },
            error:function () {
                alert("删除失败！");
                window.location.reload();
            },
        });
    };

</script>
</body>
</html>
