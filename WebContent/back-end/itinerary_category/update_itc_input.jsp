<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.itinerary_category.model.*"%>

<% ItcVO itcVO = (ItcVO) request.getAttribute("itcVO");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<div>
<style>
	#btnUpdate {

	    width: 100px;
	    height: 45px;
	    font-size: 18px;
	    border-radius: 10px;
	    border:1px solid #26BEC9;
	    background-color: #26BEC9;
	    color: #fff;
	    opacity: 0.7;
	}	
</style>
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
		<td>行程類別編號:<font color=red><b>*</b></font></td>
		<td><%=itcVO.getItcNo()%></td>
	</tr>
	<tr>
		<td>類別名稱:</td>
		<td><input type="text" name="itcName" size="32" value="<%=itcVO.getItcName()%>"></td>
	</tr>
	<tr>
		<td>
		<input type="hidden" name="action" value="update">
		<input type="hidden" name="itcNo" value="<%=itcVO.getItcNo()%>">
		<input id="btnUpdate" type="submit" value="送出修改" >	
		</td>
	</tr>	
</table>
</form>
</div>
</html>