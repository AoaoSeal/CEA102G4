<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.or.model.*"%>
<%@ page import="com.goods.model.*"%>

<%
OrVO orVO = (OrVO) request.getAttribute("orVO");
GoodsVO goodsVO = (GoodsVO) request.getAttribute("goodsVO");
%>
<body>

	<link
		href='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css'>
	<script
		src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js'></script>
	<link
		href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css'>
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js'></script>

	<style>
body {
	color: #000;
	overflow-x: hidden;
	height: 100%;
	background-color: #fff;
	background-repeat: no-repeat
}

.plus-minus {
	position: relative
}

.plus {
	position: absolute;
	top: -4px;
	left: 2px;
	cursor: pointer
}

.minus {
	position: absolute;
	top: 8px;
	left: 5px;
	cursor: pointer
}

.vsm-text:hover {
	color: #FF5252
}

.book, .book-img {
	width: 120px;
	height: 180px;
	border-radius: 5px
}

.book {
	margin: 20px 15px 5px 15px
}

.border-top {
	border-top: 1px solid #EEEEEE !important;
	margin-top: 20px;
	padding-top: 15px
}

.card {
	margin: 40px 0px;
	padding: 40px 50px;
	border-radius: 20px;
	border: none;
	box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
}

input, textarea {
	background-color: #F3E5F5;
	padding: 8px 15px 8px 15px;
	width: 100%;
	border-radius: 5px !important;
	box-sizing: border-box;
	border: 1px solid #F3E5F5;
	font-size: 15px !important;
	color: #000 !important;
	font-weight: 300
}

input:focus, textarea:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	border: 1px solid #9FA8DA;
	outline-width: 0;
	font-weight: 400
}

button:focus {
	-moz-box-shadow: none !important;
	-webkit-box-shadow: none !important;
	box-shadow: none !important;
	outline-width: 0
}

.pay {
	width: 80px;
	height: 40px;
	border-radius: 5px;
	border: 1px solid #673AB7;
	margin: 10px 20px 10px 0px;
	cursor: pointer;
	box-shadow: 1px 5px 10px 1px rgba(0, 0, 0, 0.2)
}

.gray {
	-webkit-filter: grayscale(100%);
	-moz-filter: grayscale(100%);
	-o-filter: grayscale(100%);
	-ms-filter: grayscale(100%);
	filter: grayscale(100%);
	color: #E0E0E0
}

.gray .pay {
	box-shadow: none
}

#tax {
	border-top: 1px lightgray solid;
	margin-top: 10px;
	padding-top: 10px
}

.btn-blue {
	border: none;
	border-radius: 10px;
	background-color: #673AB7;
	color: #fff;
	padding: 8px 15px;
	margin: 20px 0px;
	cursor: pointer
}

.btn-blue:hover {
	background-color: #311B92;
	color: #fff
}

#checkout {
	float: left
}

#check-amt {
	float: right
}

@media screen and (max-width: 768px) {
	.book, .book-img {
		width: 100px;
		height: 150px
	}
	.card {
		padding-left: 15px;
		padding-right: 15px
	}
	.mob-text {
		font-size: 13px
	}
	.pad-left {
		padding-left: 20px
	}
}
</style>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">修改訂單</h2>
		</div>
		<jsp:useBean id="memSvc" scope="page"
			class="com.member.model.MemberService" />
		<c:forEach var="memVO" items="${memSvc.all}">
		</c:forEach>


		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>
		<form METHOD="post"
			ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
			name="form1" enctype="multipart/form-data">
			<div class="row justify-content-center">
				<div class="col-lg-12">
					<div class="card">
						<div class="row">
							<div class="col-lg-5">
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">會員名</label> <input
											type="text" id="cname" name="cname"
											value="${memberVO.memName}" readonly>
									</div>

									<div class="form-group col-md-6">
										<label class="form-control-label">金額</label> <input
											type="text" id="cnum" name="or_price"
											value="<%=orVO.getOr_price()%>" readonly>
									</div>

									<input type="hidden" name="mem_id"
										value="<%=orVO.getMem_id()%>"> <input type="hidden"
										name="or_price" value="<%=orVO.getOr_price()%>"> <input
										type="hidden" name="or_status"
										value="<%=orVO.getOr_status()%>"> <input type="hidden"
										name="gd_no" value="<%=orVO.getGd_no()%>">


								</div>
								<div class="row px-2">
									<div class="form-group col-md-6">
										<label class="form-control-label">收貨人</label> <input
											type="text" id="cname" name="or_name" value="<%=orVO.getOr_name()%>" required> <input
											type="hidden" name="mem_id" value="${memberVO.memId}">
										<input type="hidden" name="gd_qty"
											value="<%=request.getParameter("gd_qty")%>"> <input
											type="hidden" name="gd_no"
											value="<%=request.getParameter("gd_no")%>"> <input
											type="hidden" name="or_status" value="0">
									</div>
									<div class="form-group col-md-6">
										<label class="form-control-label">電話</label> <input
											type="text" id="input" placeholder="09xx-xxxxxx"
											minlength="9" maxlength="14" required name="or_phone"
											value="<%=(orVO == null) ? "" : orVO.getOr_phone()%>">
									</div>
								</div>
								<div class="row px-2">
									<div class="form-group col-md-12">
										<label class="form-control-label">寄送地址</label>
										<script
											src="${pageContext.request.contextPath}/resource/js/add.js"></script>
										<c:set value="${fn:split(orVO.or_address, ',') }" var="names" />
										<select required id="citya1">${names}[0]</select> <select
											id="citya2">${names}[1]</select> <input type="text"
											id="area2" placeholder="請填寫地址" required onblur="show()" /> <input
											type="hidden" id="last" name="or_address" style="width: 15em">
										<input type="hidden" name="action" value="update"> <input
											type="hidden" name="action" value="update"> <input
											type="hidden" name="or_no" value="<%=orVO.getOr_no()%>">
										<input type="hidden" name="requestURL"
											value="<%=request.getParameter("requestURL")%>"> <input
											type="hidden" name="whichPage"
											value="<%=request.getParameter("whichPage")%>"> <input
											type="hidden" name="action" value="insert">
										<button class="btn-block btn-blue" type="submit">確認</button>
<!-- 										<input type="reset" value="重設"> -->


									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
</body>



</html>