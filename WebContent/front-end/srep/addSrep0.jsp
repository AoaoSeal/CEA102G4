<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.srep.model.*"%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
SrepVO srepVO = (SrepVO) request.getAttribute("srepVO");
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
			<h2 class="titleText">檢舉賣家</h2>
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
				$('#srep_mediumblob').trigger('click');
			}

			function init1() {

				let myfile = document.getElementById('srep_mediumblob');
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
			ACTION="<%=request.getContextPath()%>/front-end/srep/srep.do"
			name="form1" enctype="multipart/form-data">
			<fieldset>
				<legend>檢舉新增:</legend>
				<p>
					<label for="input">會員編號</label> <input type="text" id="input"
						name="mem_id" value="${memberVO.memId}" readonly>
				</p>

				<p>
					<label for="input">訂單編號</label> <input type="text" id="input"
						name="or_no" value="<%=request.getParameter("or_no")%>" readonly>
				</p>

				<p>
					<input type="hidden" name="srep_status" value="0">
				</p>
					
				<p>
					<label for="textarea">檢舉事由:</label>
					<textarea id="textarea" rows="3"
						style="margin: 0px; width: 500px; height: 250px;" name="srep_text"
						value="<%=(srepVO == null) ? "" : srepVO.getSrep_text()%>"><%=(srepVO == null) ? "" : srepVO.getSrep_text()%></textarea>
				</p>

				<p>
					<input type="hidden" name="action" value="insert"> <input
						type="hidden" name="srep_time"> <input type="submit"
						value="確認"> <input type="reset" value="重設">
				</p>

			</fieldset>
		</form>
</body>
</html>