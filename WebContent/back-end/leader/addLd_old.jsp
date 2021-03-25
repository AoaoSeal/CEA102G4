<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.leader.model.*"%>

<%LdVO ldVO = (LdVO) request.getAttribute("ldVO");%>


<!DOCTYPE html>
<html>
<head>
<title>新增 addEmp.jsp</title>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
<style>
	table {
			width: 600px;
			background-color: #F5F5DC;
			margin-top: 1px;
			margin-bottom: 1px;
			margin-left:auto; 
			margin-right:auto;
 			}
 			
	table, th, td {
   			border: 0px solid #000000;
  			}
  			
	th, td {
    		padding: 1px;
			}
	textarea{resize:none;}
  	input[type="submit"] { padding:5px 15px; 
							background:#D2B48C;
							border:0 none;
							cursor:pointer;
							-webkit-border-radius: 5px;
							border-radius: 5px;
						}
	input[type="text"], textarea{ padding:5px 15px; 
									border:1px black solid;
									cursor:pointer;
									-webkit-border-radius: 5px;
									border-radius: 5px; 
						}

	.cke_top
				{
	  			  zoom:0.8;
				}


</style>
</head>

<body bgcolor="#D2B48C">

	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>		
			</c:forEach>
		</ul>
	</c:if>
	
	<table id="table-1">
		<tr>
			<td align="center">
			 	<h3>新增領隊資料</h3>
				<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp">
					<input type="submit" value="回首頁">
				</FORM>
			</td>
			<td>
				<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>
			</td>
		</tr>
	</table>


	<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/leader/ld.do" enctype="multipart/form-data">
	<table>
		<tr>
			<td>領隊姓名:</td>
			<td><input type="text" name="ldName" size="32"></td>
			<td rowspan="3"><center>圖片預覽<center><img id="preview" width="150" height="150"></td>
		</tr>
		<tr>
			<td>姓名:</td>
			<td><input type="text" name="ldName" size="32"></td>
		</tr>
		<tr>
			<td>領隊照片:</td>
			<td><input type="file" name="ldPic" id="imgInp"></td>
			
		</tr>
		<tr>
			<td>經歷介紹:</td>
			<td><div id="editor">
			<textarea id="ldExpr" name="ldExpr" cols="32" rows="5"></textarea></div></td>
		</tr>
		
		<tr>
		<td><input type="hidden" name="action" value="insert">
			<input type="submit" value="新增"></td>
		</tr>
	</table>
	</FORM>

<script type="text/javascript">
	$('#imgInp').change(function() {
		  let file = $('#imgInp')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});


	  $(document).ready(function() {
	   CKEDITOR.replace('ldExpr');
	   console.log("ready!");
	  });



</script>
</body>
</html>