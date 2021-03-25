<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.member.model.*"%>
<!-- <link rel="stylesheet" -->
<!-- 	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
<!-- 	<link rel="stylesheet" -->
<!--  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" -->
<!--  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" -->
<!--  crossorigin="anonymous"> -->
<!-- <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script> -->
<!-- <script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script> -->

<%
	MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>
<html>
<head>
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" /> -->
<!-- <title>會員註冊 addmem.jsp</title> -->

<style>
.myTable #table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
}

.myTable #table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

.myTable h4 {
	color: blue;
	display: inline;
}
</style>

<style>
.myTable {
	margin-left: 3%;
	width: 80%;
	background-color: white;
	margin-top: 1%;
	margin-bottom: 1%;
}

.myTable,.myTable th,.myTable td {
	border: 0px solid #CCCCFF;
}

.myTable td {
	width: 10em;
	text-align: left;
	padding-left:1em
}

.myTable th {
	width: 10em;
	text-align: right
}

#img {
	border: 5px solid lightgreen;
	object-fit: cover;
	border-radius: 50%;
	width: 8em;
	height: 8em;
}


</style>
</head>
<body>

	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<script>
		function myfunction() {
			$('#memPic').trigger('click');
		}

		function init() {
			$("#datepicker1").change(function() {
				$("#datepicker1").attr("value", $(this).val());
			})

			let myfile = document.getElementById('memPic');
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
								let img = document.getElementById('img');
								img.setAttribute('src', result);
							})
							reader.readAsDataURL(file);
						} else {
							alert('請上傳圖片')
						}
					}
				}

			})

		}

		function checkit(isChecked) {
			if (!isChecked) {
				$('#Pass').attr('type', 'password');
			} else {
				$('#Pass').attr('type', 'text');
			}
		}
		window.onload = function() {
			init();
			AddressSeleclList.Initialize('citya1', 'citya2');
		}
	</script>
<style>
 textarea, input {
    margin: 20px;
    overflow: visible;
}


</style>
	<table id="table-1" class="myTable">
	</table>

	<table class="myTable">
		<form method="post"
			action="${pageContext.request.contextPath}/front-end/mem.do"
			name="form1" enctype="multipart/form-data">
			<table><tr>
					<th>電子信箱:</th>
					<td><input type="text" name="memMail" style="width: 15em"
						<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
						<c:if test="${memberVO!=null}">value= "${memberVO.memMail}" </c:if> /></td>
				</tr>

				<tr>
					<th>密碼:</th>
					<td><input type="password" id="Pass" name="memPass" style="width: 15em"
						<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
						<c:if test="${memberVO!=null}">value= "${memberVO.memPass}"</c:if> /><br>
						<input type="checkbox" class="custom-control-input" id="chkPass"
						onclick="checkit(this.checked)"> <label
						class="custom-control-label" for="chkPass"><span
							style="font-size: smaller; font-weight: 900">顯示</span></label></td>
				</tr>
				<tr>
					<th>大頭照:</th>
					<td style="width: 30em height: 30em"><input type="file"
						id="memPic" name="memPic" style="display: none"
						accept="image/png, image/jpeg" /> <img id="img"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"	
						onclick="myfunction()"></td>

				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>暱稱:</th>
					<td><input type="text" name="memNick" style="width: 15em"
						<c:if test = "${memberVO == null}">
				placeholder= "請填寫"
				</c:if>
						<c:if test = "${memberVO != null}">
				value="${memberVO.memNick}"
				</c:if> /></td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>個人簡介:</th>
					<td><textarea name="memText" style="width: 15em; height: 4m;"><c:if
								test="${memberVO != null}">${memberVO.memText}</c:if><c:if
								test="${memberVO == null}">個人簡介</c:if></textarea></td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>姓名:</th>
					<td><input type="text" name="memName" style="width: 15em"
						<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
						<c:if test="${memberVO!=null}">value= "${memberVO.memName}"</c:if> /></td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>性別:</th>
					<td><input type="radio" name="memSex" value="1"
						<c:if test="${memberVO==null}"></c:if>
						<c:if test="${memberVO.memSex==1}">checked </c:if>
						<c:if test="${memberVO.memSex!=1 && memberVO!=null}"></c:if> />男
						<input type="radio" name="memSex" value="2"
						<c:if test="${memberVO==null}"></c:if>
						<c:if test="${memberVO.memSex==2}">checked </c:if>
						<c:if test="${memberVO.memSex!=2 && memberVO!=null}"></c:if> />女</td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>生日:</th>
					<jsp:useBean id="today" class="java.util.Date" scope="page" />

					<td><input type="date" id="datepicker1" name="memBirth"
						style="width: 15em"
						max="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />"
						<c:if test="${memberVO==null}"></c:if> /></td>

				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>電話:</th>
					<td><input type="text" name="memPhone" style="width: 15em"
						<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
						<c:if test="${memberVO!=null}">value= "${memberVO.memPhone}"</c:if> /></td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th>地址:</th>
					<td><script src="${pageContext.request.contextPath}/resource/js/add.js"></script>
						<c:set value="${fn:split(memberVO.memAddress, ',') }" var="names" />
						<select id="citya1">${names}[0]</select> <select id="citya2">${names}[1]</select>
						</select> <input type="text" id="area2" placeholder="請填寫" onblur="show()" />
						<input type="hidden" id="last" name="memAddress" style="width: 15em"></td>
				</tr>
				<!-- 				<tr height=20px></tr> -->
				<tr>
					<th></th>
					<td><br>
					<input type="hidden" name="action" value="insert">
					<input type="submit" class="btn btn-primary" value="確認註冊"
						style="align: center">
					</td>
				</tr>

			</table>
			
		</form>
	</table>
</body>
</html>