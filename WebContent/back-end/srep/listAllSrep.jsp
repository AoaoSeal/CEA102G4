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
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">
	<!-- 	<a -->
	<%-- 		href="${pageContext.request.contextPath}/back-end/grep/select_page.jsp">回到商品檢舉頁</a> --%>


	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<%@ include file="page1.file"%>
	<table class="table align-middle  table-hover">
		<thead>
			<tr>
				<th scope="col">檢舉賣家編號</th>
				<th scope="col">會員編號</th>
				<th scope="col">訂單編號</th>
				<th scope="col">檢舉日期</th>
				<th scope="col">檢舉事由</th>
				<th scope="col">檢舉圖片</th>
				<th scope="col">檢舉狀況</th>
				<th scope="col">修改</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="srepVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">

				<tr bgcolor=<c:if test="${grepVO.grep_status==1}">lightgray</c:if>>
					<td>${srepVO.srep_no}</td>
					<td>${srepVO.mem_id}</td>
					<td>${srepVO.or_no}</td>
					<td>${srepVO.srep_time}</td>
					<td>${srepVO.srep_text}</td>
					<td><img width="100" height="100"
						src="<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
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
						<!-- 				<button type="button" class="btn btn-danger btn-sm px-3"> -->
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/back-end/srep/srep.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改"> <input type="hidden"
								name="srep_no" value="${srepVO.srep_no}"> <input
								type="hidden" name="requestURL"
								value="<%=request.getServletPath()%>"> <input
								type="hidden" name="whichPage" value="<%=whichPage%>"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<%@ include file="page2.file"%>
</body>
</html>