<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.grep.model.*"%>
<%@ page import="com.member.model.*"%>

<%
GrepService grepSvc = new GrepService();
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
List<GrepVO> list = grepSvc.getAll1(memberVO.getMemId());
pageContext.setAttribute("list", list);
%>
<html>
<body bgcolor="#D2B48C">

	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
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

	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">所有商品檢舉</h2>
		</div>
		
		<table class="table table-hover">

			<%@ include file="page1.file"%>
			<thead class="thead-dark">
				<tr>
					<th scope="col">檢舉商品編號</th>
					<th scope="col">會員編號</th>
					<th scope="col">商品編號</th>
					<th scope="col">檢舉日期</th>
					<th scope="col">檢舉事由</th>
					<th scope="col">檢舉狀況</th>
					<th scope="col">修改</th>
				</tr>
				<c:forEach var="grepVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">

					<tbody>
						<tr bgcolor=<c:if test="${grepVO.grep_status==1}">lightgray</c:if>>
						<tr>
							<td>${grepVO.grep_no}</td>
							<td>${grepVO.mem_id}</td>
							<td>${grepVO.gd_no}</td>
							<td>${grepVO.grep_time}</td>
							<td>${grepVO.grep_text}</td>

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
									ACTION="<%=request.getContextPath()%>/front-end/grep/grep.do"
									style="margin-bottom: 0px;">
									<input type="submit" value="修改"> <input type="hidden"
										name="grep_no" value="${grepVO.grep_no}"> <input
										type="hidden" name="requestURL"
										value="<%=request.getServletPath()%>"> <input
										type="hidden" name="whichPage" value="<%=whichPage%>">
									<input type="hidden" name="action" value="getOne_For_Update1">
								</FORM>
							</td>
						</tr>
				</c:forEach>
			</thead>
			</tbody>
		</table>
		<%@ include file="page2.file"%>
	</section>
</body>
</html>