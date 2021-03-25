<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>搜尋頁面</title>
<link rel="stylesheet"
 href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
 integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
 crossorigin="anonymous">

</head>

<body bgcolor='white'>
	<table id='table-1'>
		<h3>資料查詢</h3>

		<%--錯誤列表 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<ul>
			<li><a
				href='${pageContext.request.contextPath}/back-end/member/listAllMem.jsp'>List</a>all
				Emps. <br> <br></li>
			<li>
				<form method="post"
					action="mem.do">
					<b>輸入會員編號(如1001)</b> <input type="text" name="memId"> <input
						type="hidden" name="action" value="getOne_For_Display"> <input
						type="submit" value="送出">
				</form>
			</li>

			<jsp:useBean id="memSvc" scope="page"
				class="com.member.model.MemberService" />

			<li>
				<form method="post"
					action="${pageContext.request.contextPath}/member/mem.do">
					<b>選擇會員編號</b> <select size="1" name="memId">
						<c:forEach var="memberVO" items="${memSvc.all}">
							<option value="${memberVO.memId}">${memberVO.memId}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</form>
			</li>
			<li>
				<form method="post"
					action="${pageContext.request.contextPath}/member/mem.do">
					<b>選擇會員姓名</b> <select size="1" name="memId">
						<c:forEach var="memberVO" items="${memSvc.all}">
							<option value="${memberVO.memId}">${memberVO.memName}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</form>
			</li>
		</ul>

		<h3>會員管理</h3>
		<ul>
			<li><a href='${pageContext.request.contextPath}/front-end/member/member_add.jsp'>Add</a>a
				new Member.
		</ul>
	</table>



</body>
</html>