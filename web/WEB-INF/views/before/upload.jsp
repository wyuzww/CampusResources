<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- 引入 Bootstrap -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap-datetimepicker.min.css"
          rel="stylesheet">
</head>


<body>
<header>
    <jsp:include page="header.jsp" flush="true" >
        <jsp:param name="active_id" value="2"/>
    </jsp:include>
</header>
<section class="panel panel-default container">
    <div class="row">

        <div class="col-md-3">
            <ul class="clearfix">
                <h3>资源中心</h3>
                <li style="display:block">
                    <a class="list-group-item " title="全部资源" href="res_all.action">全部资源</a>
                </li>
                <li style="display:block">
                    <a class="list-group-item active" title="上传资源" href="user/res_toUpload.action">上传资源</a>
                </li>
            </ul>
        </div>

        <div class="col-md-9">
            <div>
                <h3>上传资源</h3>
            </div>
            <div class="panel panel-default">
                <div class="container-fluid ">
                    <div style="margin: 20px">
                        <form class="form-horizontal" id="form" name="uploadForm" role="form" action="user/res_upload.action"  method="post"
                              enctype="multipart/form-data">
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

                            <div class="form-group">
                                <label for="resource_name" class="col-sm-2 control-label">资源名字</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="resource_name" id="resource_name"
                                           required/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resource_cid" class="col-sm-2 control-label">资源类别</label>
                                <div class="col-sm-4">
                                    <select id="resource_cid" class="form-control" name="resource_cid" required>
                                        <c:forEach var="category_i" items="${categories}">
                                            <option value="${category_i.category_id}">${category_i.category_name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resource_level" class="col-sm-2 control-label">资源等级</label>
                                <div class="col-sm-4">
                                    <select id="resource_level" class="form-control" name="resource_level" required>
                                        <option value="初级">初级</option>
                                        <option value="中级">中级</option>
                                        <option value="高级">高级</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="resource_desc" class="col-sm-2 control-label">资源描述</label>
                                <div class="col-sm-8">
                                    <textarea class="form-control" name="resource_desc" id="resource_desc" rows="10"
                                              required style="resize: none"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resource_images" class="col-sm-2 control-label">图片展示</label>
                                <div class="col-sm-8">
                                    <input accept="image/*" type="file" multiple id="resource_images"
                                           name="res_imageFiles">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="resource" class="col-sm-2 control-label">选择资源</label>
                                <div class="col-sm-8">
                                    <input type="file" id="resource" name="res_File" required>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-offset-2 col-sm-10">
                                    <button type="submit" id="save_btn" class="btn btn-info">上传</button>
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

    // $("#save_btn").click(function () {
    //     $.ajax({
    //         async:true,
    //         type:'POST',
    //         url:'user/res_upload.action',
    //         data:$("#form").serialize(),
    //         dataType:'json',
    //         success:function (data) {
    //             window.location.href(goPost("user/res_toUpload.action",{'code':data.code}));
    //         },
    //         error:function () {
    //             alert("操作失败！");
    //             window.location.reload();
    //         },
    //     })
    // });


</script>

</body>
</html>
