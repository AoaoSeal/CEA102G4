<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="allcontent">
		<p class="membertitle">訊息通知</p>

		<br>
		<hr>
		<br>

	</div>
	<!-- 	<div class="allcontent"> -->
	<!-- 		<ul class="membernavigation"> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="10">會員</a></li> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="12">領隊</a></li> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="13">行程</a></li> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="20">競標</a></li> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="25">商品</a></li> -->
	<!-- 			<li><a href="javascript:" name="allfollow" class="16">文章</a></li> -->
	<!-- 		</ul> -->

	<!-- 	</div> -->
	<!-- 	<hr> -->
	<style>
.allcontentBox .messagebox {
    position: relative;
	min-width: 400px;
	max-width: 150px;
	/* width: 150px; */
	height: 190px;
	margin: 15px;
	border: 15px solid:#fff;
	box-shadow: 0 5px 35px rgb(0 0 0/ 8%);
	border: 1px solid #66666638;
}

.allcontentBox .messagebox .imgBx {
	margin: 10px;
	position: relative;
	width: 140px;
	height: 140px;
	float: left;
}

.allcontentBox .messagebox .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.allcontentBox .messagebox .text {
	padding: 15px 0 5px;
}

.allcontentBox .messagebox .text h3 {
	margin-left: 20px;
	font-weight: 400;
	width: 500px;
	color: #111;
}

.allcontentBox .messagebox .text h4 {
	margin-left: 20px;
	font-weight: 400;
	color: #444;
}

.allcontentBox .messagebox .but {
	/* margin: 10px; */
	/* float: right; */
	/* left: 0px; */
	min-width: 84px;
	margin-left: 300px;
	/* position: fixed; */
	margin-top: 10px;
}

.allcontentBox .messagebox  button {
	background-color: #3394fb;
	width: 40%;
	color: white;
	padding: 8px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	margin-left: 30%;
	font-size: 16px;
	margin-top: 10px;
	cursor: pointer;
	border: none;
}

.allcontentBox .messagebox  button a {
	color: white;
}
.allcontentBox .messagebox  h5 {
    position: absolute;
    bottom: 5px;
    font-weight: 500;
    left: 260px;
}
</style>
	<div class="allcontentBox">
		<jsp:useBean id="messageSvc" scope="page"
			class="com.message.model.MessageService" />
		<c:forEach var="messageVO" items="${messageSvc.all}"
			varStatus="status">
			<c:if test="${messageVO.memId == memberVO.memId}">
				<c:set var="string1" value="${messageVO.messageC}" scope="session" />
				<c:set var="string2" value="${fn:substring(string1,0,2)}" />
				<c:if test="${string2 == 20}">


					<div class="messagebox">
						<!-- 			<div class="imgBx"> -->
						<!-- 				<img -->
						<!-- 					src="/CEA102G4/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id=1001"> -->
						<!-- 			</div> -->
						<div class="text">
							${messageVO.messageContain}
<c:set var="string1" value="${messageVO.messageTime}" scope="session"/>
					<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
							<h5>${string2}</h5>
						</div>
						<!-- 			<div class="but"> -->

						<!-- 			</div> -->
					</div>
				</c:if>
			</c:if>
		</c:forEach>
	</div>
</body>
</html>