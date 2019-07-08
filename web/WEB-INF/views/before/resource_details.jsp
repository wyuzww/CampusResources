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

</head>


<body>
<header>
    <jsp:include page="header.jsp" flush="true" >
        <jsp:param name="active_id" value="2"/>
    </jsp:include>
</header>
<section class="container">
    <%--panel panel-default--%>
    <div class="row">

        <div class="col-md-1"></div>

        <div class="col-md-10">
            <div>
                <ul class="breadcrumb">
                    <li>
                        <a href="res_all.action">资源</a>
                    </li>
                    <li class="active">
                        ${resource.resource_name}
                    </li>
                </ul>
            </div>

            <div class="panel panel-default">
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
                    <c:when test="${not empty repeat}">
                        <div class="alert alert-dismissable alert-danger">
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                            </button>
                            <h4>
                                提示!
                            </h4> <strong>${repeat}</strong>
                        </div>
                    </c:when>
                </c:choose>

                <ul class="list-group">
                    <li style="display:block" class="list-group-item">
                        <h3>${resource.resource_name}
                            <c:choose>
                                <c:when test="${resource.resource_uploadUser.user_level=='学生'}">
                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                </c:otherwise>
                            </c:choose>
                            <c:choose>
                                <c:when test="${resource.resource_good == 1}">
                                    <span class="badge "style="background-color: pink;color: red">优质</span>
                                </c:when>
                            </c:choose>
                            <span><a style="margin-right: 10px" title="收藏资源" href="javascript:collect()"
                                     class="btn btn-danger btn-sm navbar-right">收藏资源</a></span>
                        </h3>

                    </li>
                    <li style="display:block" class="list-group-item">
                        <h4>${resource.resource_desc}</h4>

                        <c:forEach var="image" items="${images }">
                            <img style="width: 70%;height: auto" src="${image}">
                        </c:forEach>

                    </li>
                    <li style="display:block" class="list-group-item">

                        <div align="right">
                            <span><a class="btn btn-info btn-sm navbar-left"
                                     href="${resource.resource_url}">下载资源</a></span>
                            <span class="text">资源类别：${resource.resource_category.category_name}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="text">资源等级：${resource.resource_level}</span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="muted "><i class="glyphicon glyphicon-user"></i>${resource.resource_uploadUser.user_id}</span>
                            <span><a title="查看作者" href="javascript:goGet('user/user_personCenter.action', {'uid':'${resource.resource_uploadUser.user_id}'})" class="btn btn-success btn-sm">查看作者</a></span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="muted"><i class="glyphicon glyphicon-time "></i><fmt:formatDate
                                    value="${resource.resource_time}" pattern="yyyy-MM-dd"/></span>
                            <span>&nbsp &nbsp </span>
                        </div>
                    </li>
                </ul>
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
<script type="text/javascript">
    function collect() {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/res_addCollect.action',
            data:{'rid':${resource.resource_id}},
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/res_detail.action?rid=${resource.resource_id}",{'code':data.code}));
            },
            error:function () {
                alert("收藏失败！");
                window.location.reload();
            },
        });
    }

</script>
</body>
</html>
