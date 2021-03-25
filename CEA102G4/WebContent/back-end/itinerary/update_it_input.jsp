<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary.model.*"%>
<% ItVO itVO = (ItVO) request.getAttribute("itVO");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="<%=request.getContextPath()%>/resource/ckeditor/ckeditor.js"></script>
	<!-- datetimepicker -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.css" />
	<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
	table {
			width: 1000px;
			background-color: #FFF;
			margin-top: 1px;
			margin-bottom: 1px;
			margin-left:auto; 
			margin-right:auto;
			font-size:18px;
 			}
 			

  			
	th, td {
    		padding: 15px;
			}

	input[type="submit"] { 
		background-color: #51cbce;
	    color: #FFFFFF;
	    border-radius: 30px;
	    width: 120px;
	    height: 40px;
		font-size:18px;
		}
	input[type="text"], textarea{ padding:5px 15px; 
									border:1px black solid;
									cursor:pointer;
									-webkit-border-radius: 5px;
									border-radius: 10px; 
						}

	.cke_top
				{
	  			  zoom:0.8;
				}
	#editor {padding: 10px;	}
	img {
		padding: 1px;
	}
	.footer {
		position: relative!important;
	}
	

</style>
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
			 <h3>行程資料修改</h3>
			<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/calendar2.jsp">
				<input type="submit" value="回行程首頁">
			</FORM>
		</td>
		<td>
			 <h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>
		</td>
	</tr>
</table>

<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/it.do" enctype="multipart/form-data">
<table>
	<tr>
		<td>編號:</td>
		<td><%=itVO.getItNo()%></td>
		<td rowspan="14">
		<center>圖片預覽<center><img id="preview" width="170" height="100" src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no">
		<center>圖片預覽2<center><img id="preview2" width=170" height="100" src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no">
		<center>圖片預覽3<center><img id="preview3" width=170" height="100" src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no">
		<center>圖片預覽4<center><img id="preview4" width=170" height="100" src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no">
		<center>圖片預覽5<center><img id="preview5" width=170" height="100" src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no"></td>
		
	</tr>
		<tr>
		<td>名稱:</td>
		<td><input type="text" name="itName" size="32" value="<%=itVO.getItName()%>"></td>		
	</tr>
	
		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
	<tr>
		<td>類別:</td>
		<td><select size="1" name="itcNo">
			<c:forEach var="itcVO" items="${itcSvc.all}">
				<option value="${itcVO.itcNo}" ${(itVO.itcNo==itcVO.itcNo)?'selected':'' } >${itcVO.itcName}
			</c:forEach>
		</select></td>
	</tr>
	
		<jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
	<tr>
		<td>領隊:</td>
		<td><select size="1" name="ldNo">
			<c:forEach var="ldVO" items="${ldSvc.all}">
				<option value="${ldVO.ldNo}" ${(itVO.ldNo==ldVO.ldNo)? 'selected':'' } >${ldVO.ldName}
			</c:forEach>
		</select></td>
	</tr>	
	<tr>
		<td>首圖:</td>
		<td>
		<input type="file" name="itPic" id="imgInp">
		</td>
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
			<td><input type="text" name="itDays" size="32" value="<%=itVO.getItDays()%>"></td>
		</tr>	
	<tr>
	<td>人數上限:</td>
		<td><input type="text" name="itPeolim" size="32" value="<%=itVO.getItPeolim()%>"></td>
	</tr>
	<tr>
	<td>行程費用:</td>
		<td><input type="text" name="itPrice" size="32" value="<%=itVO.getItPrice()%>"></td>
	</tr>	
	<tr>
		<td>出發日期:</td>
		<td><input name="itDate" id="date" type="text" value="<%=itVO.getItDate()%>"></td>
	</tr>
	<tr>
		<td>報名起始日:</td>
		<td><input name="itStartdate" id="itStartdate" type="text" value="<%=itVO.getItStartdate()%>"></td>
	</tr>
	<tr>
		<td>報名結束日:</td>
		<td><input name="itEnddate" id="itEnddate" type="text" value="<%=itVO.getItEnddate()%>"></td>
	</tr>
	
	<tr>
		<td>介紹:</td>
		<td colspan="2"><div id="editor">
		<textarea name="itText" cols="32" rows="5"><%=itVO.getItText()%></textarea></div></td>
	</tr>
	<tr>
		<td>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="itNo"  value="<%=itVO.getItNo()%>">
		 
		<input type="submit" value="送出修改">	
		</td>
	</tr>
	
</table>
</FORM>

<script type="text/javascript">
// 	let obj = document.getElementById("preview");
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


      $.datetimepicker.setLocale('zh');
      $('#date').datetimepicker({
	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '',              
      });   
      
      $.datetimepicker.setLocale('zh');
      $('#itStartdate').datetimepicker({
	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '',              
      });  
      
      $.datetimepicker.setLocale('zh');
      $('#itEnddate').datetimepicker({
	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '',              
      });  
</script>
</body>
</html>