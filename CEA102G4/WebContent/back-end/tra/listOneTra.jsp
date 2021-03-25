<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.tra.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
TraVO traVO = (TraVO) request.getAttribute("traVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>交易資料 - listOneTra.jsp</title>

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
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>交易單筆資料 - ListOneTra.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/tra/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/tra/img/tiba.png" width="150" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>交易編號</th>
		<th>會員編號</th>
		<th>交易日期</th>
		<th>交易金額</th>
		<th>交易狀況</th>
		<th>交易行為</th>
	</tr>
	<tr>
		<td><%=traVO.getTra_no()%></td>
		<td><%=traVO.getMem_id()%></td>
		<td>${traVO.tra_time}</td>
		<td><%=traVO.getTra_price()%></td>
		<td><c:if test="<%=traVO.getTra_status() ==0%>">未處理</c:if>
		<c:if test="<%=traVO.getTra_status() ==1%>">成功</c:if>
		<c:if test="<%=traVO.getTra_status() ==2%>">失敗</c:if></td>
		<td><c:if test="<%=traVO.getTra_action() ==0%>">提領</c:if>
		<c:if test="<%=traVO.getTra_action() ==1%>">儲值</c:if></td>
		
	</tr>
</table>

</body>
</html>