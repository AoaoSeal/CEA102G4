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
	<script>
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


	<br>
	<br>
	<br>
	<br>
	<section class="menu" id="menu">

		<div class="col-md-6 w3_agileits_contact_grid_right">
			<h2 class="w3_agile_header">
				檢舉<span>賣家</span>
			</h2>

			<form method="post"
				ACTION="<%=request.getContextPath()%>/front-end/srep/srep.do"
				name="form1" enctype="multipart/form-data">
				<span class="input input--ichiro"> <input
					class="input__field input__field--ichiro" type="text" id="input-25"
					name="mem_id" value="${memberVO.memId}" readonly> <label
					class="input__label input__label--ichiro" for="input-25"> <span
						class="input__label-content input__label-content--ichiro"><h4>會員編號</h4></span>
				</label>
				</span> <span class="input input--ichiro"> <input
					class="input__field input__field--ichiro" type="text" id="input-26"
					name="or_no" value="<%=srepVO.getOr_no()%>" readonly />
					<label class="input__label input__label--ichiro" for="input-26">
						<span class="input__label-content input__label-content--ichiro"><h4>訂單編號</h4></span>
				</label>
				</span>
					<input type="hidden" name="srep_status" value="<%=(srepVO==null)? "0": srepVO.getSrep_status()%>">
				
				<div class="container">
				
				<span class="input input--ichiro"> <label for="input">商品圖片</label>
					<td style="width: 30em height: 30em"><input type="file"
						id="srep_mediumblob" name="srep_mediumblob" style="display: none"
						accept="image/png, image/jpeg" /> <img width="150" height="150"
						id="imgs"
						src="
					<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
						${pageContext.request.contextPath}/back-end/srep/img/noImage.jpg
					</c:if>
					<c:if test="${srepVO.srep_mediumblob!=null && !empty srepVO.srep_mediumblob}">
						data:image/png;base64,${srepVO.srep_mediumblob}
					</c:if>"
						onclick="myfunction1()"></td>
				</span>
					<div>
						<br style="clear: both">
						<div class="form-group  ">
							<label id="messageLabel" for="message">檢舉事由</label>
							<textarea class="form-control input-sm " type="textarea" name="srep_text" required
								id="message"  maxlength="140" rows="7"><%=(srepVO==null)? "0": srepVO.getSrep_text()%></textarea>
							<span class="help-block"><p id="characterLeft"
									class="help-block "></p></span>
						</div>
						<br style="clear: both">
						<div class="form-group col-md-2">
							<button class="form-control input-sm btn btn-success "
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
	<div>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
	</div>

</body>


</html>