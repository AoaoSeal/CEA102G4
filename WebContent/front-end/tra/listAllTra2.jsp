<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tra.model.*"%>
<%@ page import="com.member.model.*"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<!-- 此頁練習採用 EL 的寫法取值 -->

<%
	HttpSession sess=request.getSession();
	if(sess.getAttribute("memberVO")==null){
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
	}
	MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
	TraService traSvc = new TraService();
    List<TraVO> list = traSvc.getAll3(memberVO.getMemId());
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>所有錢包交易紀錄 - /front-end/tra/listAllTra2.jsp</title>


</head>
<body>

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
			<h2 class="titleText">所有交易紀錄</h2>
		</div>

      
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<table class="table align-middle  table-hover">
	<thead class="thead-dark">
	<tr>
		<th>交易編號</th>
		<th>交易時間</th>
		<th>交易金額</th>
		<th>交易行為</th>
		<th>處理狀況</th>
	</tr>
	
	<%@ include file="page1.file" %> 
	<c:forEach var="traVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr bgcolor=<c:if test="${grepVO.grep_status==1}">lightgray</c:if>>
		
		<tr>
		<th scope="col">${traVO.tra_no}</th>
		<th scope="col">${traVO.tra_time}</th>
		<th scope="col">${traVO.tra_price}</th>
		<th scope="col" >
		<c:if test="${traVO.tra_action==0}">提領</c:if>
		<c:if test="${traVO.tra_action==1}">儲值</c:if>
		</th>	
		<th scope="col">
		<c:if test="${traVO.tra_status ==0}">未處理</c:if>
		<c:if test="${traVO.tra_status ==1}">成功</c:if>
		<c:if test="${traVO.tra_status ==2}">失敗</c:if>
		</th>
		</tr>
	</c:forEach>
</thead>
</table>
<%@ include file="page2.file" %>

</body>
</html>