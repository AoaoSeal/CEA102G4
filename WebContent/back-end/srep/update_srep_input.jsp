<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.srep.model.*"%>

<%
SrepVO srepVO = (SrepVO) request.getAttribute("srepVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>檢舉商品資料修改 - update_srep_input.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}

img {
	width: 150;
	height: 150;
}
</style>
<script>
	
</script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>

</head>
<body>
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
	<!-- 每個back-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個back-end頁面都要有這行code -->
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">檢舉賣家</h2>
		</div>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<form METHOD="post" ACTION="srep.do" name="form1"
			enctype="multipart/form-data">
			<legend>賣家檢舉審核</legend>
			<tr>
				<td>檢舉編號:<font color=red><b>*</b></font></td>
				<td><%=srepVO.getSrep_no()%></td>

			</tr>
			<input type="hidden" name="mem_id" value="<%=srepVO.getMem_id()%>">
			<jsp:useBean id="srepSvc" scope="page"
				class="com.srep.model.SrepService" />

			<p>
				<td>訂單編號:<font color=red><b>*</b></font></td>
					<td><td>${srepVO.or_no}</td></td>
					<input type="hidden" name="or_no" value="<%=srepVO.getOr_no()%>">

			</p>

			<p>
				<label for="input">檢舉日期:</label> <input type="text" name="srep_time" value="<%=srepVO.getSrep_time()%>" readonly>
			<p>
			<p>
				<label for="input">檢舉狀態:</label> <input type="radio"
					name="srep_status" id="status1" value="0"
					<%=(srepVO.getSrep_status() == 0) ? "checked" : ""%>>未處理 <input
					type="radio" name="srep_status" id="status2" value="1"
					<%=(srepVO.getSrep_status() == 1) ? "checked" : ""%>>已處理
			</p>
			<p>
				<label for="input">商品圖片:</label> <input type="file" id="srep_mediumblob" name="srep_mediumblob"
					style="display: none" accept="image/png, image/jpeg" /> <img height="150" width="150"
					id="imgs"
					src="
					<c:if test="${srepVO.srep_mediumblob==null || empty srepVO.srep_mediumblob}">
						${pageContext.request.contextPath}/back-end/srep/img/noImage.jpg
					</c:if>
				
					<c:if test="${srepVO.srep_mediumblob!=null && !empty srepVO.srep_mediumblob}">
						data:image/png;base64,${srepVO.srep_mediumblob}
					</c:if>"
					onclick="myfunction1()">
			</p>
			<p>
				<label for="textarea">檢舉事由:</label>
				<textarea readonly id="textarea" name="srep_text" rows="3"
					style="margin: 0px; width: 500px; height: 250px;"><%=(srepVO == null) ? "" : srepVO.getSrep_text()%></textarea>
			</p>
			<p>
				<input type="hidden" name="action" value="updateb"> <input
					type="hidden" name="srep_no" value="<%=srepVO.getSrep_no()%>">
				<input type="submit" value="確認"> <input type="reset"
					value="重設">
			</p>

		</form>
</body>
</html>