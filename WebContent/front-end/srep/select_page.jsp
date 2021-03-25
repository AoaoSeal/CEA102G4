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
</style>
</head>
<body bgcolor="#D2B48C">

<h2 style="padding-left:20px;">檢舉管理</h2>

<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<a>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/srep/listAllSrep.jsp">
			<input type="submit" value="賣家檢舉列表">
		</FORM>
	</a>	
	<br>
	<a>
		<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/grep/listAllGrep.jsp">
			<input type="submit" value="商品檢舉列表">
		</FORM></a>
	</li>	

<!-- <ul>   -->
<!--   <li>    -->
<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/srep/srep.do" name="form1"> --%>
<!--         <b><font color=blue>萬用複合查詢:(查詢對應檢舉)</font></b> <br> -->
<!--         <b>輸入會員編號:</b> -->
<!--         <input type="text" name="mem_id"><br> -->
           
<!--        <b>輸入訂單編號:</b> -->
<!--        <input type="text" name="or_no"><br> -->
       
<%--     <jsp:useBean id="srepSvc" scope="page" class="com.srep.model.SrepService" /> --%>
<!--        <b>選擇賣家檢舉編號:</b> -->
<!--        <select size="1" name="srep_no" > -->
<!--           <option value=""> -->
<%--          <c:forEach var="srepVO" items="${srepSvc.all}" >  --%>
<%--           <option value="${srepVO.srep_no}">${srepVO.srep_no} --%>
<%--          </c:forEach>    --%>
<!--        </select><br> -->
           
<!--        <b>檢舉日期:</b> -->
<!-- 	   <input name="srep_time" id="date1" type="text"> -->
		        
<!--         <input type="submit" value="送出"> -->
<!--         <input type="hidden" name="action" value="listSrep_ByCompositeQuery"> -->
<!--      </FORM> -->
<!--   </li> -->
<!-- </ul> -->

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