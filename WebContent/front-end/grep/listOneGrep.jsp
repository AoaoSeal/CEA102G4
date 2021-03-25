<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.srep.model.*"%>

<%
SrepVO srepVO = (SrepVO) request.getAttribute("srepVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<body>
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
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">所有商品</h2>
		</div>
		<!-- <h4>此頁暫練習採用 Script 的寫法取值:</h4> -->

		<table>
			<tr>
				<th>檢舉編號</th>
				<th>會員編號</th>
				<th>訂單編號</th>
				<th>檢舉日期</th>
				<th>檢舉事由</th>
				<th>檢舉狀況</th>
			</tr>
			<jsp:useBean id="orSvc" scope="page" class="com.or.model.OrService" />
			<tr>
				<td><%=srepVO.getSrep_no()%></td>
				<td><%=srepVO.getMem_id()%></td>
				<td><c:forEach var="orVO" items="${orSvc.all}">
						<c:if test="${srepVO.or_no==orVO.or_no}">
	                    ${orVO.or_name}
                    </c:if>
					</c:forEach></td>
				<td><%=srepVO.getSrep_time()%></td>
				<td><%=srepVO.getSrep_text()%></td>
				<%-- 		<td><img src= "data:image/png;base64,<%=srepVO.getSrep_mediumblob()%>"></td> --%>
				<td><img width="150" height="150"
					src="<c:if test="${srepVO.gd_mediumblob==null || empty srepVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/srep/img/noImage.jpg
				</c:if>
				<c:if test="${srepVO.gd_mediumblob!=null && !empty srepVO.gd_mediumblob}">
		data:image/png;base64,${srepVO.gd_mediumblob}</c:if>"></td>
				<td><c:if test="${srepVO.gd_status ==0}">全新</c:if>
					<c:if test="${srepVO.gd_status ==1}">二手</c:if></td>
				<td text-align:center><c:if test="${srepVO.gd_shelf ==1}">上架</c:if>
					<c:if test="${srepVO.gd_shelf ==0}">下架</c:if></td>

			</tr>
		</table>
</body>
</html>