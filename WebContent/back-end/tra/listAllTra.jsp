<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.tra.model.*"%>
link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<%
    TraService traSvc = new TraService();
    List<TraVO> list = traSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有錢包交易紀錄 - listAllTra.jsp</title>


</head>
<body>

<!-- <a -->
<%-- 		href="${pageContext.request.contextPath}/back-end/grep/select_page.jsp">回到商品檢舉頁</a> --%>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

	<table class="table table-hover">


		<%@ include file="page1.file"%>
		<thead class="thead-dark">
	<tr>
		<th><h5>交易編號</th>
		<th><h5>會員編號</th>
		<th><h5>交易時間</th>
		<th><h5>交易金額</th>
		<th><h5>交易行為</th>
		<th><h5>處理狀況</th>
		<th><h5>修改</th>
	</tr>
	
	<c:forEach var="traVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
	
	<tbody>
		<tr ${(traVO.tra_no==param.tra_no) ? 'bgcolor=#CCCCFF':''}>
		<th>${traVO.tra_no}</th>
		<td>${traVO.mem_id}</td>
		<td>${traVO.tra_time}</td>
		<td>${traVO.tra_price}</td>
		<td>
		<c:if test="${traVO.tra_action==0}">提領</c:if>
		<c:if test="${traVO.tra_action==1}">儲值</c:if>
		</td>	
		<td>
		<c:if test="${traVO.tra_status ==0}">未處理</c:if>
		<c:if test="${traVO.tra_status ==1}">成功</c:if>
		<c:if test="${traVO.tra_status ==2}">失敗</c:if>
		</td>
			<td>
			 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/tra/tra.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>">
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			     <input type="hidden" name="tra_no"  value="${traVO.tra_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
		</tr>
		</tbody>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>