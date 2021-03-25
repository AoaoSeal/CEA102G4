<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.member.model.*"%>
	

<jsp:useBean id="GetFirstPrice" scope="page"
	class="com.all.GetFirstPrice" />
<jsp:useBean id="bidSvc" scope="page" class="com.bid.model.BidService" />
<!DOCTYPE html>
<html>
<html lang="zh-TW">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<head>

<title>Insert title here</title>
</head>
<body>
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
	background-image: url(/CEA102G4/resource/images/salmen-bejaoui-cerpzCd5amg-unsplash.jpg);
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
					競標</h1>
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
		// 		String uri = request.getRequestURI();
		String uri = request.getServletPath();
		String info = request.getQueryString();
		// 		System.out.println("jsp=" + uri + "/" + info);
		request.getSession().setAttribute("uri", uri);
		// 		System.out.println(info);
	%>
	<!-- 每個front-end頁面都要有這行code -->


	<!-- 	<script -->
	<!-- 		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
	<!-- 	<script -->
	<!-- 		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<div></div>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">正在競標</h2>

		</div>

		<div class="bidbox">
			<jsp:useBean id="itSvc" scope="page"
				class="com.itinerary.model.ItService" />
			<jsp:useBean id="ldSvc" scope="page"
				class="com.leader.model.LdService" />


			<c:forEach var="bidVO" items="${bidSvc.all}" varStatus="status">
				<c:if test="${bidVO.bidStatus==2}">
					<div class="box">
						
						<div class="memimgBx">

							<c:forEach var="itVO" items="${itSvc.all}">
								<c:if test="${itVO.itNo== bidVO.itNo}">
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
			<img class="${bidVO.bidNo}" name="imgheart" src="">
		</div>
						<A  href="<%=request.getContextPath()%>/front-end/bid/bid.do?bidNo=${bidVO.bidNo}&action=getOne_For_Display">
					
		</div>
		<div class="imgBx">
			<img
				src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${bidVO.itNo}"
				alt="">
		</div>
		<div class="text" id="${bidVO.bidNo}">
			<div>
				<h3>${itVO.itName}</h3>
			</div>
			<c:set var="string1" value="${bidVO.bidTimestart}" />
			<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
			<c:set var="string3" value="${bidVO.bidTimeend}" />
			<c:set var="string4" value="${fn:substringBefore(string3,'.0')}" />
			<input type="hidden" class="bidTimestart" value="${string2}">
			<input type="hidden" class="bidTimeend" value="${string4}">

			<h4 >
				剩餘時間<span class="timeout">00:00:00</span>
			</h4>
			<h5>
				目前出價 : NT $<span class="firstprice">${bidVO.bidPricestart}</span>
			</h5>


			</c:if>
			</c:forEach>

		</div>
		

		</a>
		</div>
		</c:if>


		</c:forEach>


		</div>
		<hr class="hr">
		<div class="title">
			<h2 class="titleText">即將開始</h2>

		</div>



		<div class="bidbox">
			<c:forEach var="bidVO" items="${bidSvc.all}" varStatus="status">
				<c:if test="${bidVO.bidStatus==1}">

					<div class="box" style="background-color: #ddd;">
						
						<div class="memimgBx">

							<c:forEach var="itVO" items="${itSvc.all}">
								<c:if test="${itVO.itNo== bidVO.itNo}">
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
			<img class="${bidVO.bidNo}" name="imgheart" src="">
		</div>
						<A  href="<%=request.getContextPath()%>/front-end/bid/bid.do?bidNo=${bidVO.bidNo}&action=getOne_For_Display">
					
		</div>
		<div class="imgBx">
			<img
				src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${bidVO.itNo}"
				alt="">
		</div>
		<div class="text" id="${bidVO.bidNo}">
			<div>
				<h3>${itVO.itName}</h3>
			</div>
			<c:set var="string1" value="${bidVO.bidTimestart}" />
			<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
			<c:set var="string3" value="${bidVO.bidTimeend}" />
			<c:set var="string4" value="${fn:substringBefore(string3,'.0')}" />
			<input type="hidden" class="bidTimestart" value="${string2}">
			<input type="hidden" class="bidTimeend" value="${string4}">

			<h4 >
				<span class="">即將競標</span>
			</h4>
			<h5>
				目前出價 : NT $<span class="firstprice">${bidVO.bidPricestart}</span>
			</h5>


			</c:if>
			</c:forEach>

		</div>
		

		</a>
		</div>
		</c:if>


		</c:forEach>


		</div>
	</section>

	<style>

/* bidbox */
.bidbox input.submit {
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

.bidbox {
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
.bidbox .bidboxtxt {
	width: 50%;
	max-height: 36px;
	background: #ff0157;
	display: flex;
	justify-content: center;
	flex-direction: row;
	flex-wrap: wrap;
	margin-left: 25px;
}

.bidbox .bidboxtxt h3 {
	color: #fff;
	font-size: 1.5rem;
}

.bidbox .box {
	background-color: white;
	float: top;
	padding-bottom: 20px;
	min-width: 500px;
	height: 260px;
	margin: 50px;
	border: 15px solid:#fff;
}

.bidbox .box .imgBx {
	position: relative;
	height: 45%;
}

.bidbox .box .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
/* 	width: 100%; */
/* 	height: 100%; */
/* 	object-fit: cover; */
}

.bidbox .box .text {
	padding: 6px 0 5px;
}

.bidbox .box .text h3 {
	font-size: 1.5rem;
	margin-left: 20px;
	font-weight: 400;
	color: #111;
}

.bidbox .box .text h3 span {
	margin: 5px;
	font-size: 1rem;
	color: orange;
}

.bidbox .box .text h4 {
    top: -20px;
    left: 270px;
    font-size: 1rem;
    position: relative;
    margin-left: 20px;
    font-weight: 400;
    color: #444;
    text-decoration:none !important;
}

.bidbox .box .text h4 span {
	font-weight: 700;
	margin-left: 15px;
	font-size: 1.8rem;
	color: #ff0157;
}

.bidbox .box .text h5 {margin-left: 20px !important;width: 300px;color: #444;}

.bidbox .box .text h5 span {
	margin-left: 10px;
	font-size: 2rem;
	font-weight: 800;
	color: orange;
}

.bidbox .box .but {
	/* 	margin-top: 6%; */
	
}

.bidbox .box .but button {
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

.bidbox .heart button, .memimgBx button {
	background-color: #fff0;
	border: 0px;
	border-radius: 50%;
}

.bidbox .box .memimgBx {
   position: absolute;
    z-index: 999;
    margin: 10px;
}

.bidbox .box .memimgBx .imgm {
	width: 70px;
	height: 70px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ff0157;
}

.bidbox .box .heart {
    text-align: center;
    /* width: 50%; */
    margin-left: 450px;
    margin-top: 115px;
    position: absolute;
}

.bidbox .box .heart p {
	padding-bottom: 0px;
}

.bidbox .box .heart img {
	width: 30px;
	object-fit: cover;
}
</style>
	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	<!--   <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="http://jqueryui.com/resources/demos/style.css">

	<script>
	

		$(document).ready(function() {
// 			$(".memimgBx .imgm").click(function() {
// 				$(".memtext").not($(this).next(".memtext")).hide("fast");
// 				$(this).next(".memtext").toggle("fast");

// 			});
			
						
				$(".text").each(function() {
					let id =$(this).attr("id");
					let start = $(this).children(".bidTimestart").val();
					let end = $(this).children(".bidTimeend").val();

					    var time = new Date();
					    var nowTime = time.getTime(); 
					    var time3 = new Date(start);
					    var time2 = new Date(end);
					    
					    var endTimeget = time2.getTime();
					    var endtimestatus = true;
	if(nowTime>endTimeget){
		endtimestatus = false;
		
		}
					    var startTimeget = time3.getTime();
					    
					var thistimeout = $(this).find(".timeout");
					var firstprice = $(this).find(".firstprice");
				

					if(nowTime >= startTimeget){
// 						console.log("488有經過");
// 						console.log(id);
						 $.ajax({
								url : PageContext + "/OpenBid.do",
								type : "POST",
								dataType : 'text',
								
								data : {
									bid_no : id,
									endtime:endtimestatus,
								},
								success : function(data) {

									
								}


					});
						
						 //進來時先做一次計時的裡面要做的事情
						 var oldprice = firstprice.html();
							var time = new Date();
						    var nowTime = time.getTime(); 
						    var time2 = new Date(end);
						    
						    var endTimeget = time2.getTime();
	
						    var offsetTime = (endTimeget - nowTime) / 1000;
						    var sec = parseInt(offsetTime % 60);
						    var min = parseInt((offsetTime / 60) % 60);
						    var hr = parseInt(offsetTime / 60 /60);
						    
						    if(parseInt(hr+min+sec)<=0){
								
								window.clearInterval(timeoutID);
								clearTimeout(setTimeout);
								var str =  "競標結束";
								thistimeout.html(str);
							    
							    
						    }else{
							    							    
							    if(sec.toString().length==1){
							    	
							    	sec ="0"+sec
							    }
								if(min.toString().length==1){
							    	
									min ="0"+min
							    }
								if(hr.toString().length==1){
							    	
									hr ="0"+hr
								    }
								 var str = hr + ":" + min + ":" + sec;

								 thistimeout.html(str);
					

								  $.ajax({
											url : PageContext + "/GetFirstPrice.do",
											type : "POST",
											dataType : 'text',
											
											data : {
												bid_no : id,
											},
											success : function(data) {
												if(parseInt(data)>parseInt(oldprice)){

													firstprice.animate({color:"#04ff00"},100);
													firstprice.html(data).animate({color:"#ffa500"},'slow');

												}
												
											}
								});
								  
						    } 
						 
						 
						    //進來時先做一次計時的裡面要做的事情
						    
						   
						 
						
						
						
						var timeoutID = window.setInterval(function() {
							var oldprice = firstprice.html();
							var time = new Date();
						    var nowTime = time.getTime(); 
						    var time2 = new Date(end);
						    
						    var endTimeget = time2.getTime();
	
						    var offsetTime = (endTimeget - nowTime) / 1000;
						    var sec = parseInt(offsetTime % 60);
						    var min = parseInt((offsetTime / 60) % 60);
						    var hr = parseInt(offsetTime / 60 /60);
						    
						    if(parseInt(hr+min+sec)<=0){
								
								window.clearInterval(timeoutID);
								clearTimeout(setTimeout);
								var str =  "競標結束";
								thistimeout.html(str);
							    
							    
						    }else{
							    
							    
							    if(sec.toString().length==1){
							    	
							    	sec ="0"+sec
							    }
								if(min.toString().length==1){
							    	
									min ="0"+min
							    }
								if(hr.toString().length==1){
							    	
									hr ="0"+hr
								    }
								 var str = hr + ":" + min + ":" + sec;
// 								 console.log("time:="+str);
								 thistimeout.html(str);
// 								 console.log(firstprice.html());

// 								  $.ajax({
// 											url : PageContext + "/GetFirstPrice.do",
// 											type : "POST",
// 											dataType : 'text',
											
// 											data : {
// 												bid_no : id,
// 											},
// 											success : function(data) {
// // 												console.log(parseInt(data)+"=="+parseInt(oldprice));

// 												if(parseInt(data)>parseInt(oldprice)){
													
// 													firstprice.animate({color:"#04ff00"},100);
// 													firstprice.html(data).animate({color:"#ffa500"},'slow');
													

// 												}
												
// 											}


// 								});
								  
						    } 
								  
						    
						
						}, 1000);
					
						var timeoutID2 = window.setInterval(function() {
							var oldprice = firstprice.html();
// 							console.log("刷新");
								  $.ajax({
											url : PageContext + "/GetFirstPrice.do",
											type : "POST",
											dataType : 'text',
											
											data : {
												bid_no : id,
											},
											success : function(data) {
// 												console.log(parseInt(data)+"=="+parseInt(oldprice));

												if(parseInt(data)>parseInt(oldprice)){
													
													firstprice.animate({color:"#04ff00"},100);
													firstprice.html(data).animate({color:"#ffa500"},'slow');
													

												}
												
											}


								});
								  
						    
								  
						    
						
						}, 3000);    
						    
						    
						    
						    
						    
						    
					
					  
				}else{
					
					window.clearInterval(thistimeout);
					clearTimeout(setTimeout);
					var str =  "即將開始";
					thistimeout.html(str);
					
				}
				
				
					
				
			});
		
		});
// 		window.onload(){ if(location.href.indexOf('#reloaded')==-1){ location.href=location.href+"#reloaded"; location.reload(); } } 
// 		$(function(){ if($.cookie("refresh")!="no"){ setTimeout(function(){ window.location.reload(); 
		$(window).on('unload', function(){
			window.clearInterval(timeoutID2);
			window.clearInterval(timeoutID);
			clearTimeout(setTimeout);
			disconnect();
		});	

		
		
		

	</script>
</body>
</html>