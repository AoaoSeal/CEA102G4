<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.leader.model.*"%>

<% 
	LdService ldSvc = new LdService();
	List<LdVO> list = ldSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<! DOCTYPE>
<html>
<head>
<title>所有領隊資料-listAllLd.jsp</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
  table {
	width: 950px;
	background-color: #F5F5DC;
	margin-top: 1px;
	margin-bottom: 1px;
	margin-left:auto; 
	margin-right:auto;	
	border-collapse: collapse;
  }

  th, td {
    padding: 1px;
  }
  input[type="submit"] { padding:5px 15px; 
						background:#D2B48C;
						border:0 none;
						cursor:pointer;
						-webkit-border-radius: 5px;
						border-radius: 5px;
						}

</style>
</head>
<body bgcolor="#D2B48C">
<table>
	<tr>
		<td align="center">
			 <h3>所有領隊資料</h3>
			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp">
					<input type="submit" value="回首頁">
			</FORM>
		</td>
		<td>
			<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>			
		</td>
	</tr>
</table>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table style="border:1px #ffffff solid;" cellpadding="10" border='1'>
	<tr>
		<th>領隊編號</th>
		<th>領隊姓名</th>
		<th>領隊大頭照</th>
		<th>經歷介紹</th>
		<th>狀態</th>
		<th>評價分數</th>
		<th>總評分人數</th>
		<th></th>
	</tr>
	
	<%@ include file="/resource/file/page1.file" %>
	
	<c:forEach var="ldVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	<tr ${(ldVO.ldNo==param.ldNo)? 'bgcolor=#cfd3c9':''}>
	
		<td>${ldVO.ldNo}</td>
		<td>${ldVO.ldName}</td>
		<td><img src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}" width="120" height="120"></td>
		<td>${ldVO.ldExpr}</td>
		<td>${ldVO.ldScore}</td>
		<td>${ldVO.ldPeople}</td>
		<td>${ldVO.ldStatus}</td>
		<td>
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/leader/ld.do">
				<input type="submit" value="修改">			   
			   <input type="hidden" name="ldNo"  value="${ldVO.ldNo}">
			   <input type="hidden" name="action" value="getOne_For_Update">
			   
			</FORM>
		</td>		
	</tr>	
	</c:forEach>
</table>
<%@ include file="/resource/file/page2.file" %>
</body>
</html>