<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 2019/4/9
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<nav class="navbar navbar-default container-fluid" role="navigation">
    <div class="navbar-header">
        <h4 class="logo navbar-text "><a href="#" title="校园资源共享平台">校园资源共享平台</a></h4>
    </div>

    <div>
        <c:choose>
            <c:when test="${not empty sessionScope.get('currentUser')}">
                <ul class="nav navbar-nav navbar-right">
                    <li title="个人中心"><a href="user/user_center.action"><span
                            class="glyphicon glyphicon-user"></span>${currentUser.user_id}</a>
                    </li>
                    <li title="退出"><a href="javascript:exit('user/user_exit.action')"><span class="glyphicon glyphicon-log-in"></span>退出</a></li>
                </ul>
            </c:when>
            <c:otherwise>
                <ul class="nav navbar-nav navbar-right">
                    <li title="注册"><a href="user_register.action"><span class="glyphicon glyphicon-user"></span> 注册</a>
                    </li>
                    <li title="登录"><a href="user_toLogin.action"><span class="glyphicon glyphicon-log-in"></span> 登录</a>
                    </li>
                </ul>
            </c:otherwise>
        </c:choose>
    </div>

    <div  style="text-align: center">
        <ul class="nav navbar-nav nav-pills" style="display: inline-block;float: none">
            <li id="1" title="首页"><a href="#">首页</a></li>
            <li id="2" title="资源"><a href="res_all.action">资源</a></li>
            <li id="3" title="论坛"><a href="post_all.action">论坛</a></li>
            <li id="4" title="个人中心"><a href="user/user_center.action">个人中心</a></li>
        </ul>
    </div>
</nav>
<script src="${pageContext.request.contextPath}/resources/jquery/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
        $(function () {
            switch ('<%=request.getParameter("active_id")%>') {
                case '0':
                    break;
                case '1':
                    $("#1").addClass('active');
                    break;
                case '2':
                    $('#2').addClass('active');
                    break;
                case '3':
                    $('#3').addClass('active');
                    break;
                case '4':
                    $('#4').addClass('active');
                    break;
                default:;
            };
        });

        function exit(url) {
            if (confirm("您确认要注销登录吗？")) {
                location.replace(url);
            }
        }
    </script>



