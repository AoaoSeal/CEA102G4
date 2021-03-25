<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<html>
<head>

</head>
<body>
	<!-- 每個front-end頁面都要有這行code -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<div></div>
	<style>
.mb.card-body {
	text-align: center;
}

.mb.btn {
	border-radius: 0;
	box-shadow: 0.5px 1px 2px hsla(0, 0%, 20%, 1);
}

.mb.btn:hover {
	transform: translateY(-2px);
	box-shadow: 2px 2px 5px hsla(0, 0%, 20%, 1);
}

.mb.card {
	border-radius: 0px/0px;
	overflow: hidden;
	box-shadow: 0.5px 1px 2px hsla(0, 0%, 20%, 1);
}
</style>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">交易管理</h2>
		</div>


		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script
			src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->

		<div class="container">
			<div class="row">
				<div class="container">
					<div class="row">
						<div class="col-md-4">
							<div class="card mb">
								<img class="card-img-top" src="img/dbicon04.png"
									alt="Card image cap">
								<div class="card-body mb">
									<h5 class="card-title">Card title</h5>
									<a  class="btn btn-primary mb"
				href='<%=request.getContextPath()%>/front-end/tra/addTra.jsp'>儲值</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card mb">
								<img class="card-img-top" src="img/dbicon07.png"
									alt="Card image cap">
								<div class="card-body mb">
									<h5 class="card-title">Card title</h5>
									<a  class="btn btn-primary mb"
				href='<%=request.getContextPath()%>/front-end/tra/listAllTra2.jsp'>交易紀錄</a>
								</div>
							</div>
						</div>
						<div class="col-md-4">
							<div class="card mb">
								<img class="card-img-top" src="img/dbicon02.png"
									alt="Card image cap">
								<div class="card-body mb">
									<h5 class="card-title">Card title</h5>
									<a  class="btn btn-primary mb"
				href='<%=request.getContextPath()%>/front-end/tra/addTra2.jsp'>提領</a>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>