<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	  table {
		width: 950px;
		background-color: #F5F5DC;		
		margin-top: 1px;
		margin-bottom: 1px;
		margin-left:auto; 
		margin-right:auto;	
		border-collapse: collapse;
	  }

	  #tab1 tr,th{
	    padding: 1px;
	    border: 1px solid #ffffff;
	  }
	input[type="submit"] { padding:5px 15px; 
							background:#F5F5DC;
							border:0 none;
							cursor:pointer;
							-webkit-border-radius: 5px;
							border-radius: 5px;
						}
	#btn1 {
			padding:5px 15px; 
			background:#D2B48C;
			border:0 none;
			cursor:pointer;
			-webkit-border-radius: 5px;
			border-radius: 5px;	
	}
 	#div1{ 
 			position:absolute;
 			left:760px 
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

<table>
	<tr>
		<td align="center">
			 <h3>相關行程列表</h3>
			 <FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/select_page.jsp">
					<input type="submit" id="btn1" value="回首頁">
			</FORM>
		</td>
		<td>
			<h4><img src="<%= request.getContextPath()%>/resource/images/logo.png" width="150" height="150" border="0"></h4>			
		</td>
	</tr>
</table>

<table id="tab1">
	<tr>
		<th>編號</th>
		<th>類別</th>
		<th>領隊</th>
		<th>名稱</th>
		<th>首圖</th>
		<th>介紹</th>
		<th>費用</th>
		<th>人數上限</th>
		<th>目前人數</th>
		<th>出發日期</th>
		<th>報名起始日</th>
		<th>報名結束日</th>
		<th>狀態</th>
	</tr>

	<tr>
	<c:forEach var="itVO" items="${listIts_ByItcno}" >
		<th>${itVO.itNo}</th>		
		<jsp:useBean id="itcSvc" scope="page" class="com.itinerary_category.model.ItcService" />
		<th><c:forEach var="itcVO" items="${itcSvc.all}">			
            <c:if test="${itVO.itcNo==itcVO.itcNo}">
	                    ${itcVO.itcNo}<br><font color=#8B4513>${itcVO.itcName}</font>
             </c:if>
        </c:forEach></th>
        
        <jsp:useBean id="ldSvc" scope="page" class="com.leader.model.LdService" />
        <th><c:forEach var="ldVO" items="${ldSvc.all}">
				
            <c:if test="${itVO.ldNo==ldVO.ldNo}">
	                    ${ldVO.ldNo}<br><font color=#8B4513>${ldVO.ldName}</font>
             </c:if>
        </c:forEach></th>		
		<th>${itVO.itName}</th>
		<td><img src="<%= request.getContextPath()%>/itinerary/itPic.do?itNo=${itVO.itNo}" width="120" height="120"></td>
		<th>${itVO.itText}</th>
		<th>${itVO.itPrice}</th>
		<th>${itVO.itPeolim}</th>
		<th>${itVO.itPeocount}</th>
		<th>${itVO.itDate}</th>
		<th>${itVO.itStartdate}</th>
		<th>${itVO.itEnddate}</th>
		<th>${itVO.itStatus}</th>
	</tr>			
	</c:forEach>
</table>	

</body>
</html>