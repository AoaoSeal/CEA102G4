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

<body bgcolor='white'>


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
		<td><img width="150" height="150" src= "<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
				${pageContext.request.contextPath}/front_end/srep/img/noImage.jpg
				</c:if>
				<c:if test="${srepVO.srep_mediumblob!=null && !empty srepVO.srep_mediumblob}">
		data:image/png;base64,${srepVO.srep_mediumblob}</c:if>" ></td>
		<td><%=srepVO.getSrep_status()%></td>
		
	</tr>
</table>

</body>
</html>