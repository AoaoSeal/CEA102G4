<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary_category.model.*"%>



<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	  #tab1 tr,th{
	    padding: 1px;
	    border: 1px solid #ffffff;
	  }
	input[type="submit"] { padding:5px 15px; 
							background:#F5F5DC;
							border:0 none;
							cursor:pointer;
							-webkit-border-radius: 5px;
							border-radius: 5px;
						}
	#btn1 {
			padding:5px 15px; 
			background:#D2B48C;
			border:0 none;
			cursor:pointer;
			-webkit-border-radius: 5px;
			border-radius: 5px;	
	}
 	#div1{ 
 			position:absolute;
 			left:900px 
 	} 
</style>
</head>
<body bgcolor="#D2B48C">

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
</c:if>
<br>
<div id="div1">
	<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary_category/addItc.jsp">
		<input type="submit" value="新增行程類別">
	</FORM>
</div>	
<br>
<br>
<table>
	<tr>
		<td align="center">
			 <h3>行程類別列表</h3>
			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp">
					<input type="submit" id="btn1" value="回首頁">
			</FORM>
		</td>
		<td>
			<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>			
		</td>
	</tr>
</table>

<table id="tab1">
	<tr>
		<th>類別編號</th>
		<th>類別名稱</th>
		<th>修改</th>
		<th>查詢類別行程</th>
	</tr>
<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
	<c:forEach var="itcVO" items="${itcSvc.all}">
		<tr ${(itcVO.itcNo==param.itcNo)? 'bgcolor=#cfd3c9':''}>
			<th>${itcVO.itcNo}</th>
			<th>${itcVO.itcName}</th>
			<th>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary_category/itc.do" style="margin-bottom: 0px;">
			    <input type="submit" id="btn1" value="修改"> 
			    <input type="hidden" name="itcNo" value="${itcVO.itcNo}">
			    <input type="hidden" name="action" value="getOne_For_Update"></FORM>
			</th>
			<th>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary_category/itc.do" style="margin-bottom: 0px;">
			    <input type="submit" id="btn1" value="查詢"> 
			    <input type="hidden" name="itcNo" value="${itcVO.itcNo}">
			    <input type="hidden" name="action" value="listIts_ByItcno"></FORM>
			</th>
		</tr>
	</c:forEach>
</table>
<br>
<br>
<%if (request.getAttribute("listIts_ByItcno")!=null){%>
       <jsp:include page="listIts_ByItcno.jsp" />
<%} %>	
</body>
</html>