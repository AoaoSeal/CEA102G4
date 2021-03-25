<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.srep.model.*"%>

<%
SrepService srepSvc = new SrepService();
List<SrepVO> list = srepSvc.getAll();
pageContext.setAttribute("list", list);
%>


<html>
<head>
<meta charset="UTF-8">
<title>所有檢舉資料 - listAllSrep.jsp</title>

</head>
<body>
	<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
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
	<div></div>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">

	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">檢舉賣家</h2>
		</div>


		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<table class="table align-middle  table-hover">
			<thead>
				<tr>
					<th scope="col">檢舉賣家編號</th>
					<th>會員編號</th>
					<th>訂單編號</th>
					<th>檢舉日期</th>
					<th>檢舉事由</th>
					<th>檢舉圖片</th>
					<th>檢舉狀況</th>
					<th>修改</th>
				</tr>
			</thead>

			<%@ include file="page1.file"%>
			<c:forEach var="srepVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">

				<tr bgcolor=<c:if test="${grepVO.grep_status==1}">lightgray</c:if>>
					<td>${srepVO.srep_no}</td>
					<td>${srepVO.mem_id}</td>
					<td>${srepVO.or_no}</td>
					<td>${srepVO.srep_time}</td>
					<td>${srepVO.srep_text}</td>
					<td><img
						height="150" width="150" src="<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
				${pageContext.request.contextPath}/back-end/srep/img/noImage.jpg
				</c:if>
				<c:if test="${srepVO.srep_mediumblob!=null && !empty srepVO.srep_mediumblob}">
		data:image/png;base64,${srepVO.srep_mediumblob}</c:if>"></td>

					<c:set var="status" value="${srepVO.srep_status}" />
					<c:choose>
						<c:when test="${srepVO.srep_status==0}">
							<th>未處理</th>
						</c:when>
						<c:when test="${srepVO.srep_status==1}">
							<th>已處理</th>
						</c:when>
					</c:choose>

					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/srep/srep.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改"> <input type="hidden"
								name="srep_no" value="${srepVO.srep_no}"> <input
								type="hidden" name="requestURL"
								value="<%=request.getServletPath()%>"> <input
								type="hidden" name="whichPage" value="<%=whichPage%>"> <input
								type="hidden" name="action" value="getOne_For_Updatef">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</table>
		<%@ include file="page2.file"%>
</body>
</html>