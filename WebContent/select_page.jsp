<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- datetimepicker -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.full.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
</head>
<body>
<!-- <div id="sidebar"> -->
<%-- 	<%@ include file="/resource/file/sidebar.file" %> --%>
<!-- </div> -->

<div class="itcontainer">
<h2 style="padding-left:20px;">行程管理</h2>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/addIt.jsp">
			<input type="submit" value="新增行程">
		</FORM>
	</li>	



	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary/listAllIt.jsp">
			<input type="submit" value="行程列表">
		</FORM>
	</li>	


  
	<li>   
		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary/it.do" name="form1">
        	<b><font color=blue>萬用複合查詢:(查詢對應行程)</font></b> <br>
        	
			<b>輸入領隊編號:</b>
        	<input type="text" name="ld_no"><br>
           
       		<b>輸入行程名稱:</b>
     		<input type="text" name="it_name"><br>
       
		    <jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
		       <b>選擇行程類別:</b>
		       <select size="1" name="itc_no" >
		          <option value="">
		         <c:forEach var="itcVO" items="${itcSvc.all}" > 
		          <option value="${itcVO.itcNo}">${itcVO.itcName}
		         </c:forEach>   
		       </select><br>
           
		     <b>行程日期:</b>
			 <input name="it_date" id="date1" type="text">
		        
	        <input type="submit" value="送出">
	        <input type="hidden" name="action" value="listIts_ByCompositeQuery">
     </FORM>
  </li>
</ul>


<h2 style="padding-left:20px;">行程類別管理</h2>
<ul>
	<li>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary_category/listAllItc.jsp">
			<input type="submit" value="行程類別管理">(列出所有行程類別)
		</FORM>
	</li>	
</ul>


<h2 style="padding-left:20px;">領隊管理</h2>
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




<script>
        $.datetimepicker.setLocale('zh');
        $('#date1').datetimepicker({
 	       theme: '',              
	       timepicker:false,       
	       step: 1,                
	       format:'Y-m-d',         
		   value: '',              
        });        
</script>
</html>