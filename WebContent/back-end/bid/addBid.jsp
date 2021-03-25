<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>新增競標</title>

</head>
<body>
<style>
	
	table{
		font-size:16px;
	}
	th{
		font-size:16px!important;
	}
	div.col-md-12 {
	    margin: 20px 65px 0 0px;
	}
	
	#talebtn{
		margin:10px 0 20px 70px;
	}
 	.btnBid { 
 	    margin-left: 50px; 
 	    width: 150px; 
 	    height: 50px; 
	    font-size: 18px; 
 	    border-radius: 8px; 
   	    background-color: #e8e8e9;  
 	    color: #000; 
  	    opacity: 0.8;  
 		transition: box-shadow .3s; 
 		border: none;
		border-bottom: 2px solid #ccc;
 	}	 

 	.btnBid:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 		 text-decoration: none!important; 
 	} 
	
 	.btnBid2{ 
 	    margin-left: 30px; 
 	    width: 150px; 
 	    height: 50px; 
 	    font-size: 18px; 
 	    border-radius: 10px; 
 	    border:1px solid #26BEC9; 
 	    background-color: #26BEC9; 
 	    color: #fff; 
  	    opacity: 0.8;  
 		transition: box-shadow .3s; 
 		border: 1px solid #ccc; 
/*  		margin-top:10px;  */
 		margin-bottom:10px; 
 	}	 
	
 		.btnBid:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 	} 

	.bidText{
		width: 10em!important;
	}

</style>


<table id="talebtn">
<thead>
<th><form action="${pageContext.request.contextPath}/back-end/bid/addBid.jsp">
<button class="btnBid"><span>+新增競標</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="+新增競標"> -->
</form></th>
<th>
<form action="${pageContext.request.contextPath}/back-end/bid/listAllBid.jsp">
<button class="btnBid"><span>全部競標</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="全部競標"> -->
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid1.jsp">
<button class="btnBid"><span>編輯中</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="編輯中"> -->
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid2.jsp">
<button class="btnBid"><span>安排競標</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="安排競標"> -->
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid3.jsp">
<button class="btnBid"><span>正在競標</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="正在競標"> -->
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid4.jsp">
<button class="btnBid"><span>競標結束</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="競標結束"> -->
</form></th>
<th><form action="${pageContext.request.contextPath}/back-end/bid/listAllBid5.jsp">
<button class="btnBid"><span>取消的競標</span></button>
<!-- <INPUT class="btnBid" TYPE=SUBMIT VALUE="取消的競標"> -->
</form></th>
</thead>

<tbody>
</tbody>
</table>
<br><br>




	<%-- 錯誤列表 --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>


	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">競標列表</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead class=" text-primary">
									<tr>
										<th>行程編號</th>
										<th>類別</th>
										<th>領隊</th>
										<th>名稱</th>
										<th>首圖1</th>
										<th>首圖2</th>
										<th>天數</th>
<!-- 										<th>介紹</th> -->
										<th>費用</th>
										<th>人數上限</th>
										<th>出發日期</th>
										<th>報名起始日</th>
										<th>報名結束日</th>
										<th>狀態</th>
									</tr>
									<tr class="showit"></tr>
								</thead>
								<tbody>
									<tr>
										<form method="post"
											action="${pageContext.request.contextPath}/back-end/bid/bid.do"
											name="form1" enctype="multipart/form-data">
											<table class="table table-hover">

												<br>
												<br>
												<th>競標行程編號:</th>
												<th><input type="text" class="bidText" name="itNo"
													style="width: 15em" readonly /></th>
												<th>競標起標價格(新台幣):</th>
												<th><input type="text" class="bidText" id="dat"
													name="bidPricestart" style="width: 15em" /></th>
												<th>競標開始時間:</th>
												<th><input type="text" class="bidText" id="date1"
													name="bidTimestart" style="width: 15em" autocomplete="off" /></th>
												<th>競標結束時間:</th>
												<th><input type="text" class="bidText" id="date2"
													name="bidTimeend" style="width: 15em" autocomplete="off" /></th>
												</tr>
												<table>
													<th><input type="hidden" name="action" value="insert">
														<input type="hidden" name="requestURL"
														value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用-->
														<input type="hidden" name="whichPage"
														value="<%=request.getParameter("whichPage")%>"> <!--只用於:istAllEmp.jsp-->
														<input class="btnBid2" type="submit" value="上架此競標"></th>
													
												</table>
											</table>
										</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">行程列表</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead class=" text-primary">
									<th>行程編號</th>
									<th>類別</th>
									<th>領隊</th>
									<th>名稱</th>
									<th>首圖1</th>
									<th>首圖2</th>
									<th>天數</th>
									<!-- 								<th>介紹</th> -->
									<th>費用</th>
									<th>人數上限</th>
									<th>出發日期</th>
									<th>報名起始日</th>
									<th>報名結束日</th>
									<th>狀態</th>
									<th>加入競標</th>
								</thead>
								<tbody>
									<c:forEach var="itVO" items="${list}">
										<c:if test="${itVO.itStatus==0 || itVO.itStatus==1}">
											<tr class="${itVO.itNo}">

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
												<th width="120px"><img class="itimg"
													src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no"></th>
												<th width="120px"><img class="itimg"
													src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no"></th>
												<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="120" height="120"></th> --%>
												<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="120" height="120"></th> --%>
												<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="120" height="120"></th> --%>
												<th>${itVO.itDays}</th>
												<!-- 					<th -->
												<!-- 						style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis" -->
												<%-- 						onmousemove="removeClassType(this)">${itVO.itText}</th> --%>
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
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 			<table  class="table table-hover"> -->
<!-- 				<tr> -->
<!-- 					<th>行程編號</th> -->
<!-- 					<th>類別</th> -->
<!-- 					<th>領隊</th> -->
<!-- 					<th>名稱</th> -->
<!-- 					<th>首圖1</th> -->
<!-- 					<th>首圖2</th> -->
<!-- 					<th>天數</th> -->
<!-- 					<th>介紹</th> -->
<!-- 					<th>費用</th> -->
<!-- 					<th>人數上限</th> -->
<!-- 					<th>出發日期</th> -->
<!-- 					<th>報名起始日</th> -->
<!-- 					<th>報名結束日</th> -->
<!-- 					<th>狀態</th> -->
<!-- 				</tr> -->
<!-- 				<tr class="showit"></tr> -->
<!-- 			</table> -->
			
		
<!-- 			<form method="post" -->
<%-- 			action="${pageContext.request.contextPath}/back-end/bid/bid.do" --%>
<!-- 			name="form1" enctype="multipart/form-data"> -->
<!-- 			<table class="table table-hover"> -->
					
<!-- 					<br><hr><br> -->
<!-- 				<th>&emsp;&emsp;&emsp;競標行程編號:</th> <th><input type="text" name="itNo" style="width: 15em"  readonly /></th> -->
<!-- 						<th>&emsp;&emsp;&emsp;競標起標價格(新台幣):</th> <th><input type="text" id="dat"  name="bidPricestart" style="width: 15em" -->
<!-- 					 /></th> -->
<!-- 				<th>&emsp;&emsp;&emsp;競標開始時間:</th> <th><input type="text" id="date1"  name="bidTimestart" style="width: 15em" autocomplete="off"/></th> -->
<!-- 				<th>&emsp;&emsp;&emsp;競標結束時間:</th> <th><input type="text" id="date2"  name="bidTimeend" style="width: 15em" autocomplete="off"/></th> -->
<!-- 					 <tr> -->
<!-- 				<th><input type="hidden" name="action" value="insert"> -->
<%-- 				<input type="hidden" name="requestURL" value="<%=request.getParameter("requestURL")%>"> <!--接收原送出修改的來源網頁路徑後,再送給Controller準備轉交之用--> --%>
<%-- 				<input type="hidden" name="whichPage"  value="<%=request.getParameter("whichPage")%>">  <!--只用於:istAllEmp.jsp--> --%>
<%-- 					<input type="submit" value="新增競標"></th><th><a href="${pageContext.request.contextPath}/back-end/bid/listAllBid.jsp">競標管理</a></th> --%>
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 		</form> -->
	
<!-- 	<br> -->
<!-- 	<br><hr><br> -->
<!-- 	<table id="tab1" class="table table-hover"style="table-layout: fixed;"> -->
<!-- 		<tr> -->
<!-- 			<th>行程編號</th> -->
<!-- 			<th>類別</th> -->
<!-- 			<th>領隊</th> -->
<!-- 			<th>名稱</th> -->
<!-- 			<th>首圖1</th> -->
<!-- 			<th>首圖2</th> -->
<!-- 			<th>天數</th> -->
<!-- 			<th>介紹</th> -->
<!-- 			<th>費用</th> -->
<!-- 			<th>人數上限</th> -->
<!-- 			<th>出發日期</th> -->
<!-- 			<th>報名起始日</th> -->
<!-- 			<th>報名結束日</th> -->
<!-- 			<th>狀態</th> -->
<!-- 			<th>加入競標</th> -->
<!-- 		</tr> -->

<%-- 		<%-- 	<%@ include file="/resource/file/page1.file" %> --%> --%>

<%-- 		<c:forEach var="itVO" items="${list}"> --%>
<%-- 			<c:if test="${itVO.itStatus==0 || itVO.itStatus==1}"> --%>
<%-- 				<tr class="${itVO.itNo}"> --%>

<%-- 					<th>${itVO.itNo}</th> --%>

<%-- 					<jsp:useBean id="itcSvc" scope="page" --%>
<%-- 						class="com.itinerary_category.model.ItcService" /> --%>
<%-- 					<th><c:forEach var="itcVO" items="${itcSvc.all}"> --%>
<%-- 							<c:if test="${itVO.itcNo==itcVO.itcNo}"> --%>
<%-- 	                    ${itcVO.itcNo}<br> --%>
<%-- 								<font color=#8B4513>${itcVO.itcName}</font> --%>
<%-- 							</c:if> --%>
<%-- 						</c:forEach></th> --%>

<%-- 					<jsp:useBean id="ldSvc" scope="page" --%>
<%-- 						class="com.leader.model.LdService" /> --%>
<%-- 					<th><c:forEach var="ldVO" items="${ldSvc.all}"> --%>
<%-- 							<c:if test="${itVO.ldNo==ldVO.ldNo}"> --%>
<%-- 	                    ${ldVO.ldNo}<br> --%>
<%-- 								<font color=#8B4513>${ldVO.ldName}</font> --%>
<%-- 							</c:if> --%>
<%-- 						</c:forEach></th> --%>
<%-- 					<th>${itVO.itName}</th> --%>
<!-- 					<th width="120px"><img class="itimg" -->
<%-- 						src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no" --%>
<!-- 						></th> -->
<!-- 					<th width="120px"><img class="itimg" -->
<%-- 						src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no" --%>
<!-- 						></th> -->
<%-- 							<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="120" height="120"></th> --%>
<%-- 							<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="120" height="120"></th> --%>
<%-- 							<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="120" height="120"></th> --%>
<%-- 					<th>${itVO.itDays}</th> --%>
<!-- 					<th -->
<!-- 						style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis" -->
<%-- 						onmousemove="removeClassType(this)">${itVO.itText}</th> --%>
<%-- 					<th>${itVO.itPrice}</th> --%>
<%-- 					<th>${itVO.itPeolim}</th> --%>
<%-- 							<th>${itVO.itPeocount}</th> --%>
<%-- 					<th>${itVO.itDate}</th> --%>
<%-- 					<th>${itVO.itStartdate}</th> --%>
<%-- 					<th>${itVO.itEnddate}</th> --%>

<%-- 					<c:set var="status" value="${itVO.itStatus}" /> --%>
<%-- 					<c:choose> --%>
<%-- 						<c:when test="${itVO.itStatus==0}"> --%>
<!-- 							<th>下架</th> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${itVO.itStatus==1}"> --%>
<!-- 							<th>上架</th> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${itVO.itStatus==2}"> --%>
<!-- 							<th>行程結束</th> -->
<%-- 						</c:when> --%>
<%-- 						<c:when test="${itVO.itStatus==3}"> --%>
<!-- 							<th>行程取消</th> -->
<%-- 						</c:when> --%>
<%-- 					</c:choose> --%>
					
<!-- 					<th> -->
<%-- 									<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary/it.do"> --%>
<%-- 						<input type="submit" value="加入競標" class="${itVO.itNo}" --%>
<%-- 						onclick="addit(this)"> 			   <input type="hidden" name="itNo"  value="${itVO.itNo}"> --%>
<!-- 									   <input type="hidden" name="action" value="getOne_For_Update"> -->

<!-- 									</FORM> -->
<!-- 					</th> -->
<!-- 				</tr> -->
<%-- 			</c:if> --%>
<%-- 		</c:forEach> --%>
<!-- 	</table> -->
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

			$($this).parents("tr").css("background-color", "#cfd3c9");

			$(".showit").html($($this).parents("tr").html()).css(
					"background-color", "#cfd3c9").css("color","#000000");
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