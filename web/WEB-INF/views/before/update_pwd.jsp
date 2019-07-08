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
                    <a class="list-group-item active" title="修改密码" href="user/user_toUpdatePwd.action">修改密码</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="我的资源" href="user/user_myRes.action">我的资源</a>
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
                <h3>修改密码</h3>
            </div>

            <div class="panel panel-default ">
                <div class="container">
                    <div style="margin: 20px">

                        <form id="form" class="col-md-9 form-horizontal" role="form" method="post">
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
                                <c:when test="${not empty differ}">
                                    <div class="alert alert-dismissable alert-danger">
                                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                        </button>
                                        <h4>
                                            提示!
                                        </h4> <strong>${differ}</strong>
                                    </div>
                                </c:when>
                            </c:choose>

                            <div class="form-group">
                                <label for="user_password_old" class="col-sm-2 control-label">旧密码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="user_password_old" id="user_password_old" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="user_password_new" class="col-sm-2 control-label">新密码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="user_password_new" id="user_password_new" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="user_password_confirm" class="col-sm-2 control-label">确认密码</label>
                                <div class="col-sm-4">
                                    <input type="text" class="form-control" name="user_password_confirm" id="user_password_confirm" required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button id="save_btn" type="button" class="btn btn-default">保存</button>
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
<script src="${pageContext.request.contextPath}/resources/js/jsUtils.js"></script>
<script type="text/javascript">

    $("#save_btn").click(function () {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/user_updatePwd.action',
            data:$("#form").serialize(),
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_toUpdatePwd.action",{'code':data.code}));
            },
            error:function () {
                alert("修改失败！");
                window.location.reload();
            },
        });
    });

</script>
</body>
</html>