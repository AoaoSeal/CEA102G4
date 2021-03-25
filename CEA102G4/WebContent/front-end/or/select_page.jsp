<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>訂單功能</title>
</head>
<body>
<!-- 每個front-end頁面都要有這行code -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style.css">
	<div></div>
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">訂單功能頁</h2>
		</div>
<h3>資料查詢:</h3>
<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/goods/select_page.jsp'>商品</a> 商品頁面. <br><br></li>
  <li><a href='<%=request.getContextPath()%>/front-end/or/listAllOr.jsp'>List</a> all Order.  <br><br></li>
  <li><a href='<%=request.getContextPath()%>/front-end/or/listAllOr2.jsp'>賣家List</a> all Order.  <br><br></li>
  
  
<!--   <li> -->
<%--     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/or/or.do" > --%>
<!--         <b>輸入訂單編號 (如21001):</b> -->
<!--         <input type="text" name="or_no"> -->
<!--         <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--         <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->

<%--   <jsp:useBean id="orSvc" scope="page" class="com.or.model.OrService" /> --%>
   
<!--   <li> -->
<%--      <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/or/or.do" > --%>
<!--        <b>選擇訂單編號:</b> -->
<!--        <select size="1" name="or_no"> -->
<%--          <c:forEach var="orVO" items="${orSvc.all}" >  --%>
<%--           <option value="${orVO.or_no}">${orVO.or_no} --%>
<%--          </c:forEach>    --%>
<!--        </select> -->
<!--        <input type="hidden" name="action" value="getOne_For_Display"> -->
<!--        <input type="submit" value="送出"> -->
<!--     </FORM> -->
<!--   </li> -->
  
<!-- </ul> -->


<h3>訂單管理</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/or/addOr.jsp'>Add</a> a new Order.</li>
</ul>

</body>
</html>