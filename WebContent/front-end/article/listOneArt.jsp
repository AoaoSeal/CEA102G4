<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.member.model.*" %>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  ArticleVO artVO = (ArticleVO) request.getAttribute("artVO");
	session.setAttribute("location", request.getServletPath());
	MemberVO memberLogin=(MemberVO)session.getAttribute("account");
%>

<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>

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
  .pic{
	width: 150px;
	height:150px;
}
  
</style>
<script src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>

</head>
<body bgcolor='white'>
<h4>
		<a href="<%=request.getContextPath()%>/front-end/article/listAllArt.jsp"><img src="<%=request.getContextPath()%>/resource/images/tibalogo.png" width="100"
			height="100" border="0">回首頁</a>
	</h4>
<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>ListOneArt.jsp</h3>
		<h4><a href="listAllArt.jsp"><img src="<%=request.getContextPath()%>/resource/images/tibalogo.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table style="display:inline-table;"border="3"cellpadding="10"cellspacing="1">
	<tr>
		<th>文章編號</th>
		<th>文章分類</th>
		<th>會員ID</th>
		<th>文章標題</th>
		<th>文章內容</th>
		<th>圖片</th>
		<th>發文時間</th>
		<th>最後修改時間</th>
		<th>點讚數</th>
		<th>文章狀態</th>
		<th></th>
	</tr>
	<tr>
		<c:forEach var="artVO" items="${list}" >
		
			<td><%=artVO.getArtNo()%></td>
			<td><%=artVO.getArtcNo()%></td>
			<td><%=artVO.getMemId()%></td>
			<td><%=artVO.getArtTitle()%></td>
			<td><%=artVO.getArtText()%></td>
			<td><img class="pic"
						src="<%=request.getContextPath()%>/art/artpic.do${artVO.picSrc}"></td>
			<td><%=artVO.getArtTime()%></td>
			<td><%=artVO.getArtLastmod()%></td>
			<td><%=artVO.getArtCount()%></td>
			<td><%=artVO.getArtStatus()%></td>
			
			<td>
			  <FORM METHOD="post" ACTION="art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="artNo"  value="${artVO.artNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="art.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="artNo"  value="${artVO.artNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
	
				</c:forEach>
		</tr>


</table>
<br>
<b> <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

</body>
</html>