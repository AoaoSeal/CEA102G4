<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary.model.*"%>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>

<%
	ItService itSvc = new ItService();
	List<ItVO> list = itSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>修改競標</title>

</head>
<body>
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
input {
    height: 35px;
    line-height: normal;
}
table {
    width: 100%;
    background-color: white;
    margin-top: 5px;
    margin-bottom: 5px;
}

table, th, td {
	border: 1px solid #CCCCFF;
}

th {
    height: 50px;
    padding: 5px;
    text-align: center;
}

td {
	overflow: hidden;
	padding: 5px;
	text-align: center;
	white-space: nowrap;
	text-overflow: ellipsis;
}

img {
	/* 	border: 5px solid lightgreen; */
	object-fit: cover;
	border-radius: 50%;
	width: 50;
	height: 50;
}
</style>

	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>



<!-- 	<table id="table-1" class="myTable"> -->
<!-- 	</table> -->


		
			<table class="">
				<tr>
					<th>行程編號</th>
					<th>類別</th>
					<th>領隊</th>
					<th>名稱</th>
					<th>首圖1</th>
					<th>首圖2</th>
					<!-- 		<th>首圖3</th> -->
					<!-- 		<th>首圖4</th> -->
					<!-- 		<th>首圖5</th> -->
					<th>天數</th>
					<th>介紹</th>
					<th>費用</th>
					<th>人數上限</th>
					<!-- 		<th>目前人數</th> -->
					<th>出發日期</th>
					<th>報名起始日</th>
					<th>報名結束日</th>
					<th>狀態</th>
				</tr>
				<tr class="showit"></tr>
			</table>
			<!-- 			<table class="showit"> -->
			<!-- 				<tr> -->


			<!-- 				</tr> -->
			<!-- 			</table> -->
		
			<form method="post"
			action="${pageContext.request.contextPath}/back-end/bid/bid.do"
			name="form1" enctype="multipart/form-data">
			<table class="myTable">
<%-- 			<jsp:useBean id="bidVO" scope="page" class="com.bid.model.LdService" />	 --%>
					<br><hr><br>
				<tr>	<th>正在修改競標編號:<hr> ${BidVO.bidNo}
				<input type="hidden" name="bidNo" value="${BidVO.bidNo}"></th></tr>
					<tr >
				<th>&emsp;&emsp;&emsp;競標行程編號:</th> <th><input type="text" name="itNo" style="width: 15em"  readonly value="${BidVO.itNo}"/></th>
						<th>&emsp;&emsp;&emsp;競標起標價格(新台幣):</th> <th><input type="text" id="dat"  name="bidPricestart" style="width: 15em" value="${BidVO.bidPricestart}"
					 /></th>
				<th>&emsp;&emsp;&emsp;競標開始時間:</th> <th><input type="text" id="date1"  name="bidTimestart" style="width: 15em"
				 <c:set var="string1" value="${BidVO.bidTimestart}"/>
				<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
				value="${string2}"
						
				
				
				autocomplete="off"/></th>
				<th>&emsp;&emsp;&emsp;競標結束時間:</th> <th><input type="text" id="date2"  name="bidTimeend" style="width: 15em"
				<c:set var="string1" value="${BidVO.bidTimeend}"/>
				<c:set var="string2" value="${fn:substringBefore(string1,'.0')}"/>	
				
				value="${string2}"
									
					 autocomplete="off"/></th>
					 <tr>
				<th><input type="hidden" name="action" value="update">
					<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
				<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>"> 
					<input type="submit" value="更新競標"></th><th><a href="${pageContext.request.contextPath}/back-end/bid/listAllBid.jsp">競標管理</a></th>
				</tr>
			</table>
		</form>
	
	<br>
	<br><hr><br>
	<table id="tab1" style="table-layout: fixed;">
		<tr>
			<th>行程編號</th>
			<th>類別</th>
			<th>領隊</th>
			<th>名稱</th>
			<th>首圖1</th>
			<th>首圖2</th>
			<!-- 		<th>首圖3</th> -->
			<!-- 		<th>首圖4</th> -->
			<!-- 		<th>首圖5</th> -->
			<th>天數</th>
			<th>介紹</th>
			<th>費用</th>
			<th>人數上限</th>
			<!-- 		<th>目前人數</th> -->
			<th>出發日期</th>
			<th>報名起始日</th>
			<th>報名結束日</th>
			<th>狀態</th>
			<th>加入競標</th>
		</tr>

		<%-- 	<%@ include file="/resource/file/page1.file" %> --%>

		<c:forEach var="itVO" items="${list}">
			<c:if test="${itVO.itStatus==0 || itVO.itStatus==1}">
				<tr class="${itVO.itNo}" ${(itVO.itNo==BidVO.itNo)? 'bgcolor=lightgreen':''}>

					<th>${itVO.itNo}</th>

					<jsp:useBean id="itcSvc" scope="page"
						class="com.itinerary_category.model.ItcService" />
					<th><c:forEach var="itcVO" items="${itcSvc.all}">
							<c:if test="${itVO.itcNo==itcVO.itcNo}">
	                    ${itcVO.itcNo}<br>
								<font color=#8B4513>${itcVO.itcName}</font>
							</c:if>
						</c:forEach></th>

					<jsp:useBean id="ldSvc" scope="page"
						class="com.leader.model.LdService" />
					<th><c:forEach var="ldVO" items="${ldSvc.all}">
							<c:if test="${itVO.ldNo==ldVO.ldNo}">
	                    ${ldVO.ldNo}<br>
								<font color=#8B4513>${ldVO.ldName}</font>
							</c:if>
						</c:forEach></th>
					<th>${itVO.itName}</th>
					<th width="120px"><img
						src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no"
						width="120" height="120"></th>
					<th width="120px"><img
						src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no"
						width="120" height="120"></th>
					<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="120" height="120"></th> --%>
					<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="120" height="120"></th> --%>
					<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="120" height="120"></th> --%>
					<th>${itVO.itDays}</th>
					<th
						style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis"
						onmousemove="removeClassType(this)">${itVO.itText}</th>
					<th>${itVO.itPrice}</th>
					<th>${itVO.itPeolim}</th>
					<%-- 		<th>${itVO.itPeocount}</th> --%>
					<th>${itVO.itDate}</th>
					<th>${itVO.itStartdate}</th>
					<th>${itVO.itEnddate}</th>

					<c:set var="status" value="${itVO.itStatus}" />
					<c:choose>
						<c:when test="${itVO.itStatus==0}">
							<th>下架</th>
						</c:when>
						<c:when test="${itVO.itStatus==1}">
							<th>上架</th>
						</c:when>
						<c:when test="${itVO.itStatus==2}">
							<th>行程結束</th>
						</c:when>
						<c:when test="${itVO.itStatus==3}">
							<th>行程取消</th>
						</c:when>
					</c:choose>
					
					<th>
						<%-- 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary/it.do"> --%>
						<input type="submit" value="加入競標" class="${itVO.itNo}"
						onclick="addit(this)"> <%-- 			   <input type="hidden" name="itNo"  value="${itVO.itNo}"> --%>
						<!-- 			   <input type="hidden" name="action" value="getOne_For_Update"> -->

						<!-- 			</FORM> -->
					</th>
				</tr>
			</c:if>
		</c:forEach>
	</table>
	<%-- <%@ include file="/resource/file/page2.file" %> --%>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/resource/datetimepicker/jquery.datetimepicker.full.js"></script>
	<script>
		function addit($this) {

			let itno = $($this).attr("class");
			console.log(itno);

			$("tr").each(function() {
				$("tr").css("background-color", "#fff")

			});
			$("[name='itNo']").val(itno);

			$($this).parents("tr").css("background-color", "lightgreen");

			$(".showit").html($($this).parents("tr").html()).css(
					"background-color", "lightgreen");
			console.log($(".showit tr th:last"));
			$(".showit th:last").remove();
			
		}

		$.datetimepicker.setLocale('zh');
        $('#date1').datetimepicker({
 	       theme: '',              
	       timepicker:true,       
	       step: 10,    
// 	       format:'@',  
	       format:'Y-m-d H:i',         
		   value: '',              
        }); 
        $('#date2').datetimepicker({
  	       theme: '',              
 	       timepicker:true,       
 	      step: 10, 
	       format:'Y-m-d H:i',          
 		   value: '',              
         }); 
		function removeClassType($this) {
			$($this).attr("title", $this.innerText);
		}
	</script>
</body>
</html>