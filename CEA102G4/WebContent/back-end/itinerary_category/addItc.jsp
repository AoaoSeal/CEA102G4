<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary_category.model.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<div>
<style>
	#btnInsert {

	    width: 100px;
	    height: 45px;
	    font-size: 18px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
	    opacity: 0.7;
	    margin-left: 20px;
	}	
	
	btnInsert{
		width:180px;
	}
	
	td {
		font-size:18px;
	}
	
</style>
<% ItcVO itcVO = (ItcVO) request.getAttribute("itcVO");%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>		
			</c:forEach>
		</ul>
	</c:if>

<FORM METHOD="post" ACTION="<%= request.getContextPath()%>/back-end/itinerary_category/itc.do">
<table>
	<tr>
		<td>類別名稱:　</td>
		<td><input type="text" name="itcName" size="32"></td>
		<td><input type="hidden" name="action" value="insert">
			<input id="btnInsert" type="submit" value="新增"></td>
	</tr>
</table>
</FORM>	
</div>
</html>