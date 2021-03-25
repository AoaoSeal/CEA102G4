<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.srep.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
SrepVO srepVO = (SrepVO) request.getAttribute("srepVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<head>
<title>檢舉資料 - listOneSrep.jsp</title>

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

<!-- <h4>此頁暫練習採用 Script 的寫法取值:</h4> -->
<table id="table-1">
	<tr><td>
		 <h3>檢舉賣家單筆資料 - ListOneSrep.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front_end/srep/select_page.jsp"><img src="<%=request.getContextPath()%>/front_end/srep/img/tiba.png" width="150" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>檢舉編號</th>
		<th>會員編號</th>
		<th>訂單編號</th>
		<th>檢舉日期</th>
		<th>檢舉事由</th>
		<th>檢舉圖片</th>
		<th>檢舉狀況</th>
	</tr>
	<tr>
		<td><%=srepVO.getSrep_no()%></td>
		<td><%=srepVO.getMem_id()%></td>
		<td><%=srepVO.getOr_no()%></td>
		<td><%=srepVO.getSrep_time()%></td>
		<td><%=srepVO.getSrep_text()%></td>
<%-- 		<td><img src= "data:image/png;base64,<%=srepVO.getSrep_mediumblob()%>"></td> --%>
		<td><img src= "<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
				${pageContext.request.contextPath}/front_end/srep/img/noImage.jpg
				</c:if>
				<c:if test="${srepVO.srep_mediumblob!=null && !empty srepVO.srep_mediumblob}">
		data:image/png;base64,${srepVO.srep_mediumblob}</c:if>" ></td>
		<td><%=srepVO.getSrep_status()%></td>
		
	</tr>
</table>

</body>
</html>