<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script> -->
<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>

<link rel="stylesheet" href="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.css">
<script src="<%= request.getContextPath()%>/resource/jquery-ui-1.12.1/jquery-ui.js"></script>
    
    
<style>
	th, td {
    		padding: 20px;
			}
 	#ittable { 
/*  			width: 900px;  */
/*  			background-color: #F5F5DC;  */
 			margin-top: 1px; 
 			margin-bottom: 1px; 
 			margin-left:auto;  
 			margin-right:auto; 
  			} 
 			
 	#ittable > th, td { 
    			border: px solid #000000; 
    			padding: 1px;
   			} 
 	
 	input[type="text"], textarea{ padding:5px 15px;  
 									border:1px black solid; 
 									cursor:pointer; 
 									-webkit-border-radius: 5px; 
 									border-radius: 5px;  
 						} 

	#btnInsert, #btnHome { 
			padding:10px 30px;  
			background:#66615B; 
			color:#fff;
			border:0 none; 
			cursor:pointer; 
			-webkit-border-radius: 3px; 
			border-radius: 3px; 
 			} 

	#btnInsert {
		margin-left:765px;
	}
	.cke_top
				{
	  			  zoom:0.8;
				}
	#editor {padding: 10px;	}
	img {
		padding: 1px;
	}

</style>
</head>
<div>


	<table id="ittable">
		<tr>
<!-- 			<td align="center"> -->
<!-- 			 	<h3>新增行程</h3> -->
<%-- 				<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp"> --%>
<!-- 					<input id="btnHome" type="submit" value="回首頁"> -->
<!-- 				</FORM> -->
<!-- 			</td> -->
			<td>
				<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="200" height="200" border="0"></h4>
			</td>
		</tr>
	</table>

	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>		
			</c:forEach>
		</ul>
	</c:if>
	
	<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/it.do" enctype="multipart/form-data">
	<table id="ittable">
		<tr>
			<td width="100px">行程名稱:</td>
			<td><input type="text" name="itName" placeholder="2~20的中、英文、數字或底線" size="32"></td>
			<td rowspan="14">
			<center>圖片預覽1<center><img id="preview" width=170" height="100">
			<center>圖片預覽2<center><img id="preview2" width=170" height="100">
			<center>圖片預覽3<center><img id="preview3" width=170" height="100">
			<center>圖片預覽4<center><img id="preview4" width=170" height="100">
			<center>圖片預覽5<center><img id="preview5" width=170" height="100"></td>
		</tr>
		
		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
		<tr>
			<td>行程類別:</td>
			<td><select size="1" name="itcNo">
			<c:forEach var="itcVO" items="${itcSvc.all}">
				<option value="${itcVO.itcNo}" ${(param.itcNo==itcVO.itcNo)? 'selected':'' } >${itcVO.itcName}
			</c:forEach>
			</select></td>
		</tr>
		<jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
			<tr>
			<td>領隊:</td>
			<td><select size="1" name="ldNo">
			<c:forEach var="ldVO" items="${ldSvc.all}">
				<option value="${ldVO.ldNo}" ${(param.ldNo==ldVO.ldNo)? 'selected':'' } >${ldVO.ldName}
			</c:forEach>
			</select></td>
		</tr>
		<tr>
			<td>行程首圖:</td>
			<td><input type="file" name="itPic" id="imgInp"></td>			
		</tr>
		<tr>
			<td>行程首圖2:</td>
			<td><input type="file" name="itPic2" id="imgInp2"></td>			
		</tr>
		<tr>
			<td>行程首圖3:</td>
			<td><input type="file" name="itPic3" id="imgInp3"></td>			
		</tr>
		<tr>
			<td>行程首圖4:</td>
			<td><input type="file" name="itPic4" id="imgInp4"></td>			
		</tr>
		<tr>
			<td>行程首圖5:</td>
			<td><input type="file" name="itPic5" id="imgInp5"></td>			
		</tr>
		<tr>
			<td>行程天數:</td>
			<td><input type="text" name="itDays" size="32" placeholder="請輸入數字"></td>
		</tr>
		<tr>
			<td>人數上限:</td>
			<td><input type="text" name="itPeolim" size="32" placeholder="請輸入數字"></td>
		</tr>
		<tr>
			<td>行程費用:</td>
			<td><input type="text" name="itPrice" size="32" placeholder="請輸入數字"></td>
		</tr>
		<tr>
			<td>出發日期:</td>
			<td><input name="itDate" id="date" type="text" placeholder="請選擇至少7日後的日期"></td>
		</tr>
		<tr>
			<td>報名起始日:</td>
			<td><input name="itStartdate" id="itStartdate" type="text" placeholder="請選擇"></td>
		</tr>
		<tr>
			<td>報名結束日:</td>
			<td><input name="itEnddate" id="itEnddate" type="text" placeholder="請選擇"></td>
		</tr>
		<tr>
			<td>行程介紹:</td>
			<td colspan="2"><div id="editor">
			<textarea id="itText" name="itText" cols="32" rows="5"></textarea></div></td>
		</tr>
		
		<tr>
		
		<td colspan="3"><input type="hidden" name="action" value="insert">
			<input type="submit" value="新增" id="btnInsert"></td>
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
	$('#imgInp2').change(function() {
		  let file = $('#imgInp2')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview2').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});
	$('#imgInp3').change(function() {
		  let file = $('#imgInp3')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview3').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});
	$('#imgInp4').change(function() {
		  let file = $('#imgInp4')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview4').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});
	$('#imgInp5').change(function() {
		  let file = $('#imgInp5')[0].files[0];
		  let reader = new FileReader;
		  reader.onload = function(e) {
		    $('#preview5').attr('src', e.target.result);
		  };
		  reader.readAsDataURL(file);
		});	

	  $(document).ready(function() {
	   CKEDITOR.replace('itText');
	   console.log("ready!");
	  });
	  

let itDate = $("#date").datepicker({
	dateFormat : "yy-mm-dd",
	changeYear : true,
	changeMonth : true,
	minDate : "+7d",
	onClose : function(selectedDate, inst) {
		let beginDate = new Date(Date.parse(selectedDate));
		beginDate.setDate(beginDate.getDate() - 1);
		$("#itStartdate").datepicker("option", "maxDate", beginDate);
		let endDate = new Date(Date.parse(selectedDate));
		endDate.setDate(endDate.getDate());
		$("#itEnddate").datepicker("option", "maxDate", endDate);
	}
});
$("#itStartdate").datepicker({
	dateFormat : "yy-mm-dd",
	changeYear : true,
	changeMonth : true,
	maxDate : $("#date").val(),
	onClose : function(selectedDate, inst) {
		let endDate = new Date(Date.parse(selectedDate));
		endDate.setDate(endDate.getDate() + 1);
		$("#itEnddate").datepicker("option", "minDate", endDate);
	}
});
$("#itEnddate").datepicker({
	dateFormat : "yy-mm-dd",
	changeYear : true,
	changeMonth : true,
	maxDate : $("#date").val()
});
</script>
</div>
</html>