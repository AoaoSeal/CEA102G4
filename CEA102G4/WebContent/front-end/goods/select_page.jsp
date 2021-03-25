<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.goods.model.*"%>
<%
GoodsVO goodsVO = (GoodsVO) request.getAttribute("goodsVO");
%>

<html>
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
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">商城功能</h2>
		</div>

		<h3>資料查詢:</h3>


		<%-- 錯誤表列 --%>
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
				href='<%=request.getContextPath()%>/front-end/or/select_page.jsp'>訂單主檔</a>
				訂單主檔頁面. <br> <br></li>
			<li><a
				href='<%=request.getContextPath()%>/front-end/goods/listAllGoods2.jsp'>所有商品</a>
				商品瀏覽. <br> <br></li>
			<li><a
				href='<%=request.getContextPath()%>/front-end/goods/listAllGoods.jsp'>List</a>
				all Goods. <br> <br></li>


			<li>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do">
					<b>輸入商品編號 (如25001):</b> <input type="text" name="gd_no"> <input
						type="hidden" name="action" value="getOne_For_Display"> <input
						type="submit" value="送出">
				</FORM>
			</li>

			<jsp:useBean id="goodsSvc" scope="page"
				class="com.goods.model.GoodsService" />
			<jsp:useBean id="gcSvc" scope="page" class="com.gc.model.GcService" />
			<li>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do">
					<b>選擇商品編號:</b> <select size="1" name="gd_no">
						<c:forEach var="goodsVO" items="${goodsSvc.all}">
							<option value="${goodsVO.gd_no}">${goodsVO.gd_no}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</FORM>
			</li>

			<li>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do">
					<b>選擇商品名稱:</b> <select size="1" name="gd_no">
						<c:forEach var="goodsVO" items="${goodsSvc.all}">
							<option value="${goodsVO.gd_no}">${goodsVO.gd_name}
						</c:forEach>
					</select> <input type="hidden" name="action" value="getOne_For_Display">
					<input type="submit" value="送出">
				</FORM>
			</li>
		</ul>

		<%-- 萬用複合查詢-以下欄位-可隨意增減 --%>
		<ul>
			<li>
				<FORM METHOD="post"
					ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
					name="form1">
					<b><font color=blue>萬用複合查詢:</font></b> <br> <b>輸入商品名稱:</b> <input
						type="text" name="gd_name" placeholder="ex:登山杖"><br>


					<b>選擇商品分類:</b> <select size="1" name="gc_no">
						<option value="">
							<c:forEach var="gcVO" items="${gcSvc.all}">
								<option value="${gcVO.gc_no}">${gcVO.gc_name}
							</c:forEach>
					</select><br> <b>商品狀況:</b> <input type="radio" name="gd_status"
						id="status1" value="0">全新 <input type="radio"
						name="gd_status" id="status2" value="1">二手 <input
						type="radio" name="gd_status" value="" checked>不限 <br>
					<input type="submit" value="送出"> <input type="hidden"
						name="action" value="listGoods_ByCompositeQuery">
				</FORM>
			</li>
		</ul>

		<br>
		<h3>商品管理</h3>

		<ul>
			<li><a
				href='<%=request.getContextPath()%>/front-end/goods/addGoods.jsp'>Add</a>
				a new Goods.</li>
		</ul>
</body>
</html>