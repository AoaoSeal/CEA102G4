<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary.model.*"%>

<%-- 此測試頁，練習採用 EL 的寫法取值 --%>

<jsp:useBean id="itSvc" scope="page"
	class="com.itinerary.model.ItService" />

<!DOCTYPE html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ti Ba Mountain 登山社群平台</title>
</head>

<body>
<style>
	div.nav{
		margin-top:50px;
		margin-left:200px;
		font-size:22px;
	}
	input.myArea{
		border:0px;
		color: #337ab7;
		text-decoration: none;
		margin-top: 0px;
		outline:none;
		cursor: pointer; 	
	}
	
	form{
		display: inline;
	}
	input {
	     margin-top: 0px;
	}
</style>

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
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">


<style>
div .jumbotron{
	background-image: url(/CEA102G4/resource/images/evan-sanchez-T22nibt5XvI-unsplash.jpg);
	background-size: cover;
	height: 470px;
	 background-attachment: fixed;
}
.bg-light {
    background-color: #f8f9fa7a!important;
}
.display-4 {
    margin-top: 80px;
    font-size: 3.5rem;
    font-weight: 300;
    line-height: 1.2;
}
</style>



	<div class="container-fluid">
		<div class="jumbotron jumbotron-fluid">
			<div class="container">
				<h1 class="display-4" style="text-align: center">TI BA MOUNTAIN
					熱門行程</h1>
				<p class="lead " style="text-align: center"></p>


<!-- 				<nav class="navbar navbar-expand-lg navbar-light bg-light"> -->
<!-- 										<a class="navbar-brand" href="#">商城主頁</a> -->
<!-- 					<button class="navbar-toggler" type="button" data-toggle="collapse" -->
<!-- 						data-target="#navbarSupportedContent" -->
<!-- 						aria-controls="navbarSupportedContent" aria-expanded="false" -->
<!-- 						aria-label="Toggle navigation"> -->
<!-- 						<span class="navbar-toggler-icon"></span> -->
<!-- 					</button> -->

<!-- 					<div class="collapse navbar-collapse" id="navbarSupportedContent"> -->
<!-- 						<ul class="navbar-nav mr-auto"> -->
							
<!-- 						</ul> -->

<!-- 					</div> -->
<!-- 				</nav> -->


<!-- 				<div class="row"> -->
					

					
<!-- 				</div> -->
			</div>
		</div>
	</div>
<!-- 每個front-end頁面都要有這行code -->
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<!-- 每個front-end頁面都要有這行code -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- <script -->
<!-- 	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style.css">
	
	<div></div>


<c:if test="${!empty errorMsgs}">
	<script>	
	$(document).ready(function() {
		$(".logoinpage").show();
	});
	</script>
</c:if> 
<style>
.selectTitle {
    width: 40%;
    margin-top: 40px;
    margin-left: 30%;
    text-align: center;
    font-size: 180%;
    display: flex;
}

.selectTitle .articleArt {

	min-width: 33%;
	border-right: 1px solid #ddd;

}

.selectTitle .followPeople {

	min-width: 33%;
	border-right: 1px solid #ddd ;
}

.selectTitle .myArticle {

	min-width: 34%;

}
.a1 {
    color: #111 !important;
    /* font-size: 2em; */
    font-weight: 300 !important;
}

</style>
	<style>

/* itbox */
.itbox input.submit {
	position: relative;
	background-color: #3394fb;
	margin-top: -5px;
	border: none;
	color: white;
	width: 100%;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.itbox {
	flex-wrap: wrap;
	margin-top: 40px;
	max-width: 1300px;
	margin: auto;
	display: flex;
	justify-content: left;
	flex-direction: row;
	flex-wrap: wrap;
	padding-left: 50px;
}

}
.itbox .bidboxtxt {
	width: 50%;
	max-height: 36px;
	background: #ff0157;
	display: flex;
	justify-content: center;
	flex-direction: row;
	flex-wrap: wrap;
	margin-left: 25px;
}

.itbox .bidboxtxt h3 {
	color: #fff;
	font-size: 1.5rem;
}

.itbox .box {
	background-color: white;
	float: top;
	padding-bottom: 20px;
	min-width: 500px;
	height: 260px;
	margin: 50px;
	border: 15px solid:#fff;
}

.itbox .box .imgBx {
	position: relative;
	height: 65%;
}

.itbox .box .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
/* 	width: 100%; */
/* 	height: 100%; */
/* 	object-fit: cover; */
}

.itbox .box .text {
	padding: 6px 0 5px;
}

.itbox .box .text h3 {
	font-size: 1.5rem;
	margin-left: 20px;
	font-weight: 400;
	color: #111;
}

.itbox .box .text h3 span {
	margin: 5px;
	font-size: 1rem;
	color: orange;
}

.itbox .box .text h4 {
    top: -20px;
    left: 270px;
    font-size: 1rem;
    position: relative;
    margin-left: 20px;
    font-weight: 400;
    color: #444;
    text-decoration:none !important;
}

.itbox .box .text h4 span {
	font-weight: 700;
	margin-left: 15px;
	font-size: 1.8rem;
	color: #ff0157;
}

.itbox .box .text h5 {margin-left: 20px !important;width: 300px;color: #444;}

.itbox .box .text h5 span {
	margin-left: 10px;
	font-size: 2rem;
	font-weight: 800;
	color: orange;
}

.itbox .box .but {
	/* 	margin-top: 6%; */
	
}

.itbox .box .but button {
	background-color: #fff0;
	border: none;
	color: white;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.itbox .heart button, .memimgBx button {
	background-color: #fff0;;
	border: 0px;
	border-radius: 50%;
}

.itbox .box .memimgBx {
   position: absolute;
    z-index: 999;
    margin: 10px;
}

.itbox .box .memimgBx .imgm {
	width: 70px;
	height: 70px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ff0157;
}

.itbox .box .heart {
    text-align: center;
    /* width: 50%; */
    margin-left: 450px;
    margin-top: 115px;
    position: absolute;
}

.itbox .box .heart p {
	padding-bottom: 0px;
}

.itbox .box .heart img {
	width: 30px;
	object-fit: cover;
}
</style>
<div id="artIndexPage">
	<div class="selectTitle">
		<div class="articleArt"><A class="a1"href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">熱門行程</a></div>
		<div class="followPeople"><A class="a1"href="${pageContext.request.contextPath}/front-end/leader/listAllLd.jsp">領隊介紹</a></div>
		<div class="myArticle"><A class="a1"href="<%= request.getContextPath()%>/front-end/registration_master/rm.do?action=getOne_For_Display_BymemId">我的專區</A></div>
	</div>
	
	<section class="menu" id="menu">
<!-- 		<div class="nav"> -->
<%-- 		  <a class="nav-link active" href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">熱門行程</a> --%>
<%-- 		  | <a class="nav-link" href="${pageContext.request.contextPath}/front-end/leader/listAllLd.jsp">領隊介紹</a> --%>
<%-- 		  | <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do?action=getOne_For_Display_BymemId"> --%>
<!-- 			<input type="hidden" name="action" value="getOne_For_Display_BymemId"> -->
<!-- 			<input type="submit" class="myArea" value="我的專區"> -->
<!-- 			</FORM> -->
<!-- 		</div> -->
		
		<div class="title">
<!-- 			<h2 class="titleText">熱門行程</h2> -->
<!-- 			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elit.</p> -->
		</div>

		<div class="itbox">
	
			<jsp:useBean id="ldSvc" scope="page"
				class="com.leader.model.LdService" />
			<c:forEach var="itVO" items="${itSvc.all}" varStatus="status">
				<div class="box" >
						
						<div class="memimgBx">

							
						
									<c:forEach var="ldVO" items="${ldSvc.all}">
										<c:if test="${itVO.ldNo==ldVO.ldNo}">

											<img class="imgm"
												src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
												alt="">
											<div class="memtext" style="display: none">
												<img class="textimg"
													src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
													alt="">
												<div class="memnick">
													<h5>${ldVO.ldName}</h5>

												</div>

												<div class="memstatus">
													<h5>領隊</h5>
												</div>
												<div class="memfollow">

													<button>
														<img
															src="${pageContext.request.contextPath}/resource/images/info.png"
															alt="">
													</button>

													<div class="heart2">
													
														<p class="pheart"></p>
														<img class="${ldVO.ldNo}" name="imgheart" src="">
													</div>
													
										</c:if>
									</c:forEach>
						</div></div>
						<div class="heart">
			<p class="pheart">0</p>
			<img class="${itVO.itNo}" name="imgheart" src="">
		</div>
						<A  href="<%=request.getContextPath()%>/front-end/itinerary/it.do?itNo=${itVO.itNo}&action=getOne_For_Display">
					
		</div>
		<div class="imgBx">
			<img
				src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${itVO.itNo}"
				alt="">
		</div>
		<div class="text" id="${itVO.itNo}">
			<div>
				<h3>${itVO.itName}</h3>
			</div>
<!-- 	<br> -->
<%-- 						<h3>${itVO.itName}</h3> --%>
						<h5>出發日:${itVO.itDate}</h5>
<%-- 						<h3>NT${itVO.itPrice}</h3> --%>
<!-- 					<br> -->
<!-- 			<h4 > -->
<!-- 				<span class="">即將競標</span> -->
<!-- 			</h4> -->
			<h5>
				目前出價 : NT$<span class="firstprice">${itVO.itPrice}</span>
			</h5>


		</div> 	
		

		</div>
		

		</a>
		
		
		
		
		
<!-- 				<div class="box"> -->
<%-- 				<A  href="<%=request.getContextPath()%>/front-end/itinerary/it.do?itNo=${itVO.itNo}&action=getOne_For_Display"> --%>
<!-- 					<div class="imgBx"> -->
<!-- 						<img -->
<%-- 							src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${itVO.itNo}" --%>
<!-- 							alt=""> -->
<!-- 					</div> -->
<!-- 					<div class="memimgBx"> -->
<!-- 						<button> -->
<!-- 							<img class="imgm" -->
<%-- 								src="${pageContext.request.contextPath}/resource/images/img_297675.png" --%>
<!-- 								alt=""> -->
<!-- 						</button> -->
<!-- 						<br> -->
<!-- 						<div class="heart"> -->
<!-- 							<p class="pheart">?</p> -->
<%-- 							<img class="${itVO.itNo}" name="imgheart" src="" > --%>
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 					<div class="text"> -->
<%-- 						<h3>${itVO.itName}</h3> --%>
<%-- 						<h4>出發日:${itVO.itDate}</h4> --%>
<%-- 						<h3>NT${itVO.itPrice}</h3> --%>
<!-- 					</div> -->
<!-- 					<div class="but"> -->
<!-- 						<FORM METHOD="post" -->
<%-- 							ACTION="<%=request.getContextPath()%>/front-end/itinerary/it.do"> --%>
<%-- 							<input type="hidden" name="itNo" value="${itVO.itNo}">  --%>
<!-- 							<input type="hidden" name="action" value="getOne_For_Display"> -->
<!-- 							<input class="submit"type="submit" value="查看詳情"> -->
<!-- 												<button>查看詳情</button> -->
<!-- 						</FORM> -->

<!-- 					</div> -->
<!-- 				</a></div> -->
				
			</c:forEach>
		</div>
	</section>
	
	
	
</body>

</html>