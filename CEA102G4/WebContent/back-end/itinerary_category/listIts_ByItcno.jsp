<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>
<style>
</style>
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
		<div class="col-md-11">
			<div class="card">
				<div class="card-header">
					<h4 class="card-title">行程類別</h4>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table">
							<thead class=" text-primary">
										
										<th>類別</th>
										<th>行程</th>
										<th>領隊</th>
<!-- 										<th>首圖</th> -->
										<th style="width: 330px;">介紹</th>
										<th>費用</th>
										<th>人數上限</th>
										<th>目前人數</th>
										<th>出發日期</th>
										<th>報名起始日</th>
										<th>報名結束日</th>
										<th>狀態</th>
							</thead>
							<tbody>														
								<c:forEach var="itVO" items="${listIts_ByItcno}" >
								<tr>		
										<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
									<th><c:forEach var="itcVO" items="${itcSvc.all}">			
							            <c:if test="${itVO.itcNo==itcVO.itcNo}">
								                    ${itcVO.itcNo}<br><font color=#8B4513>${itcVO.itcName}</font>
							             </c:if>
							       		</c:forEach>
							       	</th>
							        <th>${itVO.itNo}<br><font color=#8B4513>${itVO.itName}</font></th>
							        <jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
							        <th><c:forEach var="ldVO" items="${ldSvc.all}">
											
							            <c:if test="${itVO.ldNo==ldVO.ldNo}">
								                    ${ldVO.ldNo}<br><font color=#8B4513>${ldVO.ldName}</font>
							             </c:if>
							       		</c:forEach>
							       	</th>		
									
<%-- 									<td><img src="<%= request.getContextPath()%>/itinerary/itPic.do?itNo=${itVO.itNo}" width="120" height="120"></td> --%>
									<th>${itVO.itText}</th>
									<th>$${itVO.itPrice}</th>
									<th>${itVO.itPeolim}</th>
									<th>${itVO.itPeocount}</th>
									<th>${itVO.itDate}</th>
									<th>${itVO.itStartdate}</th>
									<th>${itVO.itEnddate}</th>
<%-- 									<th>${itVO.itStatus}</th> --%>
									<c:set var="status" value="${itVO.itStatus}"/>
										<c:choose>
									    <c:when test="${itVO.itStatus==0}">
									       <th style="color:red;">下架</th>
									    </c:when>
									    <c:when test="${itVO.itStatus==1}">
									       <th style="color:red;">上架</th>
									    </c:when>
									     <c:when test="${itVO.itStatus==2}">
									       <th style="color:red;">完成</th>
									    </c:when>
									    <c:when test="${itVO.itStatus==3}">
									       <th style="color:red;">取消</th>
									    </c:when>
			
										</c:choose>																			
								</tr>
								</c:forEach>
							</tbody>													
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


</div>
</html>