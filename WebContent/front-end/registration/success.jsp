<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.registration_master.model.*"%>
<%@ page import="com.registration_detail.model.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ti Ba Mountain 登山社群平台</title>
</head>
<body>
<style>

	div.contentRm{
		margin-bottom: 100px;
		margin-top:200px;
	}
	div.formRm{
		width:1150px;
 		margin-top:10px; 
		margin-left:370px;
		border: 1px solid #333;
		border-radius: 10px;
	}
	table{
		font-size:20px;
		padding:5px;
		width: 100%;
	    text-align: center;
	    line-height: 1.5;
		
	}
	
	div.textRm{
		color:red;
		font-size:20px;
		margin-top:200px; 
		margin-left:370px;
	}
	
	div.textRd{
		font-size:20px;
		margin-left:5px;
	}
	table > tr, th {
/* 	    border: 1px solid #666; */
		padding: 15px 0 0 0;
	    
	}
	table > thead > tr{
		background-color: #bebebe;
	}
	
</style>
<!-- 每個front-end頁面都要有這行code -->
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<!-- 每個front-end頁面都要有這行code -->
<%	RmVO rmVO = (RmVO) request.getAttribute("rmVO2"); %>

	<div class="contentRm">
<!-- 		<div class="textRm">報名成功，我們會盡快審核參加資格。</div> -->
	
		<div class="formRm">
			<table>
				<thead>
					<tr>
						<th>報名日期</th>
						<th>報名行程</th>
						<th>訂單編號</th>
						<th>審核進度</th>
						<th>報名人數</th>
						<th>總付款金額</th>
						<th>取消參加</th>
					</tr>
				</thead>
				<tbody>
					<tr>


						<th>${rmVO2.rmDate}</th>
						<th><%=rmVO.getItName() %></th>
						<th><%=rmVO.getRmNo() %></th>
						<c:set var="status" value="${rmVO2.rmStatus}"/>
							<c:choose>
						    <c:when test="${rmVO2.rmStatus==0}">
						       <th style="color:red;">報名成功</th>
						    </c:when>
						    <c:when test="${rmVO2.rmStatus==1}">
						       <th style="color:red;">行程完成</th>
						    </c:when>
						     <c:when test="${rmVO2.rmStatus==2}">
						       <th style="color:red;">取消參加</th>
						    </c:when>

							</c:choose>

						<th><%=rmVO.getPeoCount() %></th>
						<th>$<%=rmVO.getItPrice()*rmVO.getPeoCount() %></th>
						<th>取消按鈕</th>
					</tr>
					<tr>
						<th colspan="7"><br><hr style="border: 2px solid #333;"></th>
					</tr>
				</tbody>
			</table>
			<div class="textRd">▼參加者明細:</div>
			<table>								
				<thead>												
					<tr>
						<th>參加者姓名</th>
						<th>連絡電話</th>
						<th>出生日期</th>
						<th>緊急聯絡人姓名</th>
						<th>緊急連絡人電話</th>
					</tr>
				</thead>
					<jsp:useBean id="rdSvc" scope="page" class="com.registration_detail.model.RdService" />
					<c:forEach var="rdVO" items="${rdSvc.all}">
					<c:if test="${rdVO.rmNo==rmVO2.rmNo}">
					<tr>
					
						<th>${rdVO.attName}</th>
						<th>${rdVO.attPhone}</th>
						<th>${rdVO.attBirth}</th>
						<th>${rdVO.emerName}</th>
						<th>${rdVO.emerPhone}</th>
					</tr>
					 </c:if>
					</c:forEach>
							
			</table>	
		</div>
	</div>
</body>
</html>