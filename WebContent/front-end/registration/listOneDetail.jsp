<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.registration_master.model.*"%>
<%@ page import="com.registration_detail.model.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Ti Ba Mountain 登山社群平台</title>
</head>
<body>
<style>
input[type="submit"] {
    background-color: #3394fb;
    margin-top: 10px;
    border: none;
    color: white;
    width: 100px;
    padding: 8px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
    cursor: pointer;
}'
	div.nav{
		margin-top:150px;
		margin-left:300px;
		font-size:22px;
	}

div.contentRm {
    /* margin-top: 40px; */
    margin: auto;
    padding: 50px;
    position: relative;
    text-align: center;
    margin-bottom: 100px;
    width: 1150px;
    margin-top: 80px;
    /* margin-left: 30%; */
     /*border: 1px solid #333; */
    border-radius: 10px;
}
	table{
		font-size:20px;
		padding:5px;
		width: 100%;
	    text-align: center;
	    line-height: 1.5;
		
	}
	
	table > tr, th {
/* 	    border: 1px solid #666; */
		    padding: 15px 0 20px 0;
	    
	}
	table > thead > tr{
		background-color: #bebebe;
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
	     margin-top: 0px!important;
	}
</style>

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
<style>

	div.contentRm {
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%);
    margin-bottom: 100px;
    background-color: #fff;
}
	div.formRm{
		/*width: 1150px; */
    margin-top: 10px;
    /* margin-left: 370px; */
    border: 1px solid #333;
    border-radius: 10px;
	}
	table{
		font-size:20px;
		padding:5px;
		width: 100%;
	    text-align: center;
	    line-height: 1.5;
		
	}
	
	
	div.textRd{
		font-size:20px;
		margin-left:5px;
	}

	table > thead > tr{
		background-color: #bebebe;
	}
	input.rmStatus{
	margin-top: 0px;
	}
	
	div.nav{
		margin-top:150px;
		margin-left:300px;
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
					會員專區</h1>
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
<%	RmVO rmVO = (RmVO) request.getAttribute("rmVO"); %>

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
<!-- 	<div class="nav"> -->
<%-- 	  <a class="nav-link active" href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">熱門行程</a> --%>
<%-- 	  | <a class="nav-link" href="${pageContext.request.contextPath}/front-end/leader/listAllLd.jsp">領隊介紹</a> --%>
<%-- 	  | <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do"> --%>
<!-- 		<input type="hidden" name="action" value="getOne_For_Display_BymemId"> -->
<!-- 		<input type="submit" class="myArea" value="我的專區"> -->
<!-- 		</FORM> -->
<!-- 	</div> -->
	<div class="contentRm">	
		<div class="formRm">
			<table>
				<thead>
					<tr>
						<th>報名日期</th>
						<th>報名行程</th>
						<th>訂單編號</th>
						<th>審核進度</th>
						<th>報名人數</th>
						<th>總付款金額</th>
						<th>取消參加</th>
					</tr>
				</thead>
				<tbody>
					<tr>


						<th>${rmVO.rmDate}</th>
						<th>${rmVO.itName}</th>
						<th>${rmVO.rmNo}</th>
						<c:set var="status" value="${rmVO.rmStatus}"/>
							<c:choose>
						    <c:when test="${rmVO.rmStatus==0}">
						       <th style="color:red;">報名成功</th>
						    </c:when>
						    <c:when test="${rmVO.rmStatus==1}">
						       <th style="color:red;">行程結束</th>
						    </c:when>
						     <c:when test="${rmVO.rmStatus==2}">
						       <th style="color:red;">取消參加</th>
						    </c:when>

							</c:choose>

						<th>${rmVO.peoCount}</th>
						<th>$<%=rmVO.getItPrice()*rmVO.getPeoCount() %></th>						
						<c:choose>
						<c:when test="${rmVO.rmStatus==0}"> 
							<th>
								<FORM  METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
								<input type="hidden" name="rmNo" value="${rmVO.rmNo}">
								<input type="hidden" name="rmStatus" value="2">
								<input type="hidden" name="action" value="updateStatus">
								<input type="submit" class="rmStatus" value="取消參加">					
								</FORM>
							</th>
						</c:when>
						<c:otherwise>
							<th>
								<FORM  METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
								<input type="hidden" name="rmNo" value="${rmVO.rmNo}">
								<input type="hidden" name="rmStatus" value="2">
								<input type="hidden" name="action" value="updateStatus">
								<input type="submit" class="rmStatus" value="取消參加" disabled>					
								</FORM>
							</th>
						</c:otherwise>
						</c:choose>
							
					</tr>
					<tr>
						<th colspan="7"><br><hr style="border: 2px solid #333;"></th>
					</tr>
				</tbody>
			</table>
			<div class="textRd">▼參加者明細:</div>
			<table>								
				<thead>												
					<tr>
						<th>參加者姓名</th>
						<th>連絡電話</th>
						<th>出生日期</th>
						<th>緊急聯絡人姓名</th>
						<th>緊急連絡人電話</th>
					</tr>
				</thead>
					<jsp:useBean id="rdSvc" scope="page" class="com.registration_detail.model.RdService" />
					<c:forEach var="rdVO" items="${rdSvc.all}">
					<c:if test="${rdVO.rmNo==rmVO.rmNo}">
					<tr>
					
						<th>${rdVO.attName}</th>
						<th>${rdVO.attPhone}</th>
						<th>${rdVO.attBirth}</th>
						<th>${rdVO.emerName}</th>
						<th>${rdVO.emerPhone}</th>
					</tr>
					 </c:if>
					</c:forEach>							
			</table>	
			
<!-- 			<div class="textRd">▼回饋評價:</div> -->
<!-- 			<table>								 -->
<!-- 					<tr> -->
<!-- 						<th colspan="7"><br><hr style="border: 2px solid #333;"></th> -->
<!-- 					</tr> -->
<%-- 					<jsp:useBean id="rmSvc" scope="page" class="com.registration_master.model.RmService" /> --%>
<%-- 					<c:forEach var="rmVO" items="${rmSvc.all}"> --%>
<%-- 					<c:if test="${rdVO.rmNo==rmVO.rmNo}"> --%>
<!-- 					<tr>					 -->
<%-- 						<th>${rmVO.ldScore}</th> --%>
<%-- 						<th>${rmVO.fbText}</th> --%>
<!-- 					</tr> -->
<%-- 					 </c:if> --%>
<%-- 					</c:forEach>							 --%>
<!-- 			</table> -->
		</div>
	</div>
</body>
</html>