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
<div align="center">
	<ul class="pagination">
		<!-- 上一页 -->
		<c:choose>
			<c:when test="${pageBean.curPage > 1}">
				<li ><a href="javascript:void(0);" class="page-prev" onclick="pageClick(${pageBean.curPage-1})">上一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="javascript:void(0);" >上一页</a></li>
			</c:otherwise>
		</c:choose>
		<c:forEach var="x" begin="1" end="${pageBean.pageNumber}" step="1">
			<c:choose>
				<c:when test="${pageBean.curPage == x }">
					<li class="active"><a href="javascript:void(0);" class="page-item">${x }</a></li>
				</c:when>
				<c:when test="${pageBean.curPage-x <= 3 }">
					<li><a href="javascript:void(0);" class="page-item" onclick="pageClick(${x})">${x }</a></li>
				</c:when>
				<c:when test="${x - pageBean.curPage <=3 }">
					<li ><a  href="javascript:void(0);"class="page-item" onclick="pageClick(${x})">${x }</a></li>
				</c:when>
			</c:choose>
		</c:forEach>
		
		<!-- 下一页 -->
		<c:choose>
			<c:when test="${pageBean.curPage < pageBean.pageNumber}">
				<li ><a href="javascript:void(0);" class=".page-next" onclick="pageClick(${pageBean.curPage+1})">下一页</a></li>
			</c:when>
			<c:otherwise>
				<li class="disabled"><a href="javascript:void(0);" >下一页</a></li>
			</c:otherwise>
		</c:choose>
	</ul>
</div>
