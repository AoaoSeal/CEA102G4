<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.or.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
OrVO orVO = (OrVO) request.getAttribute("orVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>商品資料 - listOneOr.jsp</title>

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  img {
    width:150;
    height:150;
  }
</style>

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
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">新增商品</h2>
		</div>
<!-- <h4>此頁暫練習採用 Script 的寫法取值:</h4> -->

<table>
	<tr>
		<th>訂單編號</th>
		<th>會員編號</th>
		<th>訂購人</th>
		<th>總金額</th>
		<th>電話</th>
		<th>地址</th>
		<th>下單日期</th>
		<th>訂單狀況</th>
		<th>商品編號</th>
	</tr>
	<tr>
		<td>${orVO.or_no}</td>
		<td>${orVO.mem_id}</td>
		<td>${orVO.or_name}</td>
		<td>${orVO.or_price}</td>
		<td>${orVO.or_phone}</td>
		<td>${orVO.or_address}</td>
		<td>${orVO.or_time}</td>
		<td><c:if test="${orVO.or_status ==0}">未出貨</c:if>
		<c:if test="${orVO.or_status ==1}">已出貨</c:if>
		<c:if test="${orVO.or_status ==2}">已取貨</c:if>
		<c:if test="${orVO.or_status ==3}">退貨</c:if></td>
		<td>${orVO.gd_no}</td>
		
	</tr>
</table>

</body>
</html>