<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>
<%
    GoodsService goodsSvc = new GoodsService();
    List<GoodsVO> list = goodsSvc.getAll();
    pageContext.setAttribute("list",list);
%>	

<%-- 萬用複合查詢-可由客戶端select_page.jsp隨意增減任何想查詢的欄位 --%>
<%-- 此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能--%>

<jsp:useBean id="listGoods_ByCompositeQuery" scope="request" type="java.util.List<GoodsVO>" />
<jsp:useBean id="gcSvc" scope="page" class="com.gc.model.GcService" />


<html>
<body>
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
<!-- 	<script -->
<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<!-- 	<script -->
<!-- 		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- 	<link rel="stylesheet" type="text/css" -->
<%-- 		href="${pageContext.request.contextPath}/resource/css/style.css"> --%>

<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<link href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
<link href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

	<div></div>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">商品查詢結果</h2>
		</div>
<!-- <h4> -->
<!-- ☆萬用複合查詢  - 可由客戶端 select_page.jsp 隨意增減任何想查詢的欄位<br> -->
<!-- ☆此頁只作為複合查詢時之結果練習，可視需要再增加分頁、送出修改、刪除之功能</h4> -->
	<%@ include file="page3.file"%>
		<%@ include file="page4.file"%>
		
		

<table class="table align-middle  table-hover">
<thead>
	<tr align="center" valign="middle">
		<th>商品名稱</th>
		<th>商品類別</th>
		<th>價格</th>
		<th>商品圖片</th>
		<th>查看詳情</th>
	</tr>
	</thead>
	<c:forEach var="goodsVO" items="${listGoods_ByCompositeQuery}">
		<tr align='center' valign='middle'>
		<td>${goodsVO.gd_name}</td>
		<td><c:forEach var="gcVO" items="${gcSvc.all}">
                    <c:if test="${goodsVO.gc_no==gcVO.gc_no}">
	                    ${gcVO.gc_name}
                    </c:if>
                </c:forEach></td>
		<td>${goodsVO.gd_price}</td>
		<td><img width="150" height="150" src= "<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
		data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>" ></td>
		<div class="but"></div>
		<td><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do" style="margin-bottom: 0px;">
			     <input type="submit" value="查看詳情">
			     <input type="hidden" name="gd_no"  value="${goodsVO.gd_no}">
			     <input type="hidden" name="action"	value="getOne_For_Show"></FORM></td>
		</tr>
	</c:forEach>
</table>

</body>
</html>