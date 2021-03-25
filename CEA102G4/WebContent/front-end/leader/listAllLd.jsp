<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.leader.model.*"%>

<jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
	
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					領隊介紹</h1>
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
<style>
.menu .content .box {
    height: 500px!important;
    border-radius: 20px!important;
}

.menu .content .box .imgBx img {
    width: 90%!important;
    height: 90%!important;
    margin-left: 15px!important;
    margin-top: 5px!important;
}

input.submit {
    margin-top: -1px!important;
    border: none!important;
    width: 100%!important;
    padding: 6px!important;
    text-align: left!important;
    text-decoration: none!important;
    display: inline-block!important;
    font-size: 16px!important;
    cursor: pointer!important;
    color:#000!important;
    background-color:#fff!important;
}
div.nav{
	margin-top:50px;
	margin-left:200px;
	font-size:22px;
}
input.submit:hover{text-decoration:underline!important;}

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
</style>
<!-- 每個front-end頁面都要有這行code -->
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<!-- 每個front-end頁面都要有這行code -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/styleLd.css">
	
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
<%-- 		  | <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do"> --%>
<!-- 			<input type="hidden" name="action" value="getOne_For_Display_BymemId"> -->
<!-- 			<input type="submit" class="myArea" value="我的專區"> -->
<!-- 			</FORM> -->
<!-- 		</div> -->
		<div class="title">
<!-- 			<h2 class="titleText">領隊介紹</h2> -->
<!-- 			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elit.</p> -->
		</div>

		<div class="content">
			<c:forEach var="ldVO" items="${ldSvc.all}" varStatus="status">
				
				<div class="box">
					<div class="imgBx">
						<img style="border-radius: 50%" src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}"
							alt="">
					</div>
<!-- 					<div class="memimgBx"> -->
<!-- 						<button> -->
<!-- 							<img class="imgm" -->
<%-- 								src="${pageContext.request.contextPath}/resource/images/img_297675.png" --%>
<!-- 								alt=""> -->
<!-- 						</button> -->
<!-- 						<br> -->
<!-- 					</div> -->
					<div class="text">
						<h3>${ldVO.ldName}</h3>
						<h4>經歷:${ldVO.ldExpr}</h4>
						<h3>評分${ldVO.ldScore}</h3>
						<jsp:useBean id="itSvc" scope="page" class="com.itinerary.model.ItService" />
							<c:forEach var="itVO" items="${itSvc.allbyLdNo}">			
		            			<c:if test="${itVO.ldNo==ldVO.ldNo}">
			            			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/itinerary/it.do">
<%-- 			            				<br><font color=#8B4513>　● ${itVO.itName}</font> --%>
			            				<input type="hidden" name="itNo" value="${itVO.itNo}"> 
										<input type="hidden" name="action" value="getOne_For_Display">
										<input class="submit"type="submit" value="　● ${itVO.itName}">
			         			    </FORM>
		         			    </c:if>
	     				   </c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</section>
</body>
</html>