<%@ page import="com.opensymphony.xwork2.ActionContext" %>
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
<head id="main">
    <title>校园资源共享平台</title>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
</head>


<body >
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
                    <a class="list-group-item active" title="我的信息" href="user/user_center.action">我的信息</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item" title="修改密码" href="user/user_toUpdatePwd.action">修改密码</a>
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
                <c:choose>
                    <c:when test="${user.user_level == '学生'}">
                        <h3>我的信息<span class="badge " style="background-color: #c7ddef;color: blue">学生</span></h3>
                    </c:when>
                    <c:when test="${user.user_level == '教师'}">
                        <h3>我的信息<span class="badge " style="background-color: gray;color: yellow">教师</span></h3>
                    </c:when>
                </c:choose>
            </div>

            <div class="panel panel-default ">
                <div class="container">
                    <c:choose>
                        <c:when test="${user.user_level == '学生'}">
                        <div style="margin: 20px">
                            <form id="form1" class="col-md-9 form-horizontal" role="form" method="post">
                                <c:choose>
                                    <c:when test="${not empty success}">
                                        <div id="s_success" class="alert alert-dismissable alert-success">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <h4>提示!</h4> <strong>${success}</strong>
                                        </div>
                                    </c:when>
                                    <c:when test="${not empty failed}">
                                        <div id="s_failed" class="alert alert-dismissable alert-danger">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                        </button>
                                            <h4>
                                        提示!
                                        </h4> <strong>${failed}</strong>
                                        </div>
                                    </c:when>
                                </c:choose>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">帐号</label>
                                    <div class="col-sm-4">
                                        <input type="text" readonly class="form-control" name="user_id" id="s_user_id" value="${user.user_id}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="user_student.student_name" id="s_user_name" readonly value="${user.user_student.student_name}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-4">
                                        <select  class="form-control" name="user_student.student_sex" id="s_user_sex" disabled  >
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group" id="user_class_div">
                                    <label class="col-sm-2 control-label">班级</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="user_student.student_class" id="s_user_class" readonly value="${user.user_student.student_class}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">生日</label>
                                    <div class="col-sm-4">
                                        <input  class="form-control" name="user_student.student_birth" id="s_user_birth" readonly disabled value="<fmt:formatDate value="${user.user_student.student_birth}" pattern="yyyy-MM-dd"/>"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">个人说明</label>
                                    <div class="col-sm-4">
                                        <textarea class="form-control" name="user_student.student_desc" id="s_user_desc" rows="4" readonly style="resize: none">${user.user_student.student_desc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" class="btn btn-default" id="s_update_btn">编辑</button>
                                        <button type="button" class="btn btn-default" id="s_save_btn">保存</button>
                                        <button type="button" class="btn btn-default" id="s_cancel_btn">取消</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:when>
                        <c:when test="${user.user_level == '教师'}">
                        <div style="margin: 20px">
                            <form id="form2" class="col-md-9 form-horizontal" role="form" method="post">
                                <c:choose>
                                    <c:when test="${not empty success}">
                                        <div id="s_success" class="alert alert-dismissable alert-success">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            <h4>提示!</h4> <strong>${success}</strong>
                                        </div>
                                    </c:when>
                                    <c:when test="${not empty failed}">
                                        <div id="s_failed" class="alert alert-dismissable alert-danger">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×
                                            </button>
                                            <h4>
                                                提示!
                                            </h4> <strong>${failed}</strong>
                                        </div>
                                    </c:when>
                                </c:choose>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">帐号</label>
                                    <div class="col-sm-4">
                                        <input type="text" readonly class="form-control" name="user_id" id="t_user_id" value="${user.user_id}"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">姓名</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="user_teacher.teacher_name" id="t_user_name" readonly value="${user.user_teacher.teacher_name}"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">性别</label>
                                    <div class="col-sm-4">
                                        <select  class="form-control" name="user_teacher.teacher_sex" id="t_user_sex" disabled  >
                                            <option value="男">男</option>
                                            <option value="女">女</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">生日</label>
                                    <div class="col-sm-4">
                                        <input  class="form-control" name="user_teacher.teacher_birth" id="t_user_birth" readonly disabled value="<fmt:formatDate value="${user.user_teacher.teacher_birth}" pattern="yyyy-MM-dd"/>"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">个人说明</label>
                                    <div class="col-sm-4">
                                        <textarea class="form-control" name="user_teacher.teacher_desc" id="t_user_desc" rows="4" readonly style="resize: none">${user.user_teacher.teacher_desc}</textarea>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="button" class="btn btn-default" id="t_update_btn">编辑</button>
                                        <button type="button" class="btn btn-default" id="t_save_btn">保存</button>
                                        <button type="button" class="btn btn-default" id="t_cancel_btn">取消</button>
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
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jsUtils.js"></script>
<script type="text/javascript">
    $(function () {
        $("#s_save_btn").hide();
        $("#s_update_btn").show();
        $("#s_cancel_btn").hide();
        $("#s_user_sex").val("${user.user_student.student_sex}");
        $("#t_save_btn").hide();
        $("#t_update_btn").show();
        $("#t_cancel_btn").hide();
        $("#t_user_sex").val("${user.user_teacher.teacher_sex}");
    });

    $("#s_update_btn").click(function () {
        $("#s_save_btn").show();
        $("#s_update_btn").hide();
        $("#s_cancel_btn").show();
        $("#s_user_name").attr("readonly",false);
        $("#s_user_sex").attr("disabled",false);
        $("#s_user_birth").attr("disabled",false);
        $("#s_user_class").attr("readonly",false);
        $("#s_user_desc").attr("readonly",false);
    });
    $("#t_update_btn").click(function () {
        $("#t_save_btn").show();
        $("#t_update_btn").hide();
        $("#t_cancel_btn").show();
        $("#t_user_name").attr("readonly",false);
        $("#t_user_sex").attr("disabled",false);
        $("#t_user_birth").attr("disabled",false);
        $("#t_user_desc").attr("readonly",false);
    });

    $("#s_cancel_btn").click(function () {
        window.location.reload();
    });
    $("#t_cancel_btn").click(function () {
        window.location.reload();
    });

    $("#s_user_birth").datetimepicker({
        pickDate:true,
        minView:"month",
        language:"zh-CN",
        format:"yyyy-mm-dd",

    });
    $("#t_user_birth").datetimepicker({
        pickDate:true,
        minView:"month",
        language:"zh-CN",
        format:"yyyy-mm-dd",

    });

    $("#s_save_btn").click(function () {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/user_updateInfo.action',
            data:$("#form1").serialize(),
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_center.action",{'code':data.code}));
            },
            error:function () {
                alert("修改失败！");
                window.location.reload();
            },
        });
    });
    $("#t_save_btn").click(function () {
        $.ajax({
            async:true,
            type:'POST',
            url:'user/user_updateInfo.action',
            data:$("#form2").serialize(),
            dataType:'json',
            success:function (data) {
                window.location.href(goPost("user/user_center.action",{'code':data.code}));
            },
            error:function () {
                alert("修改失败！");
                window.location.reload();
            },
        })
    });



</script>
</body>
</html>
