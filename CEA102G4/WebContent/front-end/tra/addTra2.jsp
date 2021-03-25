<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.tra.model.*"%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
TraVO traVO = (TraVO) request.getAttribute("traVO");
%>

<html>
<head>
<title>新增交易 - addTra.jsp</title>


<script>
	window.onload = function() {
		init();
	}
</script>
</head>
<body>
	<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<div></div>
	<!-- 	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<style>
.login-container {
	margin-top: 5%;
	margin-bottom: 5%;
}

.login-logo {
	position: relative;
	margin-left: -41.5%;
}

.login-logo img {
	position: absolute;
	width: 20%;
	margin-top: 19%;
	background: #282726;
	border-radius: 4.5rem;
	padding: 5%;
}

.login-form-1 {
	padding: 9%;
	background: #2894FF	;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-1 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.login-form-2 {
	padding: 9%;
	background: #f05837;
	box-shadow: 0 5px 8px 0 rgba(0, 0, 0, 0.2), 0 9px 26px 0
		rgba(0, 0, 0, 0.19);
}

.login-form-2 h3 {
	text-align: center;
	margin-bottom: 12%;
	color: #fff;
}

.btnSubmit {
	font-weight: 600;
	width: 50%;
	color: #282726;
	background-color: #fff;
	border: none;
	border-radius: 1.5rem;
	padding: 2%;
}

.btnForgetPwd {
	color: #fff;
	font-weight: 600;
	text-decoration: none;
}

.btnForgetPwd:hover {
	text-decoration: none;
	color: #fff;
}
</style>





	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText"></h2>
		</div>



		<jsp:useBean id="memSvc" scope="page"
			class="com.member.model.MemberService" />
		<c:forEach var="memVO" items="${memSvc.all}">
		</c:forEach>
		<h3>
			<td>會員: ${memberVO.memName} 您好!</td>
		</h3>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<!------ Include the above in your HEAD tag ---------->

		<div  class="container login-container">
			<form METHOD="post"
				ACTION="<%=request.getContextPath()%>/front-end/tra/tra.do"
				name="form1" enctype="multipart/form-data">
				<!-- 				<div class="row"> -->
				<div class="col-md-6 login-form-1">
					<h3>提領</h3>
					<p>
						<jsp:useBean id="gcSvc" scope="page"
							class="com.gc.model.GcService" />
						<input type="hidden" name="mem_id" value="${memberVO.memId}">
						<input type="hidden" name="traBal" value="${memberVO.traBal}">
					<div class="form-group">
						<label for="input">交易金額:</label> <input type="text" id="input"
							class="form-control" placeholder="交易金額:" name="tra_price"
							value="<%=(traVO == null) ? "" : traVO.getTra_price()%>">
					</div>
					<input type="hidden" name="tra_status" value="0"> <input
						type="hidden" name="tra_action" value="0">
					<div class="form-group">
						<input type="hidden" name="action" value="pick"> <input
							class="btnSubmit" type="submit" value="確認"> <input
							class="btnSubmit" type="reset" value="取消">
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>