<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<style>
body {
	background-color: #ddd;
}
</style>
<!-- <link rel="stylesheet" type="text/css" -->
<%-- 	href="${pageContext.request.contextPath}/resource/css/style2.css"> --%>

<meta charset="UTF-8">
<title>${memberFunction}</title>
</head>
<body>
	<div class="indexcontent">
		
			<div class=divleft>
				<div class="memberimgm">
					<img class="imgm"
						src="${pageContext.request.contextPath}/${memberVO.allPic}" alt="">
					<div><br>
						<h3 class="membernick" style="width: 50%">${memberVO.memNick}</h3>

<%-- 						<h5 class="membernick">關注: ${memberVO.memNick}</h5> --%>
<%-- 						<h5 class="membernick">粉絲: ${memberVO.memNick}</h5> --%>
<%-- 						<h5 class="membernick">文章數: ${memberVO.memNick}</h5> --%>
					</div>
				</div>

				<hr>
				<ul class="memberFunction">


					<li><a
						href="${pageContext.request.contextPath}/front-end/member/member_all_follow.jsp">追蹤</a></li>
					<hr>
					<li><a href="<%= request.getContextPath()%>/front-end/registration_master/rm.do?action=getOne_For_Display_BymemId">行程</a></li>
					<hr>
					<li><a href="#">商城</a></li>
					<hr>
					<li><a href="#">文章</a></li>
					<hr>

					<li><a
						href="${pageContext.request.contextPath}/front-end/member/member_all_message.jsp">訊息通知</a></li>
					<hr>

					<li><a href="#banner">錢包管理</a></li>
					<hr>

					<li><a href="#">查詢交易紀錄</a></li>
					<hr>
					<li><a href="#">信用卡儲值</a></li>
					<hr>
					<li><a href="#">餘額匯出</a></li>
					<hr>

					<br>
					<li>帳號設定</li>
					<li><a
						href="${pageContext.request.contextPath}/front-end/member/member_update.jsp">修改會員資料
					</a></li>
					<hr>
					<li><a
						href="${pageContext.request.contextPath}/front-end/mem.do?memId=${memberVO.memId}&action=logout">登出</a></li>
				</ul>

			</div>
			<div class="divright">

				<div class="divrighttop">
					<p>${memberFunction}</p>
				</div>
				<div class=divrightc>
					<sitemesh:write property='body' />
				
				

				</div>
			</div>
	
	</div>
</body>


</html>