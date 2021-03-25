<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.tra.model.*"%>
<%@ page import="java.util.Date;"%>


<%
  TraVO traVO = (TraVO) request.getAttribute("traVO"); 
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>商品資料修改 - update_tra_input.jsp</title>

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
  table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
  }
  table, th, td {
    border: 0px solid #CCCCFF;
  }
  th, td {
    padding: 1px;
  }
  img {
    width:150;
    height:150;
  }
</style>
<script>



window.onload = function() {
	init();
}
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
<body bgcolor='white'>

<table id="table-1">
	<tr><td>
		 <h3>商品資料修改 - update_tra_input.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/tra/select_page.jsp"><img src="<%=request.getContextPath()%>/front-end/tra/img/tiba.png" width="150" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3><td>會員:</td>
		<td><%=traVO.getMem_id()%></td></h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<form METHOD="post" ACTION="tra.do" name="form1" enctype="multipart/form-data">
	<fieldset>
		<legend>交易修改:</legend>
		<tr>
		<td>交易編號:<font color=red><b>*</b></font></td>
		<td><%=traVO.getTra_no()%></td>
		
		</tr>
			<input type="hidden" name="mem_id" value="<%=traVO.getMem_id()%>">
		<p>
			<label for="input">交易日期:</label> ${traVO.tra_time}

		<p>
		<p>
			<label for="input">交易金額:</label>  ${traVO.tra_price}
		</p>
		<p>
			<label for="input">交易狀態:</label> <input type="radio" name="tra_status" id="status1" value="0" <%=(traVO.getTra_status() == 0) ? "checked" : ""%>>未處理
			<input type="radio" name="tra_status"  id="status2" value="1" <%=(traVO.getTra_status() == 1) ? "checked" : ""%>>成功
			<input type="radio" name="tra_status"  id="status2" value="1" <%=(traVO.getTra_status() == 2) ? "checked" : ""%>>失敗
		</p>
		<p>
			<label for="input">交易行為:</label> <input type="radio" name="tra_action" id="action1" value="0" <%=(traVO.getTra_action() == 0) ? "checked" : ""%>>提領
			<input type="radio" name="tra_action"  id="action2" value="1"  <%=(traVO.getTra_action() == 1) ? "checked" : ""%>>儲值
		</p>

		<p>
			<input type="hidden" name="action" value="update">
			<input type="hidden" name="tra_no" value="<%=traVO.getTra_no()%>">
			<input type="submit" value="確認"> 
			<input type="reset" value="重設">
		</p>

	</fieldset>
</form>
<br>

</body>

</html>