<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>領隊首頁 select_page</title>
</head>
<!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<body>
<style>
	input[type="submit"] { padding:5px 15px; 
							background:#F5F5DC;
							border:0 none;
							cursor:pointer;
							-webkit-border-radius: 5px;
							border-radius: 5px;
						}
	input[type="text"]{ padding:5px 15px; 
						border:1px black solid;
						cursor:pointer;
						-webkit-border-radius: 5px;
						border-radius: 5px; 
						}
	select{ padding:5px 15px; 
			border:1px black solid;
			cursor:pointer;
			-webkit-border-radius: 5px;
			border-radius: 5px; 
		}	
		
	.itcontainer{
		position: absolute;
		top:100px;
		left:300px;			
	}	
</style>
<!-- <div id="sidebar"> -->
<%-- 	<%@ include file="/resource/file/sidebar.file" %> --%>
<!-- </div> -->


<div class="itcontainer">
<br>
<h2 style="padding-left:20px;">領隊資料</h2>

<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>		
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/addLd.jsp">
			<input type="submit" value="新增領隊">
		</FORM>
	</li>		
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/leader/listAllLd.jsp">
			<input type="submit" value="列出全部領隊名單">
		</FORM>
	</li>	
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/leader/ld.do">
			<b>請輸入領隊編號</b>
			<input type="text" placeholder="例如:12001" name="ldNo">
			<input type="hidden" name="action" value="getOne_For_Display">
			<input type="submit" value="送出">
		</FORM>
	</li>
	
	<jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService"/>
	
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/leader/ld.do">
			<b>請選擇領隊編號</b>
			<select size="1" name="ldNo">
			<c:forEach var="ldVO" items="${ldSvc.all}">
			<option value="${ldVO.ldNo}">${ldVO.ldNo}
			</c:forEach>
			</select>
     		<input type="hidden" name="action" value="getOne_For_Display">
       		<input type="submit" value="送出">			
		</FORM>
	</li>
</ul>
</div>

</body>
</html>