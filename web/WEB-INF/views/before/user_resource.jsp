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
                    <a class="list-group-item active" title="我的资源" href="user/user_myRes.action">我的资源</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="我的帖子" href="user/user_myPost.action">我的帖子</a>
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
                <h3>我的资源</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container-fluid">
                    <div style="margin: 20px">
                        <form class=" form-inline" action="user/user_myRes.action" method="POST" id="form-search">
                            <span>&nbsp &nbsp &nbsp &nbsp </span>
                            <input type="hidden" name="page" id="page"
                                   value="${empty pageBean.curPage ? 1 : pageBean.curPage }">
                            <input type="text" class="form-control" placeholder="关键词" name="query.query_name"
                                   id="query_name" value="${query.query_name}">
                            <span>&nbsp </span>
                            <label class="form-inline">资源类别</label>
                            <select id="query_cate" class="form-control" name="query.query_cate">
                                <option value="-1">全部</option>
                                <c:forEach var="category_i" items="${categories}">
                                    <option value="${category_i.category_id}">${category_i.category_name}</option>
                                </c:forEach>
                            </select>
                            <span>&nbsp </span>
                            <label class="form-inline">资源等级</label>
                            <select id="resource_level" class="form-control " name="resource_level">
                                <option value="">全部</option>
                                <option value="初级">初级</option>
                                <option value="中级">中级</option>
                                <option value="高级">高级</option>
                            </select>
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
                                <c:forEach var="all_resource" items="${pageBean.list }">
                                    <a href="javascript:goGet('user/res_detail.action', {'rid':'${all_resource.resource_id}'})" title="${all_resource.resource_name}" class="list-group-item">
                                        <h4 class="list-group-item-heading">${all_resource.resource_name}
                                            <c:choose>
                                                <c:when test="${all_resource.resource_uploadUser.user_level == '学生'}">
                                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                                </c:otherwise>
                                            </c:choose>
                                            <c:choose>
                                                <c:when test="${all_resource.resource_good == 1}">
                                                    <span class="badge "style="background-color: pink;color: red">优质</span>
                                                </c:when>
                                            </c:choose>
                                            <div class="navbar-right" style="margin-right: 10px">
                                                    <button title="删除资源" class="btn btn-danger btn-sm" onclick="delRes(${all_resource.resource_id});return false;" >删除资源
                                                </button>
                                            </div>
                                        </h4>

                                        <h6 style="overflow: hidden;text-overflow: ellipsis;"
                                            class="text">${all_resource.resource_desc}</h6>
                                        <span class="muted"><i
                                                class="glyphicon glyphicon-user"></i>${all_resource.resource_uploadUser.user_id}</span>
                                        <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                                        <span class="text">资源类别：${all_resource.resource_category.category_name}</span>
                                        <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                                        <span class="text">资源等级：${all_resource.resource_level}</span>
                                        <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                                        <span class="muted"><i class="glyphicon glyphicon-time"></i><fmt:formatDate
                                                value="${all_resource.resource_time}" pattern="yyyy-MM-dd"/></span>
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
        $("#query_cate").val("${query.query_cate}");
        $("#query_name").val("${query.query_name}");
        $("#resource_level").val("${resource_level}");
    });
    function pageClick(page) {
        // console.log(page);

        $("#page").val(page);
        $("#query_cate").val('${query.query_cate}');
        $("#query_name").val('${query.query_name}');
        $("#resource_level").val("${resource_level}");
        $("#form-search").submit();
    };

    function delRes(rid) {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/res_delResByUser.action',
            data:{'rid':rid},
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_myRes.action",{'code':data.code}));
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
