<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.member.model.*"%>
<!-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" /> -->
<!-- <link rel="stylesheet" -->
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
<meta http-equiv="X-UA-Compatible" content="IE=edge ,chrome=1">
<title>會員資料修改 - update_mem_input.jsp</title>
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
	width: 600px;
	background-color: white;
	margin-top: 1%;
	margin-bottom: 1%;
}

.myTable, .myTable th, .myTable td {
	border: 0px solid #CCCCFF;
}

.myTable td {
	text-align: left;
	padding-left: 1em
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
<c:set value="${fn:split(memberVO.memAddress, ',') }" var="names" />

</head>
<body bgcolor='white'>
	<div class="divrighttop">
		<p>修改會員資料</p>
	</div>
	<br>
	<hr>
	<br>
	<%--錯誤表列 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>
	<form method="post"
		action="${pageContext.request.contextPath}/front-end/member/mem.do"
		name="form1" enctype="multipart/form-data">
		<table class="myTable">
			<tr>
				<td>大頭照:</td>
				<td><input type="file" id="memPic" name="memPic"
					style="display: none" accept="image/png, image/jpeg" /> <img
					id="img"
					src="${pageContext.request.contextPath}/${memberVO.allPic}"
					onclick="myfunction()"></td>

			</tr>
			<tr height=20px></tr>
			<tr>
				<td>暱稱:</td>
				<td><input type="text" name="memNick" size="45"
					<c:if test = "${memberVO == null}">
				placeholder= "請填寫"
				</c:if>
					<c:if test = "${memberVO != null}">
				value="${memberVO.memNick}"
				</c:if> /></td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>個人簡介:</td>
				<td><textarea name="memText" size="45"
						style="width: 65%; height: 80px;"><c:if
							test="${memberVO != null}">${memberVO.memText}</c:if><c:if
							test="${memberVO == null}">個人簡介</c:if></textarea></td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>電子信箱:</td>
				<td><input type="text" name="memMail" size="45"
					<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
					<c:if test="${memberVO!=null}">value= "${memberVO.memMail}" disabled</c:if> /></td>
			</tr>
			<tr>
				<td>密碼:</td>
				<td><input type="password" id="Pass" name="memPass" size="45"
					<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
					<c:if test="${memberVO!=null}">value= "${memberVO.memPass}"</c:if> /><br>
					<input type="checkbox" class="custom-control-input" id="chkPass"
					onclick="checkit(this.checked)"> <label
					class="custom-control-label" for="chkPass"><span
						style="font-size: smaller; font-weight: 900">顯示密碼</span></label></td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>姓名:</td>
				<td><input type="text" name="memName" size="45"
					<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
					<c:if test="${memberVO!=null}">value= "${memberVO.memName}"</c:if> /></td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>性別:</td>
				<td><input type="radio" name="memSex" value="1"
					<c:if test="${memberVO==null}"></c:if>
					<c:if test="${memberVO.memSex==1}">checked disabled</c:if>
					<c:if test="${memberVO.memSex!=1 && memberVO!=null}">disabled</c:if> />男
					<input type="radio" name="memSex" value="2"
					<c:if test="${memberVO==null}"></c:if>
					<c:if test="${memberVO.memSex==2}">checked disabled</c:if>
					<c:if test="${memberVO.memSex!=2 && memberVO!=null}">disabled</c:if> />女</td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>生日:</td>
				<td><input type="date" id="datepicker1" size="45"
					name="memBirth" <c:if test="${memberVO==null}"></c:if>
					<c:if test="${memberVO!=null}">value="${memberVO.memBirth}" disabled</c:if> /></td>

			</tr>
			<tr height=20px></tr>
			<tr>
				<td>電話:</td>
				<td><input type="text" name="memPhone" size="45"
					<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
					<c:if test="${memberVO!=null}">value= "${memberVO.memPhone}"</c:if> /></td>
			</tr>
			<tr height=20px></tr>
			<tr>
				<td>地址:</td>
				<td><script
						src="${pageContext.request.contextPath}/resource/js/add.js"></script>

					<select id="citya1"></select> <select id="citya2"></select> </select> <input
					type="text" id="area2" size="20"
					<c:if test="${memberVO==null}">placeholder="請填寫"</c:if>
					<c:if test="${memberVO!=null}">value= "${names[2]}"</c:if> /> <input
					type="hidden" id="last" name="memAddress"></td>
			</tr>
			<tr height=20px></tr>


		</table>
		<br> <input type="hidden" name="action" value="update"> <input
			type="hidden" name="memId" value="${memberVO.memId}"> <input
			type="submit" id="inputsubmit" class="btn btn-primary" value="送出修改"
			onmousedown="show()"> <a id=""
			href="${pageContext.request.contextPath}/back-end/member/select_page.jsp">回首頁</a>
	</form>
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
		function selectValue(sId, value) {
			var s = document.getElementById(sId);
			var ops = s.options;
			for (var i = 0; i < ops.length; i++) {
				var tempValue = ops[i].value;
				if (tempValue == value) {
					ops[i].selected = true;
				}
			}
		}
		function selectValue2(sId, v) {
			var s = document.getElementById(sId);
			var ops = s.options;

			ops[0].value = v;
			ops[0].innerText = v;

		}

		window.onload = function() {

			init();
			AddressSeleclList.Initialize('citya1', 'citya2');
			selectValue('citya1', '${names[0]}');
			selectValue2('citya2', '${names[1]}');
		}
	</script>
</body>
</html>