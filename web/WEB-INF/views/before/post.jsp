<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
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
                    <a class="list-group-item " title="全部帖子" href="post_all.action">全部帖子</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="我要发帖" href="user/post_toPost.action">我要发帖</a>
                </li>
            </ul>
        </div>

        <div class="col-md-9">

            <div>
                <h3>我要发帖</h3>
            </div>

            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px">
                        <form class="form-horizontal" name="uploadForm" role="form" action="user/post_post.action" method="post" enctype="multipart/form-data">
                            <c:choose>
                                <c:when test="${not empty success}">
                                    <div class="alert alert-dismissable alert-success">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4>
                                            提示!
                                        </h4> <strong>${success}</strong>
                                    </div>
                                </c:when>
                                <c:when test="${not empty failed}">
                                    <div class="alert alert-dismissable alert-danger">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                        <h4>
                                            提示!
                                        </h4> <strong>${failed}</strong>
                                    </div>
                                </c:when>
                            </c:choose>
                            <div class="form-group">
                                <label for="post_title" class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="post_title" id="post_title" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="post_text" class="col-sm-2 control-label">正文</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="post_text" id="post_text" rows="10" required style="resize: none"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="post_images" class="col-sm-2 control-label">选择图片</label>
                                <div class="col-sm-8">
                                    <input accept="image/*"  type="file" multiple id="post_images" name="post_imageFiles"  >
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" class="btn btn-info">提交</button>
                                    <button type="reset" class="btn btn-danger">重置</button>
                                </div>
                            </div>
                        </form>

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


</body>
</html>
