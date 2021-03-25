<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.or.model.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
OrVO orVO = (OrVO) request.getAttribute("orVO");
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
OrService orSvc = new OrService();
List<OrVO> list = orSvc.getAll3(memberVO.getMemId());
pageContext.setAttribute("list", list);
%>

<html>
<head>
<title>所有訂單資料 - listAllOr.jsp</title>


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
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">


	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">所有訂單</h2>
		</div>

		<%-- 錯誤表列 --%>
		<c:if test="${not empty errorMsgs}">
			<font style="color: red">請修正以下錯誤:</font>
			<ul>
				<c:forEach var="message" items="${errorMsgs}">
					<li style="color: red">${message}</li>
				</c:forEach>
			</ul>
		</c:if>

		<table class="table align-middle  table-hover">
			<thead>
				<tr>
					<th>訂單編號</th>
					<th>會員編號</th>
					<th>訂購人</th>
					<th>總金額</th>
					<th>電話</th>
					<th>地址</th>
					<th>下單日期</th>
					<th>訂單狀況</th>
					<th>修改</th>
					<th>查看商品詳情</th>
					<th>檢舉賣家</th>
				</tr>
			</thead>
			<tbody>
				<jsp:useBean id="gdSvc" scope="page"
					class="com.goods.model.GoodsService" />
				<%@ include file="page1.file"%>
				<c:forEach var="orVO" items="${list}" begin="<%=pageIndex%>"
					end="<%=pageIndex+rowsPerPage-1%>">
					<tr ${(orVO.or_no==param.or_no) ? 'bgcolor=#CCCCFF':''}>
					<tr>
					<tr>
						<td>${orVO.or_no}</td>
						<td>${orVO.mem_id}</td>
						<td>${orVO.or_name}</td>
						<td>${orVO.or_price}</td>
						<td>${orVO.or_phone}</td>
						<td>${orVO.or_address}</td>
						<td>${orVO.or_time}</td>
						<td><c:if test="${orVO.or_status ==0}">未出貨</c:if> <c:if
								test="${orVO.or_status ==1}">已出貨</c:if> <c:if
								test="${orVO.or_status ==2}">已取貨</c:if> <c:if
								test="${orVO.or_status ==3}">需換貨</c:if> <c:if
								test="${orVO.or_status ==4}">退貨</c:if>
							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
								name="form1" enctype="multipart/form-data">
								<input type="hidden" name="or_no" value="${orVO.or_no}">
								<input type="hidden" name="mem_id" value="${orVO.mem_id}">
								<input type="hidden" name="or_name" value="${orVO.or_name}">
								<input type="hidden" name="or_price" value="${orVO.or_price}">
								<input type="hidden" name="or_phone" value="${orVO.or_phone}">
								<input type="hidden" name="or_address"
									value="${orVO.or_address}"> <input type="hidden"
									name="or_time" value="${orVO.or_time}"> <input
									type="hidden" name="gd_no" value="${orVO.gd_no}"> <input
									type="hidden" name=or_status value=2> <input
									type="hidden" name="action" value="shiped">
								<c:if test="${orVO.or_status ==1}">
									<input type="submit" value="取貨">
								</c:if>
								<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="whichPage" value="<%=whichPage%>">
							</form>
							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
								name="form1" enctype="multipart/form-data">
								<input type="hidden" name="or_no" value="${orVO.or_no}">
								<input type="hidden" name="mem_id" value="${orVO.mem_id}">
								<input type="hidden" name="or_name" value="${orVO.or_name}">
								<input type="hidden" name="or_price" value="${orVO.or_price}">
								<input type="hidden" name="or_phone" value="${orVO.or_phone}">
								<input type="hidden" name="or_address"
									value="${orVO.or_address}"> <input type="hidden"
									name="or_time" value="${orVO.or_time}"> <input
									type="hidden" name="gd_no" value="${orVO.gd_no}"> <input
									type="hidden" name=or_status value=3> <input
									type="hidden" name="action" value="shiped">
								<c:if test="${orVO.or_status ==2}">
									<input type="submit" value="換貨">
								</c:if>
								<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="whichPage" value="<%=whichPage%>">
							</form>

							<form METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
								name="form1" enctype="multipart/form-data">
								<input type="hidden" name="or_no" value="${orVO.or_no}">
								<input type="hidden" name="mem_id" value="${orVO.mem_id}">
								<input type="hidden" name="or_name" value="${orVO.or_name}">
								<input type="hidden" name="or_price" value="${orVO.or_price}">
								<input type="hidden" name="or_phone" value="${orVO.or_phone}">
								<input type="hidden" name="or_address"
									value="${orVO.or_address}"> <input type="hidden"
									name="or_time" value="${orVO.or_time}"> <input
									type="hidden" name="gd_no" value="${orVO.gd_no}"> <input
									type="hidden" name=or_status value=4> <input
									type="hidden" name="action" value="shiped">
								<c:if test="${orVO.or_status ==2}">
									<input type="submit" value="退貨">
								</c:if>
								<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="whichPage" value="<%=whichPage%>">
							</form></td>

						<td>
							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
								style="margin-bottom: 0px;">
								<c:if test="${orVO.or_status ==0}">
									<input type="submit" value="修改">
								</c:if>
								<c:if test="${orVO.or_status !=0}">
									<input type="submit" value="無法修改" disabled>
								</c:if>
								<input type="hidden" name="requestURL"
									value="<%=request.getServletPath()%>"> <input
									type="hidden" name="whichPage" value="<%=whichPage%>">
								<input type="hidden" name="or_no" value="${orVO.or_no}">
								<input type="hidden" name="action" value="getOne_For_Update">
							</FORM>
						</td>
						<td>

							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
								style="margin-bottom: 0px;">
								<input type="submit" value="查看商品詳情"> <input
									type="hidden" name="gd_no" value="${orVO.gd_no}"> <input
									type="hidden" name="action" value="findGoods">
							</FORM>
						</td>

						<td>


							<FORM METHOD="post"
								ACTION="<%=request.getContextPath()%>/front-end/srep/srep.do"
								style="margin-bottom: 0px;">
								<input type="hidden" name="or_no" value="${orVO.or_no}">
								<input type="submit" value="檢舉賣家"> <input type="hidden"
									name="action" value="findGoodsSrep">
							</FORM>
						</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
		<%@ include file="page2.file"%>
</body>
</html>