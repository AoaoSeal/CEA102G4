<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.grep.model.*"%>

<%
GrepService grepSvc = new GrepService();
List<GrepVO> list = grepSvc.getAll();
pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="UTF-8">
<title>所有檢舉資料 - listAllGrep.jsp</title>

</head>
<body>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<table class="table table-hover">

		<%@ include file="page1.file"%>
		<thead class="thead-dark">
			<tr>
				<th><h5>檢舉商品編號</th>
				<th><h5>會員編號</th>
				<th><h5>商品編號</th>
				<th><h5>檢舉日期</th>
				<th><h5>檢舉事由</th>
				<th><h5>檢舉狀況</th>
				<th><h5>修改</th>
			</tr>
			<c:forEach var="grepVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">
				
				<tbody>
				<tr bgcolor=<c:if test="${grepVO.grep_status==1}">lightgray</c:if>>
				<tr>
					<th scope="col">${grepVO.grep_no}</th>
					<th scope="col">${grepVO.mem_id}</th>
					<th scope="col">${grepVO.gd_no}</th>
					<th scope="col">${grepVO.grep_time}</th>
					<th scope="col">${grepVO.grep_text}</th>
					<c:set var="status" value="${grepVO.grep_status}" />
					<c:choose>
						<c:when test="${grepVO.grep_status==0}">
							<th>未處理</th>
						</c:when>
						<c:when test="${grepVO.grep_status==1}">
							<th>已處理</th>
						</c:when>
					</c:choose>

					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/back-end/grep/grep.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改"> <input type="hidden"
								name="grep_no" value="${grepVO.grep_no}"> <input
								type="hidden" name="requestURL"
								value="<%=request.getServletPath()%>"> <input
								type="hidden" name="whichPage" value="<%=whichPage%>"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</thead>
		<tbody>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>