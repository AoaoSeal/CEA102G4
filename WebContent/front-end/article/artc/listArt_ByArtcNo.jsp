<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
 <%--  <jsp:useBean id="listArt_ByArtcNo" scope="request" class="java.util.Set<ArticleVO>"/> --%><%-- 此行讓網頁能跳轉回來--%>
  <jsp:useBean id="artcSvc" scope="page" class="com.artc.model.ArtcService"/>
<%
    ArticleService artSvc = new ArticleService();
    List<ArticleVO> list = artSvc.getAll();
    pageContext.setAttribute("list",list);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>listArt_ByArtc.jsp</title>
</head>
<style type="text/css">
.pic {
	width: 150px;
	height: 150px;
}
</style>
<body>
<h4>第二次練習 安全安全</h4>

<%-- 錯誤顯示 --%>
<%@ include file="/front-end/article/artc/page1.file" %> 
<c:if test="${not empty errorMsgs }">
	<font>請修正以下錯誤</font>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
</c:if>
<table style="display:inline-table;"border="3"cellpadding="10"cellspacing="1">
	<tr><th>文章編號</th>
		<th>文章分類</th>
		<th>會員ID</th>
		<th>文章標題</th>
		<th>文章內容</th>
		<th>圖片</th>
		<th>發文時間</th>
		<th>最後修改時間</th>
		<th>點讚數</th>
		<th>文章狀態</th>
		<th></th></tr>
	<c:forEach var="articleVO" items="${list}" varStatus="artc" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr>
			<td>${articleVO.artNo}</td>
			<td>${articleVO.artcNo}</td>
			<td>${articleVO.memId}</td>
			<td>${articleVO.artTitle}</td>
			<td>${articleVO.artText}</td>
			<td><img class="pic" src="<%=request.getContextPath()%>/art/artpic.do${articleVO.picSrc}"></td>
			<td>${articleVO.artTime}</td>
			<td>${articleVO.artLastmod}</td>
			<td>${articleVO.artCount}</td>
			<td>${articleVO.artStatus}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="artNo"  value="${articleVO.artNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="artNo"  value="${articleVO.artNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		
			
		</tr>
	</c:forEach>
	
</table>
<br>
<%@ include file="/front-end/article/artc/page2.file" %>
<br>本網頁的路徑:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>
</body>
</html>