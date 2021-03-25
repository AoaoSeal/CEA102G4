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
	<%-- 錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<script type="application/x-javascript">
		
		
		
		
		 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } 
	
	
	
	
	</script>
	<!-- //for-mobile-apps -->
	<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
		media="all" />
	<link href="css/style.css" rel="stylesheet" type="text/css" media="all" />
	<!-- font-awesome icons -->
	<link href="css/font-awesome.css" rel="stylesheet">
	<!-- //font-awesome icons -->
	<!-- js -->
	<script src="js/jquery-1.11.1.min.js"></script>
	<!-- //js -->
	<link
		href='http://fonts.googleapis.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900,900italic'
		rel='stylesheet' type='text/css'>
	<link
		href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,300italic,400italic,600,600italic,700,700italic,800,800italic'
		rel='stylesheet' type='text/css'>

	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$(".scroll").click(function(event) {
				event.preventDefault();
				$('html,body').animate({
					scrollTop : $(this.hash).offset().top
				}, 1000);
			});
		});
	</script>
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
		<div class="col-md-6 w3_agileits_contact_grid_right">
			<h2 class="w3_agile_header">
				新增<span>商品</span>
			</h2>
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
			<form method="post"
				ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
				name="form1" enctype="multipart/form-data">
				<jsp:useBean id="memSvc" scope="page"
					class="com.member.model.MemberService" />
				<c:forEach var="memVO" items="${memSvc.all}">
				</c:forEach>

				<span class="input input--ichiro"> <input
					class="input__field input__field--ichiro" type="text" id="input-25"
					value="${memberVO.memName}" readonly> <label
					class="input__label input__label--ichiro" for="input-25"> <span
						class="input__label-content input__label-content--ichiro"><h4>會員名稱</h4></span>
				</label> <input type="hidden" name="mem_id" value="${memberVO.memId}">
				</span> <span class="input input--ichiro"> <input
					class="input__field input__field--ichiro" type="text" id="input-26"
					name="gd_name" required
					value="<%=(goodsVO == null) ? "" : goodsVO.getGd_name()%>" /> <label
					class="input__label input__label--ichiro" for="input-26"> <span
						class="input__label-content input__label-content--ichiro"><h4>商品名稱</h4></span>
				</label>
				</span> <span> <jsp:useBean id="gcSvc" scope="page"
						class="com.gc.model.GcService" /> <span
					class="input input--ichiro"> <input
						class="input__field input__field--ichiro" type="text"
						id="input-27" name="gd_price" required
						value="<%=(goodsVO == null) ? "" : goodsVO.getGd_price()%>">
						<label class="input__label input__label--ichiro" for="input-27">
							<span class="input__label-content input__label-content--ichiro"><h4>商品價格</h4>
						</span>
					</label>
				</span>

					<div class="container">
						<span>
							<p>
								<label for="select">商品類別:</label> <select id="select"
									name="gc_no"required>
									<option value="">選擇類別</option>
									<c:forEach var="gcVO" items="${gcSvc.all}">
										<option value="${gcVO.gc_no}"
											${(goodsVO.gc_no==gcVO.gc_no)? 'selected':'' }>${gcVO.gc_name}
									</c:forEach>
								</select>
							</p>
						</span> <span>
							<p>
								<label for="input">商品數量 :</label> <input type='button' value='-'
									class='qtyminus' field='gd_qty' /> <input type='text'
									name='gd_qty' required
									value="<%=(goodsVO == null) ? 1 : goodsVO.getGd_qty()%>"
									class='qty' /> <input type='button' value='+' class='qtyplus'
									field='gd_qty'  />
							</p>
						</span> <span>
							<p>
								<label for="input">商品狀態:</label> <input type="radio"
									name="gd_status" id="status1" value="0"
									<%=(goodsVO == null) ? "checked" : (goodsVO.getGd_status() == 0) ? "checked" : ""%>>全新
								<input type="radio" name="gd_status" id="status2" value="1"
									<%=(goodsVO == null) ? "" : (goodsVO.getGd_status() == 1) ? "checked" : ""%>>二手
							</p>
						</span> <span>
							<p>
								<label for="input">上下架狀態:</label> <input type="radio"
									name="gd_shelf" id="shelf1" value="0"
									<%=(goodsVO == null) ? "checked" : (goodsVO.getGd_shelf() == 0) ? "checked" : ""%>>下架
								<input type="radio" name="gd_shelf" id="shelf2" value="1"
									<%=(goodsVO == null) ? "" : (goodsVO.getGd_shelf() == 1) ? "checked" : ""%>>上架
							</p>
						</span> <span class="input input--ichiro">
							<label for="input">商品圖片:</label> <input type="file"
						id="gd_mediumblob" name="gd_mediumblob" style="display: none"
						accept="image/png, image/jpeg" /> <img id="imgs" height="150"
						width="150"
						src="${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg"
						onclick="myfunction1()">
						</span>
						<div>
							<br style="clear: both">
							<div class="form-group  ">
								<label id="messageLabel" for="message">商品描述</label>
								<textarea class="form-control input-sm " type="textarea"
									name="gd_text" required id="message" placeholder="請輸入商品描述"
									maxlength="140" rows="7"><%=(goodsVO == null) ? "": goodsVO.getGd_text()%></textarea>
								<span class="help-block"><p id="characterLeft"
										class="help-block "></p></span>
							</div>
							<br style="clear: both">
							<div class="form-group col-md-2">
								<button class="form-control input-sm btn btn-success disabled"
									id="btnSubmit" name="btnSubmit" type="submit" value="確認送出"
									style="height: 35px">Send</button>

							</div>
						</div>

						<!-- 					<p> -->
						<!-- 						<label for="textarea"><h3>檢舉事由:</h3></label> -->
						<!-- 						<textarea id="textarea" rows="3" -->
						<!-- 							style="margin: 0px; width: 500px; height: 250px;" -->
						<!-- 							name="srep_text" required -->
						<%-- 							value="<%=(srepVO == null) ? "" : srepVO.getSrep_text()%>"><%=(srepVO == null) ? "" : srepVO.getSrep_text()%></textarea> --%>
						<!-- 					</p> -->
						<div>
							<input type="hidden" name="action" value="insert">
							<!-- 						<input type="submit" value="確認送出">  -->
							<!-- 						<input type="reset" value="重設"> -->
						</div>
			</form>
		</div>
	</section>
	<script>
		$(document).ready(function() {
			$('#characterLeft').text('500 characters left');
			$('#message').keyup(function() {
				var max = 500;
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
	<div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
	</div>
</body>
</html>