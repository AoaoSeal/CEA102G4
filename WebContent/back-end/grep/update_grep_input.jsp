<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.grep.model.*"%>

<%
  GrepVO grepVO = (GrepVO) request.getAttribute("grepVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>檢舉商品資料修改 - update_grep_input.jsp</title>

<script>

	</script>
<script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
$(function() {
  // This button will increment the value
  $('.qtyplus').click(function(e) {
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    fieldName = $(this).attr('field');
    // Get its current value
    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
    // If is not undefined
    if (!isNaN(currentVal)) {
      // Increment
      $('input[name=' + fieldName + ']').val(currentVal + 1);
    } else {
      // Otherwise put a 0 there
      $('input[name=' + fieldName + ']').val(1);
    }
  });
  // This button will decrement the value till 0
  $(".qtyminus").click(function(e) {
    // Stop acting like a button
    e.preventDefault();
    // Get the field name
    fieldName = $(this).attr('field');
    // Get its current value
    var currentVal = parseInt($('input[name=' + fieldName + ']').val());
    // If it isn't undefined or its greater than 0
    if (!isNaN(currentVal) && currentVal > 1) {
      // Decrement one
      $('input[name=' + fieldName + ']').val(currentVal - 1);
    } else {
      // Otherwise put a 0 there
      $('input[name=' + fieldName + ']').val(1);
    }
  });
});
</script>
</head>
<body borolor='white'>
<!-- 每個back-end頁面都要有這行code -->
<%   
String uri = request.getServletPath();
System.out.println("jsp="+uri);
request.getSession().setAttribute("uri",uri);
 %>
<!-- 每個back-end頁面都要有這行code -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	
		<div class="title">
			<h2 class="titleText">檢舉商品</h2>
		</div>

<h3><td>會員:</td>
		<td><%=grepVO.getMem_id()%></td></h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form METHOD="post" ACTION="grep.do" name="form1" enctype="multipart/form-data" style="margin: 0px auto;">

		<tr>
		<td>檢舉編號:<font color=red><b>*</b></font></td>
		<td><%=grepVO.getGrep_no()%></td>
		
		</tr>
		<input type="hidden" name="mem_id" value="<%=grepVO.getMem_id()%>">
		<jsp:useBean id="gdSvc" scope="page" class="com.grep.model.GrepService" />
		
		<p>
			<label for="select">商品編號:</label> 
			<input type="hidden" name="gd_no" value="<%=grepVO.getGd_no()%>">
			<%=grepVO.getGd_no()%>
		</p>
		
		<p>
			<label for="input">檢舉狀態:</label> <input type="radio" name="grep_status" id="status1" value="0" <%=(grepVO.getGrep_status() == 0) ? "checked" : ""%>>未處理
			<input type="radio" name="grep_status"  id="status2" value="1" <%=(grepVO.getGrep_status() == 1) ? "checked" : ""%>>已處理
		</p>

		<p>
			<label for="textarea">檢舉事由:</label>
			<textarea id="textarea" name="grep_text" rows="3" style="margin: 0px; width: 500px; height: 250px;"
			readonly><%=(grepVO == null) ? "" : grepVO.getGrep_text()%></textarea>
		</p>
		<p>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="grep_no" value="<%=grepVO.getGrep_no()%>">
			<input type="submit" value="確認"> 
			<input type="reset" value="重設">
		</p>

</form>
</body>
</html>