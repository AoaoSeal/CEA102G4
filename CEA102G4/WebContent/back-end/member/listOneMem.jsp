<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<html>
<head>

<meta charset="UTF-8">
<title>會員資料-listOnemem.jsp</title>
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
<body>
	<h4>此頁採用Script的寫法取值</h4>
	<h3>會員資料-listOnemem.jsp</h3>
	<table id="table-1">
		<tr>
			<td>
				<h3>會員資料</h3>
				<h4>
					<a
						href="${pageContext.request.contextPath}/back_end/member/select_page.jsp">回首頁</a>
					<a
						href='${pageContext.request.contextPath}/back_end/member/listAllMem.jsp'>會員總攬</a>

				</h4>
			</td>
		</tr>
	</table>
	<table style="table-layout: fixed">
		<tr>
			<th>會員編號</th>
			<th>大頭貼</th>
			<th>信箱</th>
			<th>密碼</th>
			<th>會員姓名</th>
			<th>性別</th>
			<th>生日</th>
			<th>暱稱</th>
			<th>電話</th>
			<th>地址</th>
			<th>個人簡介</th>
			<th>註冊時間</th>
			<th>錢包餘額</th>
			<th>被檢舉數</th>
			<th>狀態</th>
			<th>修改</th>
			<th>權限控制</th>
		</tr>
		<tr bgcolor=<c:if test="${memberVO.memStatus==1}">lightgray</c:if>>
			<td>${memberVO.memId}</td>
			<td><img id="img"
				src="${pageContext.request.contextPath}/${memberVO.allPic}"	
				width=70 style ="border: 5px solid				
				<c:if test="${memberVO.memStatus == 1}">red</c:if>
				<c:if test="${memberVO.memStatus == 0}">lightgreen</c:if>"></td>

			<td>${memberVO.memMail}</td>
			<td>${memberVO.memPass}</td>
			<td>${memberVO.memName}</td>
			<td><c:if test="${memberVO.memSex == 1}">男</c:if> <c:if
					test="${memberVO.memSex == 2}">女</c:if></td>
			<td><fmt:formatDate value="${memberVO.memBirth}"
					pattern="yyyy-MM-dd" /></td>
			<td>${memberVO.memNick}</td>
			<td>${memberVO.memPhone}</td>
			<td>${memberVO.memAddress}</td>
			<td>${memberVO.memText}</td>
			<td>${memberVO.memTime}</td>
			<td>NT: ${memberVO.traBal}</td>
			<td>${memberVO.memReport}</td>
			<td><c:if test="${memberVO.memStatus==0}">
				使用中
				</c:if> <c:if test="${memberVO.memStatus==1}">停權</c:if></td>
			<td>
				<form method="post"
					action="${pageContext.request.contextPath}/member/mem.do"
					style="margin-bottom: 0xp;">
					<input type="submit" value="修改"> <input type="hidden"
						name="memId" value="${memberVO.memId}"> <input
						type="hidden" name="action" value="getOne_For_Update">
				</form>
			</td>
			<td>
				<form method="post"
					action="${pageContext.request.contextPath}/member/mem.do"
					style="margin-bottom: 0xp;">
					<input type="submit"
						value=<c:if test="${memberVO.memStatus==0}">停權</c:if>
						<c:if test="${memberVO.memStatus==1}">啟用</c:if>> <input
						type="hidden" name="memId" value="${memberVO.memId}"> <input
						type="hidden" name="memStatus" value="${memberVO.memStatus}"><input
						type="hidden" name="action" value="deleteOne">
				</form>
			</td>

		</tr>

	</table>

</body>
</html>