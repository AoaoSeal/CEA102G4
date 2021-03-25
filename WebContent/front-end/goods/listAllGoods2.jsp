<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>

<%
GoodsService goodsSvc = new GoodsService();
List<GoodsVO> list = goodsSvc.getAll2();
pageContext.setAttribute("list", list);
%>

<html>
<body>
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<style>
div .jumbotron{
	background-image: url(img/10-outdoor-brand-usa-feature.jpg);
	background-size: cover;
}
</style>

	<div class="container-fluid">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1 class="display-4" style="text-align: center">TI BA MOUNTAIN
					商城</h1>
				<p class="lead " style="text-align: center">專業X可靠X便利X環保X安全X品質</p>


				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<!-- 					<a class="navbar-brand" href="#">商城主頁</a> -->
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
								name="form1">
								<b>搜尋商品關鍵字:</b> <input type="text" name="gd_name"
									placeholder="ex:登山">
								<jsp:useBean id="gcSvc" scope="page"
									class="com.gc.model.GcService" />
								<b>選擇商品分類:</b> <select size="1" name="gc_no">
									<option value="">
										<c:forEach var="gcVO" items="${gcSvc.all}">
											<option value="${gcVO.gc_no}">${gcVO.gc_name}
										</c:forEach>
								</select> <b>商品狀況:</b> <input type="radio" name="gd_status" id="status1"
									value="0">全新 <input type="radio" name="gd_status"
									id="status2" value="1">二手 <input type="radio"
									name="gd_status" value="" checked>不限

								<button class="btn btn-outline-success my-2 my-sm-0"
									type="hidden" name="action" value="listGoods_ByCompositeQuery">送出</button>
							</FORM>
						</ul>

					</div>
				</nav>

				<div class="row">
					<div class="dropdown show col-sm-6 col-md-4"
						style="position: absolute; color: blue; right: 0;">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> 買家專區 </a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/or/listAllOr.jsp">我的訂單</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/srep/listAllSrep.jsp">檢舉賣家查詢</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/grep/listAllGrep.jsp">檢舉商品查詢</a>
						</div>
					</div>

					<div class="dropdown show ccol-sm-6 col-md-4 ">
						<a class="btn btn-secondary dropdown-toggle" href="#"
							role="button" id="dropdownMenuLink" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false">賣家專區 </a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/goods/addGoods.jsp">刊登商品</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/goods/listAllGoods.jsp">已刊登商品</a>
							<a class="dropdown-item"
								href="<%=request.getContextPath()%>/front-end/or/listAllOr2.jsp">訂單處理</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<section class="menu" id="menu">
		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>


		<%@ include file="page1.file"%>

		<div class="content"> <br>
		<c:forEach var="goodsVO" items="${list}" begin="<%=pageIndex%>"
			end="<%=pageIndex+rowsPerPage-1%>">

			<div class="box">
				<div class="imgBx">
					<img height="150" width="150" id="imgs" class="card-img-top"
						src="<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
		data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>"
						alt="Card image cap">
				</div>
				<div class="memimgBx">
					<div class="heart">
						<p class="pheart">?</p>
						<img class="${goodsVO.gd_no}" name="imgheart" src="">
					</div>
				</div>
				<div class="text">
					<h5>${goodsVO.gd_name}</h5>
					<h6>
						分類:
						<c:forEach var="gcVO" items="${gcSvc.all}">
							<c:if test="${goodsVO.gc_no==gcVO.gc_no}">
	                    ${gcVO.gc_name}
                   		</c:if>
						</c:forEach>
					</h6>
					<h5>價格:NT${goodsVO.gd_price}</h5>
				</div>
				<div class="but">
					<FORM METHOD="post"
						ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do">
						<input type="hidden" name="gd_no" value="${goodsVO.gd_no}">
						<input type="hidden" name="action" value="getOne_For_Display">
						<input class="submit" type="submit" value="查看詳情">
						<!-- 					<button>查看詳情</button> -->
					</FORM>
				</div>
			</div>
		</c:forEach>
	</section>
	<%@ include file="page2.file"%>
</body>
</html>