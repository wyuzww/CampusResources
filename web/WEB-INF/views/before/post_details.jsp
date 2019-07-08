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
        <jsp:param name="active_id" value="3"/>
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
                        <a href="post_all.action">论坛</a>
                    </li>
                    <li class="active">
                        ${post.post_title}
                    </li>
                </ul>
            </div>

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
                    <li style="display:block" class="list-group-item">
                        <h3>${post.post_title}
                            <c:choose>
                                <c:when test="${post.post_user.user_level=='学生'}">
                                    <span class="badge " style="background-color: #c7ddef;color: blue">学生</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge " style="background-color: gray;color: yellow">教师</span>
                                </c:otherwise>
                            </c:choose>
                        </h3>
                    </li>
                    <li style="display:block" class="list-group-item">
                        <h4>${post.post_text}</h4>
                        <c:forEach var="image" items="${images }">
                            <img style="width: 70%;height: auto" src="${image}">
                            <%--<img src="${pageContext.request.contextPath}/upload/images/IMG.jpg">--%>
                        </c:forEach>

                    </li>
                    <li style="display:block" class="list-group-item">
                        <div align="right">
                            <span class="muted "><i class="glyphicon glyphicon-user"></i>${post.post_user.user_id}</span>
                            <span><a title="查看作者" href="javascript:goGet('user/user_personCenter.action', {'uid':'${post.post_user.user_id}'})" class="btn btn-success btn-sm">查看作者</a></span>
                            <span>&nbsp &nbsp &nbsp &nbsp &nbsp </span>
                            <span class="muted"><i class="glyphicon glyphicon-time "></i><fmt:formatDate
                                    value="${post.post_time}" pattern="yyyy-MM-dd"/></span>
                            <span>&nbsp &nbsp </span>
                        </div>
                    </li>
                </ul>
            </div>
            <div>
                <ul class="container-fluid">

                    <form id="form" class=" form-horizontal " role="form" method="post">
                        <input type="text" name="pid" hidden value="${post.post_id}"/>
                        <div align="center" class="form-group">
                            <div>
                                <textarea required class="form-control" name="comment_text" id="comment_text" rows="3"
                                          style="resize: none;font-size: 20px" placeholder="在此处留下你的评论"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div>
                                <button  type="button" style="margin-right: 10px" class="btn btn-info navbar-right"
                                        id="save_btn">提交评论
                                </button>
                            </div>
                        </div>
                    </form>
                </ul>
            </div>
            <div class="widget widget_hot">
                <h3>全部评论</h3>
                <ul>
                    <c:forEach var="comment" items="${pageBean.list }" varStatus="status">
                        <li style="display:block" class="row">
                            <h4 class="col-md-1">
                                第${pageBean.items+1-(pageBean.curPage-1)*(pageBean.pageSize)-status.count}楼</h4>
                            <a class="list-group-item col-md-11" title="${comment.comment_text}">
                                <h5 class="list-group-item-heading">${comment.comment_text}</h5>
                                <span><p></p></span>
                                <span class="muted"><i
                                        class="glyphicon glyphicon-user"></i>${comment.comment_user.user_id}</span>
                                <span>&nbsp &nbsp</span>
                                <span class="muted"><i
                                        class="glyphicon glyphicon-time"></i><fmt:formatDate
                                        value="${comment.comment_time}"
                                        pattern="yyyy-MM-dd"/></span>
                            </a>
                        </li>
                    </c:forEach>
                </ul>
                <%@ include file="pagination.jsp" %>
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
    $("#save_btn").click(function () {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/comment_add.action',
            data:$("#form").serialize(),
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/post_detail.action?pid=${post.post_id}",{'code':data.code}));
            },
            error:function () {
                alert("评论失败！");
                window.location.reload();
            },
        });
    });


    function pageClick(page) {
        // console.log(page);
        var myForm = document.createElement("form");
        myForm.method = "POST";
        myForm.action = "user/post_detail.action?pid=${post.post_id}";
        p = {'page':page};
        for (var i in p){
            var myInput = document.createElement("input");
            myInput.setAttribute("name", i); // 为input对象设置name
            myInput.setAttribute("value", p[i]); // 为input对象设置value
            myForm.appendChild(myInput);
        }
        document.body.appendChild(myForm);
        myForm.submit();
        document.body.removeChild(myForm); // 提交后移除创建的form
    }
</script>
</body>
</html>
