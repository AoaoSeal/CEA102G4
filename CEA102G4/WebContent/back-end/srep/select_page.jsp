<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- datetimepicker -->
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.css" />
<script
	src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.full.js"></script>

</head>
<body bgcolor="#D2B48C">
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">
	<h2 style="padding-left: 20px;">檢舉管理</h2>

	<c:if test="${not empty errorMsgs}">
		<font color='red'>請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<div class="row">
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body" ><img src="http://www.showingsuite.com/wp-content/themes/showingsuite/img/seller.png">
<!-- 					<h5>檢舉賣家</h5> -->
<br>
					<a href="<%=request.getContextPath()%>/back-end/srep/listAllSrep.jsp" class="btn btn-primary">賣家檢舉列表</a>
				</div>
			
			</div>
		</div>
		<div class="col-sm-6">
			<div class="card">
				<div class="card-body"><img src="https://img.ruten.com.tw/s2/5/4a/ac/21616559189676_387.jpg">
				
<!-- 					<h5 class="card-title">檢舉商品</h5> -->
<br>
					<a
						href="<%=request.getContextPath()%>/back-end/grep/listAllGrep.jsp"
						class="btn btn-primary">商品檢舉列表 </a>
				</div>
			</div>
		</div>
	</div>

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
		theme : '',
		timepicker : false,
		step : 1,
		format : 'Y-m-d',
		value : '',
	});
</script>
</html>