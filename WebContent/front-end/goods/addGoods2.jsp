<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.goods.model.*"%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
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
			<h2 class="titleText">新增商品</h2>
		</div>
		<script>
			$(function() {
				// This button will increment the value
				$('.qtyplus').click(
						function(e) {
							// Stop acting like a button
							e.preventDefault();
							// Get the field name
							fieldName = $(this).attr('field');
							// Get its current value
							var currentVal = parseInt($(
									'input[name=' + fieldName + ']').val());
							// If is not undefined
							if (!isNaN(currentVal)) {
								// Increment
								$('input[name=' + fieldName + ']').val(
										currentVal + 1);
							} else {
								// Otherwise put a 0 there
								$('input[name=' + fieldName + ']').val(1);
							}
						});
				// This button will decrement the value till 0
				$(".qtyminus").click(
						function(e) {
							// Stop acting like a button
							e.preventDefault();
							// Get the field name
							fieldName = $(this).attr('field');
							// Get its current value
							var currentVal = parseInt($(
									'input[name=' + fieldName + ']').val());
							// If it isn't undefined or its greater than 0
							if (!isNaN(currentVal) && currentVal > 1) {
								// Decrement one
								$('input[name=' + fieldName + ']').val(
										currentVal - 1);
							} else {
								// Otherwise put a 0 there
								$('input[name=' + fieldName + ']').val(1);
							}
						});
			});
			function myfunction1() {
				$('#gd_mediumblob').trigger('click');
			}

			function init1() {

				let myfile = document.getElementById('gd_mediumblob');
				myfile.addEventListener('change', function(e) {
					let files = e.target.files;
					console.log("有觸發2");
					if (true) {
						for (let i = 0; i < files.length; i++) {

							let file = files[i];
							if (file.type.indexOf('image') > -1) {

								let reader = new FileReader();

								reader.addEventListener('load', function(e) {

									let result = e.target.result;
									let imgs = document.getElementById('imgs');
									imgs.setAttribute('src', result);
								})
								reader.readAsDataURL(file);
							} else {
								alert('請上傳圖片')
							}
						}
					}

				})

			}

			$(document).ready(function() {
				init1();
			});
		</script>

		<jsp:useBean id="memSvc" scope="page"
			class="com.member.model.MemberService" />
		<c:forEach var="memVO" items="${memSvc.all}">
		</c:forEach>
		<h3>
			<td>會員: ${memberVO.memName} 您好!</td>
			</td>
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
		<form METHOD="post"
			ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
			name="form1" enctype="multipart/form-data">
			<fieldset>
				<legend>商品新增:</legend>

				<p>
					<label for="input">商品名稱</label> <input type="text"
						placeholder="商品名稱:" name="gd_name"
						value="<%=(goodsVO == null) ? "" : goodsVO.getGd_name()%>">
				</p>
				<%-- 		<input type="hidden" name="mem_id" value="<%=goodsVO.getMem_id()%>"> --%>
				<input type="hidden" name="mem_id" value="${memberVO.memId}">
				<jsp:useBean id="gcSvc" scope="page" class="com.gc.model.GcService" />
				<p>
					<label for="select">商品類別:</label> <select id="select" name="gc_no">
						<option value="">選擇類別</option>
						<c:forEach var="gcVO" items="${gcSvc.all}">
							<option value="${gcVO.gc_no}"
								${(goodsVO.gc_no==gcVO.gc_no)? 'selected':'' }>${gcVO.gc_name}
						</c:forEach>
					</select>
				</p>
				<p>
					<label for="input">商品價格:</label> <input type="text"
						placeholder="商品價格:" name="gd_price"
						value="<%=(goodsVO == null) ? "" : goodsVO.getGd_price()%>">
				</p>
				<p>
					<label for="input">數 量 :</label> <input type='button' value='-'
						class='qtyminus' field='gd_qty' /> <input type='text'
						name='gd_qty'
						value="<%=(goodsVO == null) ? 1 : goodsVO.getGd_qty()%>"
						class='qty' /> <input type='button' value='+' class='qtyplus'
						field='gd_qty' />

				</p>
				<p>
					<label for="input">商品狀態:</label> <input type="radio"
						name="gd_status" id="status1" value="0"
						<%=(goodsVO == null) ? "checked" : (goodsVO.getGd_status() == 0) ? "checked" : ""%>>全新
					<input type="radio" name="gd_status" id="status2" value="1"
						<%=(goodsVO == null) ? "" : (goodsVO.getGd_status() == 1) ? "checked" : ""%>>二手
				</p>
				<p>
					<label for="input">上下架狀態:</label> <input type="radio"
						name="gd_shelf" id="shelf1" value="0"
						<%=(goodsVO == null) ? "checked" : (goodsVO.getGd_shelf() == 0) ? "checked" : ""%>>下架
					<input type="radio" name="gd_shelf" id="shelf2" value="1"
						<%=(goodsVO == null) ? "" : (goodsVO.getGd_shelf() == 1) ? "checked" : ""%>>上架
				</p>

				<p>
					<label for="input">商品圖片:</label> <input type="file"
						id="gd_mediumblob" name="gd_mediumblob" style="display: none"
						accept="image/png, image/jpeg" /> <img id="imgs" height="150"
						width="150"
						src="${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg"
						onclick="myfunction1()">
				</p>
				<p>
					<label for="textarea">商品簡介:</label>
					<textarea id="textarea" rows="3"
						style="margin: 0px; width: 500px; height: 250px;" name="gd_text"
						value="<%=(goodsVO == null) ? "" : goodsVO.getGd_text()%>"><%=(goodsVO == null) ? "" : goodsVO.getGd_text()%></textarea>
				</p>
				<p>
					<input type="hidden" name="action" value="insert">
					<!-- 			<input type="hidden" name="gd_no"> -->
					<input type="submit" value="確認"> <input type="reset"
						value="重設">
				</p>

			</fieldset>
		</form>
</body>
</html>