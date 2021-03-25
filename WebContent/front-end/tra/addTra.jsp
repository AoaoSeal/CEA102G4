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
	<!-- 	<!-- 每個front-end頁面都要有這行code -->
	<!-- 		<script -->
	<!-- 			src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<!-- 		<script -->
	<!-- 			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<!-- 		<link rel="stylesheet" type="text/css" -->
	<%-- 			href="${pageContext.request.contextPath}/resource/css/style.css"> --%>
	<!-- 		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"> -->
	<!-- 		<script> -->
	<!-- 			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
	<!-- 		<script -->
	<!-- 			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->







	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText"></h2>
		</div>
		<link
			href='https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css'>
		<script
			src='https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js'></script>

		<style>
@import
	url('https://fonts.googleapis.com/css2?family=Ubuntu&display=swap');

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box
}

body {
	font-family: 'Ubuntu', sans-serif
}

.wrapper {
	background-color: #f4f2f7;
	margin: 20px auto;
	max-width: 400px;
	padding: 15px 20px;
	border-radius: 10px
}

h4 {
	font-weight: 800;
	color: #888
}

label {
	font-weight: 700;
	color: #888;
	font-size: 12px
}

.card-no {
	border: none;
	outline: none;
	width: 90%;
	padding-left: 8px
}

.form-control {
	outline: none;
	border: none;
	box-shadow: none
}

.card-number {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 5px;
	padding: 5px 8px 2px
}

a {
	font-size: 12px;
	font-weight: 900;
	margin-left: 30%
}

a {
	text-decoration: none
}

.form-inline label {
	font-size: 1rem
}

.focused {
	border: 2px solid #9ab3f5
}

#form-footer a {
	margin: 0
}

#form-footer p {
	margin: 0;
	text-align: center;
	font-size: 14px;
	font-weight: 500;
	color: #777
}

@media ( max-width :395px) {
	.form-inline label {
		font-size: 12px
	}
	#form-footer p {
		font-size: 11px
	}
	.card-no {
		width: 85%
	}
}
</style>


		<jsp:useBean id="memSvc" scope="page"
			class="com.member.model.MemberService" />
		<c:forEach var="memVO" items="${memSvc.all}">
		</c:forEach>
		<h3 style="margin: 0px auto">
			<td>會員: ${memberVO.memName} 您好!</td>
		</h3>
		<br>
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<div class="wrapper">
			<h4 class="text-uppercase">付款資訊</h4>
			<form METHOD="post"
				ACTION="<%=request.getContextPath()%>/front-end/tra/tra.do"
				name="form1" enctype="multipart/form-data" class="form mt-4">
				<div class="form-group">
					<label for="name" class="text-uppercase">持卡人姓名</label> <input
						type="text" class="form-control" placeholder="請輸入持卡人姓名" required>
				</div>
				<div class="form-group">
					<label for="card" class="text-uppercase">卡號</label>
					<div class="card-number">
						<input type="text" class="card-no" step="4"
							placeholder="1234 4567 5869 1234" pattern="^[0-9].{15,}" required>
						<span class=""> <img
							src="https://www.freepnglogos.com/uploads/mastercard-png/mastercard-marcus-samuelsson-group-2.png"
							alt="" width="30" height="30">
						</span>
					</div>
				</div>
				<div class="d-flex w-100">
					<div class="d-flex w-50 pr-sm-4">
						<div class="form-group">
							<label for="expiry" class="text-uppercase" required>到期日</label> <input
								type="text" class="form-control" placeholder="mm/yyyy">
						</div>
					</div>
					<div class="d-flex w-50 pl-sm-5 pl-3">
						<div class="form-group">
							<label for="cvv">CVC</label> <input type="password"
								class="form-control pr-5" maxlength="3" required>
						</div>
					</div>
					<!-- 				<div class="row"> -->
					<div class="col-md-6 login-form-1">
						<h3 style="color:red">提領</h3>
						<p>
							<jsp:useBean id="gcSvc" scope="page"
								class="com.gc.model.GcService" />
							<input type="hidden" name="mem_id" value="${memberVO.memId}">
							<input type="hidden" name="traBal" value="${memberVO.traBal}">
						<div class="form-group">
							<label for="input" class="text-uppercase" >欲提領金額</label> <input 
								type="text" id="input" class="form-control" placeholder="請輸入欲提領金額"
								name="tra_price" required style="background-color:yellow"
								value="<%=(traVO == null) ? "" : traVO.getTra_price()%>">
						</div>
						<input type="hidden" name="tra_status" value="1"> <input
							type="hidden" name="tra_action" value="1">
						<div class="form-group">
							<input type="hidden" name="action" value="save"> <input
								class="text-uppercase btn btn-primary btn-block p-3" type="submit" value="確認"> <input
								class="text-uppercase btn btn-primary btn-block p-3" type="reset" value="重置">
						</div>
					</div>
				</div>
			</form>
		</div>
	</section>
</body>
</html>