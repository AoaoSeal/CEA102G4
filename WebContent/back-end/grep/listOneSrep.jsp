<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.srep.model.*"%>


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
	width: 90%;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th {
	padding: 5px;
	text-align: center;
}

td {
	overflow: hidden;
	padding: 5px;
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
}

img {
	object-fit: cover;
	border-radius: 50%;
	width: 50;
	height: 50;
}
</style>
</head>
<body bgcolor='white'>


<table style="table-layout: fixed">
	<tr bgcolor=<c:if test="${srepVO.srep_status==1}">lightgray</c:if>>
		<th>檢舉賣家編號</th>
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