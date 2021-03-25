<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.registration_master.model.*"%>
<%@ page import="com.registration_detail.model.*"%>
<%@ page import="java.util.*"%>
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
}
	div.nav{
		margin-top:150px;
		margin-left:300px;
		font-size:22px;
	}
div.contentRm {
    box-shadow: 0 4px 8px 0 rgb(0 0 0 / 20%), 0 6px 20px 0 rgb(0 0 0 / 19%);
    margin-bottom: 100px;
    background-color: #fff;
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
<%	List list = (List) request.getAttribute("list"); %>

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
<!-- 		<div class="nav"> -->
<%-- 		  <a class="nav-link active" href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">熱門行程</a> --%>
<%-- 		  | <a class="nav-link" href="${pageContext.request.contextPath}/front-end/leader/listAllLd.jsp">領隊介紹</a> --%>
<%-- 		  | <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do"> --%>
<!-- 			<input type="hidden" name="action" value="getOne_For_Display_BymemId"> -->
<!-- 			<input type="submit" class="myArea" value="我的專區"> -->
<!-- 			</FORM> -->
<!-- 		</div> -->
		
		<div class="contentRm">
		<div class="formRm">
			<table>								
				<thead>												
					<tr>
						<th>報名日期</th>
						<th>行程</th>
						<th>訂單編號</th>
						<th>審核進度</th>
						<th>查看明細</th>
						<th>回饋評價</th>
					</tr>
				</thead>

					<c:forEach var="rmVO" items="${list}">
					<tr>					
						<th>${rmVO.rmDate}</th>
						<th>${rmVO.itName}</th>
						<th>${rmVO.rmNo}</th>
						<c:set var="status" value="${rmVO.rmStatus}" />
							<c:choose>
						    <c:when test="${rmVO.rmStatus==0}">
						       <input type="hidden" id="rmStatus" value="0">
						       <th style="color:red;">報名成功</th>						       
						    </c:when>
						    <c:when test="${rmVO.rmStatus==1}">
						       <input type="hidden" id="rmStatus" value="1">
						       <th style="color:red;">行程完成</th>
						       
						    </c:when>

						     <c:when test="${rmVO.rmStatus==2}">
						       <input type="hidden" id="rmStatus" value="3">						     
						       <th style="color:red;">取消參加</th>

						    </c:when>

							</c:choose>
						<th><FORM  METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
							<input type="hidden" name="rmNo" value="${rmVO.rmNo}">
							<input type="hidden" name="action" value="getOneByRmNo">
							<input type="submit" value="查看明細">					
							</FORM></th>
						<c:choose>
						<c:when test="${rmVO.rmStatus==0 || rmVO.rmStatus==2}"> 
						<th>
							<FORM  METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
							<input type="hidden" name="rmNo" value="${rmVO.rmNo}">
							<input type="hidden" name="action" value="">
							<input type="submit" value="回饋評價" disabled>					
							</FORM>
<!-- 						<input id="btnFeedback" type="submit" value="回饋評價" disabled> -->
						</th>
						</c:when>
						<c:otherwise>
						<th>
							<FORM  METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
							<input type="hidden" name="rmNo" value="${rmVO.rmNo}">
							<input type="hidden" name="action" value="">
							<input type="submit" id="btnFeedback" value="回饋評價">					
							</FORM>
<!-- 						<input id="btnFeedback" type="submit" value="回饋評價"> -->
						</th>
						</c:otherwise>
						</c:choose>
					</tr>

					</c:forEach>
							
			</table>	
		</div>
		</div>
<!-- 新增類別modal start -->  	
<!--  <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true" > -->
<!--         <div class="modal-dialog modal-lg"> -->
<!--             <div class="modal-content"> -->
<!-- 	 			<div class="modal-header"> -->
<!-- 	                <button id="btn" type="button" class="close" data-dismiss="modal" aria-hidden="true">X</button> -->
<!-- 	                <h3 class="modal-title" id="myModalLabel">領隊回饋評價</h3> -->
<!-- 	            </div>                    -->
                
<!--                 <div class="modal-body">  -->
<!-- 					content start  -->
<!-- 					<div id="modalViewAdd"> -->
<%-- <jsp:include page="/front/feedback.jsp" /> --%>
<!-- 					content end  -->
<!--                 </div> -->
<!--                 <div class="modal-footer"> -->

<!--                 </div> -->
<!--             </div> -->
<!--         </div> -->
<!--     </div> -->
<!--  </div>   -->
<!-- 新增類別modal end -->  
<script>
// $("#btnFeedback").click(function(){
// 	$("#addModal").modal("show")	
// });
</script>
</body>
</html>