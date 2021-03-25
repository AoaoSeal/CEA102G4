<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.grep.model.*"%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
GrepVO grepVO = (GrepVO) request.getAttribute("grepVO");
%>

<html>
<body>
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>

	<!------ Include the above in your HEAD tag ---------->
	<link
		href="https://fonts.googleapis.com/css?family=Oleo+Script:400,700"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css?family=Teko:400,700"
		rel="stylesheet">
	<link
		href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
		rel="stylesheet">
		
		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
		
		
	<style>
body {
	/*     background: -webkit-l inear-gradient(left, #0072ff, #00c6ff); */
	
}

.contact-form {
	background: #fff;
	margin-top: 10%;
	margin-bottom: 5%;
	width: 70%;
}

.contact-form .form-control {
	border-radius: 1rem;
}

.contact-image {
	text-align: center;
}

.contact-image img {
	border-radius: 6rem;
	width: 11%;
	margin-top: -3%;
	transform: rotate(29deg);
}

.contact-form form {
	padding: 14%;
}

.contact-form form .row {
	margin-bottom: -7%;
}

.contact-form h1 {
	margin-bottom: 8%;
	margin-top: -10%;
	text-align: center;
	color: #0062cc;
}

.contact-form .btnContact {
	width: 50%;
	border: none;
	border-radius: 1rem;
	padding: 1.5%;
	background: #dc3545;
	font-weight: 600;
	color: #fff;
	cursor: pointer;
}

.btnContactSubmit {
	width: 50%;
	border-radius: 1rem;
	padding: 1.5%;
	color: #fff;
	background-color: #0062cc;
	border: none;
	cursor: pointer;
}
</style>

	<section class="menu" id="menu">
		<!-- 		<div class="title"> -->
		<!-- 			<h2 class="titleText">檢舉商品</h2> -->
		<!-- 		</div> -->

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
			$('#grep_mediumblob').trigger('click');
		}

		function init1() {

			let myfile = document.getElementById('grep_mediumblob');
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


	<!------ Include the above in your HEAD tag ---------->

	<div class="container contact-form center" style="margin: 0px auto">
		<div class="contact-image">
			<img src="https://image.ibb.co/kUagtU/rocket_contact.png"
				alt="rocket_contact" />
		</div>
		<form method="post"
			ACTION="<%=request.getContextPath()%>/front-end/grep/grep.do"
			name="form1" enctype="multipart/form-data">
			<h1>檢舉商品</h1>
			<div class="row">
				<div class="col-md-6">
					<div class="form-group">
						<label for="input">會員編號</label> <input type="text" name="mem_id"
							value="${memberVO.memId}" readonly class="form-control" />
					</div>
					<div class="form-group">
						<label for="input">商品編號</label> <input type="text" name="gd_no"
							name="gd_no" value="<%=request.getParameter("gd_no")%>" readonly
							class="form-control" />
					</div>
					<input type="hidden" name="grep_status" value="0">
					<div class="form-group">
						<input type="hidden" name="action" value="insert"> <input
							type="hidden" name="grep_time"> <input class="btnContact"
							type="submit" value="確認"> 
<!-- 							<input class="btnContact" -->
<!-- 							type="reset" value="重設"> -->
					</div>
				</div>

				<div class="col-md-6">
					<div class="form-group">
						<label for="textarea">檢舉事由</label>
						<textarea id="message" name="grep_text" class="form-control input-sm "
							required placeholder="請簡述說明" style="width: 100%; height: 150px"  maxlength="140" 
							value="<%=(grepVO == null) ? "" : grepVO.getGrep_text()%>"><%=(grepVO == null) ? "" : grepVO.getGrep_text()%></textarea>
							<span class="help-block"><p id="characterLeft"
									class="help-block "></p></span>
					</div>
				</div>
			</div>
		</form>
	</div>
	</section>
	<script>
		$(document).ready(function() {
			$('#characterLeft').text('140 characters left');
			$('#message').keyup(function() {
				var max = 140;
				var len = $(this).val().length;
				if (len >= max) {
					$('#characterLeft').text('You have reached the limit');
					$('#characterLeft').addClass('red');
					$('#btnSubmit').addClass('disabled');
				} else {
					var ch = max - len;
					$('#characterLeft').text(ch + ' characters left');
					$('#btnSubmit').removeClass('disabled');
					$('#characterLeft').removeClass('red');
				}
			});
		});
	</script>
</body>
</html>