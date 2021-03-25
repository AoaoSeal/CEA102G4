<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<%-- 此頁練習採用EL的寫法取值 --%>

<%
	MemberService memSvc = new MemberService();
	List<MemberVO> list = memSvc.getAll();
	pageContext.setAttribute("list", list);
%>
<html>
<head>
<meta charset="BIG5">
<title>所有會員資料 - listAllMem.jsp</title>


</head>
<body bgcolor='white'>
<style>
	td{
	overflow: hidden; 
	text-overflow: ellipsis;
	}
	table{
		font-size:16px;
	}
	th{
		font-size:16px!important;
	}
	div.col-md-11 {
	    margin: 5px 65px 0 65px;
	}

</style>
<!-- 	<h4>此頁練習採用EL的寫法取值:</h4> -->


	<%--錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	
<div class="content">
	<div class="row">
		<div class="col-md-12">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">會員列表</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table table-hover">
						<thead class=" text-primary">
							<th>會員編號</th>
							<th>大頭貼</th>
							<th>信箱</th>
				<!-- 			<th>密碼</th> -->
							<th>會員姓名</th>
							<th>性別</th>
							<th>生日</th>
							<th>暱稱</th>
							<th>電話</th>
							<th style=" width: 120px;">地址</th>
							<th style=" width: 120px;">個人簡介</th>
							<th>註冊時間</th>
							<th>錢包餘額</th>
							<th>被檢舉次</th>
							<th>狀態</th>
			<!-- 			<th>修改</th> -->
							<th>權限控制</th>
						</thead>
						<tbody>						
<%-- 										<%@ include file="page1.file"%> --%>
					<c:forEach var="memberVO" items="${list}">
					<tr bgcolor=<c:if test="${memberVO.memStatus==1}">lightgray</c:if>>
							<td>${memberVO.memId }</td>
							<td><%
								  String path = request.getContextPath();
								  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
								%>
								<img id="img"
									src= "${pageContext.request.contextPath}/${memberVO.allPic}"				
									width=50px height=50px style ="    border-radius: 50% ;border: 3px solid				
								<c:if test="${memberVO.memStatus == 1}">red</c:if>
								<c:if test="${memberVO.memStatus == 0}">lightgreen</c:if>"></td>
			
							<td  >${memberVO.memMail }</td>
<%-- 						<td>${memberVO.memPass }</td> --%>
							<td>${memberVO.memName }</td>
							<td><c:if test="${memberVO.memSex == 1}">男</c:if> <c:if
									test="${memberVO.memSex == 2}">女</c:if></td>
							<td>${memberVO.memBirth}</td>
							<td>${memberVO.memNick}</td>
							<td>${memberVO.memPhone}</td>
							<td>${memberVO.memAddress}</td>
							<td overflow:hidden>${memberVO.memText}</td>
							<td><fmt:formatDate value="${memberVO.memBirth}"
									pattern="yyyy-MM-dd" /></td>
							<td>NT$: ${memberVO.traBal}</td>
							<td>${memberVO.memReport}</td>
							<td><c:if test="${memberVO.memStatus==0}">
								使用中
								</c:if>
								<c:if test="${memberVO.memStatus==1}">已停權</c:if></td>
							<td><form method="post" action="${pageContext.request.contextPath}/back-end/member/mem.do" style="margin-bottom: 0xp;">
								<input type="submit" value=<c:if test="${memberVO.memStatus==0}">停權</c:if>
								<c:if test="${memberVO.memStatus==1}">啟用</c:if>> 
								<input type="hidden" name="memId" value="${memberVO.memId}"> 
								<input type="hidden" name="memStatus" value="${memberVO.memStatus}">
								<input type="hidden" name="action" value="delete">
								</form>
							</td>
						</tr>
						</c:forEach>		
					</tbody>													
				</table>
<%-- 							<%@ include file="page2.file"%> --%>
				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>