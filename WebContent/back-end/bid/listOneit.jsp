<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.itinerary.model.*"%>


<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%-- 取出 Concroller EmpServlet.java已存入request的EmpVO物件--%>
<%ItVO itVO = (ItVO) request.getAttribute("itVO");%>



<html>
<head>
<title>員工資料 - listOneEmp.jsp</title>

<style>

  table#table-1 ,.myTable{
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h3 {
    color: black;
    display: block;
    margin: 5px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 800px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此測試頁，練習採用 Script 的寫法取值:</h4>
<table id="table-1" class="myTable">
	<tr><td>
		 <h3>員工資料 - listOneEmp.jsp</h3>
	</td></tr>
</table>

<table class="myTable">
		<tr >
	
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
		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=1&itNo=${itVO.itNo}&table=itinerary&column=it_pic&idname=it_no" width="120" height="120"></th>
		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=2&itNo=${itVO.itNo}&table=itinerary&column=it_pic2&idname=it_no" width="120" height="120"></th>
		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=3&itNo=${itVO.itNo}&table=itinerary&column=it_pic3&idname=it_no" width="120" height="120"></th>
		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=4&itNo=${itVO.itNo}&table=itinerary&column=it_pic4&idname=it_no" width="120" height="120"></th>
		<th width="120px"><img src="<%= request.getContextPath()%>/itinerary/pic.do?pic=5&itNo=${itVO.itNo}&table=itinerary&column=it_pic5&idname=it_no" width="120" height="120"></th>
		<th>${itVO.itDays}</th>
		<th style="white-space:nowrap;overflow:hidden;text-overflow: ellipsis" onmousemove="removeClassType(this)">${itVO.itText}</th>
		<th>${itVO.itPrice}</th>
		<th>${itVO.itPeolim}</th>
		<th>${itVO.itPeocount}</th>
		<th>${itVO.itDate}</th>
		<th>${itVO.itStartdate}</th>
		<th>${itVO.itEnddate}</th>
		
		<c:set var="status" value="${itVO.itStatus}"/>
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
			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/itinerary/it.do">
				<input type="submit" value="修改">			   
			   <input type="hidden" name="itNo"  value="${itVO.itNo}">
			   <input type="hidden" name="action" value="getOne_For_Update">
			   
			</FORM>
		</th>		
	</tr>	
</table>

</body>
</html>