<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<style>


#adda {
    position: relative;
    top: 10px;
    left: 20px;
    font-size: 1.1rem;
}
</style>


<title>登入頁面</title>

</head>
<body>
	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<table id="table-1" class="myTable">
	</table>

	<table class="myTable">
		<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
			<h1>登入</h1>
			<form action="${pageContext.request.contextPath}/front-end/mem.do"
				method="post">
				<div class="form-group">
					<label for="uname"></label> <input type="text" class="form-control"
						id="username" placeholder="電子信箱" name="memMail" required style="width: 25em">
				</div>

				<div class="form-group">
					<label for="uname"></label> <input type="password"
						class="form-control" id="password" placeholder="密碼" name="memPass"
						required style="width: 25em">
				</div>
				<input type="hidden" name="action" value="getOne_For_Login">
				<input type="hidden" name="openindex" value="${openindex}">
				<input type="submit" class="btn btn-primary" value="登入">
				</button>

				<a id="adda"
					href="${pageContext.request.contextPath}/front-end/mem.do?action=add">註冊</a>
			</form>
		</div>
	</table>
</body>