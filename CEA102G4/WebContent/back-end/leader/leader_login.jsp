<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

	<table class="myTable">
		<div class="container col-md-8 col-md-offset-3" style="overflow: auto">
			<h1>領隊登入</h1>
				<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/leader/ld.do">
				<div class="form-group">
					<label for="uname"></label> <input type="text" class="form-control"
						id="username" placeholder="電子信箱" name="ldMail" required style="width: 25em">
				</div>

				<div class="form-group">
					<label for="uname"></label> <input type="password"
						class="form-control" id="password" placeholder="密碼" name="ldPass"
						required style="width: 25em">
				</div>
				<input type="hidden" name="action" value="ld_Login">
				<input type="submit" class="btn btn-primary" value="登入">
				</button>

				
			</form>
		</div>
	</table>
</body>
</html>