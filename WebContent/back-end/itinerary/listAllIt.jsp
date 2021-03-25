<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary.model.*"%>
<% 
	ItService itSvc = new ItService();
	List<ItVO> list = itSvc.getAll();
	pageContext.setAttribute("list", list);
%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<style>
	<style>
	
	table{
		font-size:16px;
	}
	th{
		font-size:16px!important;
	}
	div.col-md-12 {
	    margin: 20px 65px 0 65px;
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
	
 	.btnBidAdd{ 
 	    margin-left: 70px; 
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
 		margin-top:30px; 
 	}	 
	
 		.btnBid:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 	} 
	
	#pageHead{
		margin-left:-400px;
		font-size:16px;
		color:#666666;
	}
	#pageFoot{
		margin-left:1300px!important;
		font-size:16px;
		color:#666666;
	}

</style>
</head>
<body>


<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>


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
									<tr>
										<th>編號</th>
										<th>類別</th>
										<th>領隊</th>
										<th>名稱</th>
										<th>首圖1</th>
										<th>首圖2</th>
										<th>首圖3</th>
										<th>首圖4</th>
										<th>首圖5</th>
										<th>天數</th>
										<th>介紹</th>
										<th>費用</th>
										<th>人數上限</th>
										<th>目前人數</th>
										<th>出發日期</th>
										<th>報名起始日</th>
										<th>報名結束日</th>
										<th>狀態</th>
									</tr>
								</thead>
								<tbody>
									<div id="pageHead"><%@ include file="/resource/file/page1.file"%></div>			

									<c:forEach var="itVO" items="${list}" begin="<%=pageIndex%>"
										end="<%=pageIndex+rowsPerPage-1%>">
										<tr ${(itVO.itNo==param.itNo)? 'bgcolor=#cfd3c9':''}>

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
											<th width="120px"><img
												src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no"
												width="120" height="120"></th>
											<th width="120px"><img
												src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no"
												width="120" height="120"></th>
											<th width="120px"><img
												src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no"
												width="120" height="120"></th>
											<th>${itVO.itDays}</th>
											<th
												style="white-space: nowrap; overflow: hidden; text-overflow: ellipsis"
												onmousemove="removeClassType(this)">${itVO.itText}</th>
											<th>${itVO.itPrice}</th>
											<th>${itVO.itPeolim}</th>
											<th>${itVO.itPeocount}</th>
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
											<th>${itVO.itStatus}</th>
											<th>
												<FORM METHOD="post"
													ACTION="<%=request.getContextPath()%>/back-end/itinerary/it.do">
													<input type="submit" value="修改"> <input
														type="hidden" name="itNo" value="${itVO.itNo}"> <input
														type="hidden" name="action" value="getOne_For_Update">
												</FORM>
											</th>
										</tr>
									</c:forEach>
							</table>
							<div id="pageFoot"><%@ include file="/resource/file/page2.file"%></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
















	<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<td align="center"> -->
<!-- 			 <h3>所有行程列表</h3> -->
<%-- 			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp"> --%>
<!-- 					<input type="submit" value="回首頁"> -->
<!-- 			</FORM> -->
<!-- 		</td> -->
<!-- 		<td> -->
<%-- 			<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>			 --%>
<!-- 		</td> -->
<!-- 	</tr> -->
<!-- </table> -->



<!-- <table id="tab1" style="table-layout: fixed;"> -->
<!-- 	<tr> -->
<!-- 		<th>編號</th> -->
<!-- 		<th>類別</th> -->
<!-- 		<th>領隊</th> -->
<!-- 		<th>名稱</th> -->
<!-- 		<th>首圖1</th> -->
<!-- 		<th>首圖2</th> -->
<!-- 		<th>首圖3</th> -->
<!-- 		<th>首圖4</th> -->
<!-- 		<th>首圖5</th> -->
<!-- 		<th>天數</th> -->
<!-- 		<th>介紹</th> -->
<!-- 		<th>費用</th> -->
<!-- 		<th>人數上限</th> -->
<!-- 		<th>目前人數</th> -->
<!-- 		<th>出發日期</th> -->
<!-- 		<th>報名起始日</th> -->
<!-- 		<th>報名結束日</th> -->
<!-- 		<th>狀態</th> -->
<!-- 	</tr> -->

<%-- 	<%@ include file="/resource/file/page1.file" %> --%>

<%-- 	<c:forEach var="itVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>
<%-- 	<tr ${(itVO.itNo==param.itNo)? 'bgcolor=#cfd3c9':''}> --%>
	
<%-- 		<th>${itVO.itNo}</th> --%>
		
<%-- 		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" /> --%>
<%-- 		<th><c:forEach var="itcVO" items="${itcSvc.all}">			 --%>
<%--             <c:if test="${itVO.itcNo==itcVO.itcNo}"> --%>
<%-- 	                    ${itcVO.itcNo}<br><font color=#8B4513>${itcVO.itcName}</font> --%>
<%--              </c:if> --%>
<%--         </c:forEach></th> --%>
		
<%-- 		 <jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" /> --%>
<%-- 		<th><c:forEach var="ldVO" items="${ldSvc.all}">				 --%>
<%--             <c:if test="${itVO.ldNo==ldVO.ldNo}"> --%>
<%-- 	                    ${ldVO.ldNo}<br><font color=#8B4513>${ldVO.ldName}</font> --%>
<%--              </c:if> --%>
<%--         </c:forEach></th> --%>
<%-- 		<th>${itVO.itName}</th> --%>
<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no" width="120" height="120"></th> --%>
<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no" width="120" height="120"></th> --%>
<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="120" height="120"></th> --%>
<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="120" height="120"></th> --%>
<%-- 		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="120" height="120"></th> --%>
<%-- 		<th>${itVO.itDays}</th> --%>
<%-- 		<th style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis" onmousemove="removeClassType(this)">${itVO.itText}</th> --%>
<%-- 		<th>${itVO.itPrice}</th> --%>
<%-- 		<th>${itVO.itPeolim}</th> --%>
<%-- 		<th>${itVO.itPeocount}</th> --%>
<%-- 		<th>${itVO.itDate}</th> --%>
<%-- 		<th>${itVO.itStartdate}</th> --%>
<%-- 		<th>${itVO.itEnddate}</th> --%>
		
<%-- 		<c:set var="status" value="${itVO.itStatus}"/> --%>
<%-- 		<c:choose> --%>
<%-- 	    <c:when test="${itVO.itStatus==0}"> --%>
<!-- 	       <th>下架</th> -->
<%-- 	    </c:when> --%>
<%-- 	    <c:when test="${itVO.itStatus==1}"> --%>
<!-- 	       <th>上架</th> -->
<%-- 	    </c:when> --%>
<%-- 	     <c:when test="${itVO.itStatus==2}"> --%>
<!-- 	       <th>行程結束</th> -->
<%-- 	    </c:when> --%>
<%-- 	    <c:when test="${itVO.itStatus==3}"> --%>
<!-- 	       <th>行程取消</th> -->
<%-- 	    </c:when> --%>
<%-- 		</c:choose> --%>
<%-- 		<th>${itVO.itStatus}</th> --%>
<!-- 		<th> -->
<%-- 			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary/it.do"> --%>
<!-- 				<input type="submit" value="修改">			    -->
<%-- 				<input type="hidden" name="itNo"  value="${itVO.itNo}"> --%>
<!-- 				<input type="hidden" name="action" value="getOne_For_Update">			    -->
<!-- 			</FORM> -->
<!-- 		</th>		 -->
<!-- 	</tr>	 -->
<%-- 	</c:forEach> --%>
<!-- </table> -->
<%-- <%@ include file="/resource/file/page2.file" %> --%>

<script>
function removeClassType($this) {
    $($this).attr("title",$this.innerText);
}
</script>
</body>
</html>