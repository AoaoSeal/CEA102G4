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
	div.nav{
		margin-top:150px;
		margin-left:300px;
		font-size:22px;
	}

	div.contentRm{
		margin-bottom: 100px;
		width:1150px;
 		margin-top:10px; 
		margin-left:370px;
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
	
	table > tr, th {
/* 	    border: 1px solid #666; */
		padding: 15px 0 0 0;
	    
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
</style>
<!-- 每個front-end頁面都要有這行code -->
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<!-- 每個front-end頁面都要有這行code -->

		<div class="nav">
		  <a class="nav-link active" href="${pageContext.request.contextPath}/front-end/itinerary/listAllIt.jsp">熱門行程</a>
		  | <a class="nav-link" href="${pageContext.request.contextPath}/front-end/leader/listAllLd.jsp">領隊介紹</a>
		  | <FORM  NAME='form1'METHOD="post" ACTION="<%= request.getContextPath()%>/front-end/registration_master/rm.do">
			<input type="hidden" name="action" value="getOne_For_Display_BymemId">
			<input type="submit" class="myArea" value="我的專區">
			</FORM>
		</div>
		
		
		<div class="contentRm">
			<table>								
				<thead>												
					<tr>
						<th>報名日期</th>
						<th>行程</th>
						<th>訂單編號</th>
						<th>審核進度</th>
						<th>查看</th>
						<th>回饋</th>
					</tr>
				</thead>
					<tr>
					
						<th colspan="6" style="color:red;text-align:center;">目前尚無任何報名資訊</th>
						
					</tr>							
			</table>	
		</div>

</body>
</html>