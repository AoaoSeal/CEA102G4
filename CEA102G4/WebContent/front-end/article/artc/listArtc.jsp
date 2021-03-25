<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
    <%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.art.model.*"%>
<!DOCTYPE html>
<jsp:useBean id="artcSvc" scope="page" class="com.artc.model.ArtcService"/>

<html>
<head>
<meta charset="UTF-8">
<title>文章分類</title>
</head>

<body>
<style type="text/css">
.artc {
	 display: flex;
}
h4{
margin-top: 50px}


</style>
<table>
	<tr><td>
			<h3>文章分類</h3>
	</td></tr>
</table>

<%-- 錯誤列表練習 --%>
<c:if test="${not empty errorMsgs }">
	<font style="color:red">請修正以下錯誤</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<c:forEach var="artcVO" items="${artcSvc.all}">
	<div id="artc">
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artc/artc.do" style="margin-bottom: 0px;">
		<input type="submit" value="${artcVO.artcName}">
		<input type="hidden" name="artcNo" value="${artcVO.artcNo}">
		<input type="hidden" name="action" value="getArtByArtc">
		</FORM>
	 </div>	

</c:forEach>
<table>
<tr>
	<th>文章分類編號</th><th>文章分類</th><th>刪除</th>修改<th>查詢</th>
</tr>
	<c:forEach var="artcVO" items="${artcSvc.all}">
<tr>
	<td>${artcVO.artcNo}</td><td>${artcVO.artcName}</td>
	<td></td>
	<td></td>
	<td>
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/artc/artc.do" style="margin-bottom: 0px;">
		<input type="submit" value="查詢">
		<input type="hidden" name="artcNo" value="${artcVO.artcNo}">
		<input type="hidden" name="action" value="listArt_ByArtc_B">
		</FORM>
	</td>
</tr>	
	</c:forEach>
</table>
<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

<%if (request.getAttribute("listArt_ByArtc")!=null){ %>
	<jsp:include page="listArt_ByArtcNo.jsp" />
<%} %>

</body>
</html>