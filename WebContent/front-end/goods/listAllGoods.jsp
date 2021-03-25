<%@page import="com.member.model.MemberVO"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.goods.model.*"%>
<%@ page import="com.member.model.*"%>

<%
HttpSession sess = request.getSession();
if (sess.getAttribute("memberVO") == null) {
	RequestDispatcher failureView = request.getRequestDispatcher("/front-end/front_end_index.jsp");
	failureView.forward(request, response);
	return;
}
GoodsVO goodsVO = (GoodsVO) request.getAttribute("goodsVO");
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
%>

<%
GoodsService goodsSvc = new GoodsService();
List<GoodsVO> list = goodsSvc.getAll3(memberVO.getMemId());
pageContext.setAttribute("list", list);
%>




<html>
<body>
	<!-- 每個front-end頁面都要有這行code -->
	<%
	String uri = request.getServletPath();
	System.out.println("jsp=" + uri);
	request.getSession().setAttribute("uri", uri);
	%>
	<!-- 每個front-end頁面都要有這行code -->
	<!-- <link rel="stylesheet" type="text/css" -->
	<!-- 	href="https://unpkg.com/ress/dist/ress.min.css -->
	<!-- "> -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">
	<div></div>


	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
		crossorigin="anonymous">

	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">所有商品</h2>
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
					<th>商品編號</th>
					<th>會員編號</th>
					<th>商品名稱</th>
					<th>商品類別</th>
					<th>上架日期</th>
					<th>價格</th>
					<th>數量</th>
					<th>商品圖片</th>
					<th>商品狀況</th>
					<th>商品上架狀態</th>
					<th>查看詳情</th>
					<th>修改</th>
					<th>刪除</th>
				</tr>
			</thead>
			<jsp:useBean id="gcSvc" scope="page" class="com.gc.model.GcService" />
			<%@ include file="page1.file"%>
			<div style="position: relative; right: 0; "><a  class="btn btn-primary mb"
				href='<%=request.getContextPath()%>/front-end/goods/addGoods.jsp'>新增商品</a></div>
			<c:forEach var="goodsVO" items="${list}" begin="<%=pageIndex%>"
				end="<%=pageIndex+rowsPerPage-1%>">
				<tr ${(goodsVO.gd_no==param.gd_no) ? 'bgcolor=#CCCCFF':''}>

					<td>${goodsVO.gd_no}</td>
					<td>${goodsVO.mem_id}</td>
					<td>${goodsVO.gd_name}</td>
					<td><c:forEach var="gcVO" items="${gcSvc.all}">
							<c:if test="${goodsVO.gc_no==gcVO.gc_no}">
	                    ${gcVO.gc_name}
                    </c:if>
						</c:forEach></td>
					<td>${goodsVO.gd_date}</td>
					<td>${goodsVO.gd_price}</td>
					<td>${goodsVO.gd_qty}</td>
					<td><img height="150" width="150" id="imgs"
						src="<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
		data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>"></td>
					<td><c:if test="${goodsVO.gd_status ==0}">全新</c:if> <c:if
							test="${goodsVO.gd_status ==1}">二手</c:if></td>
					<td><c:if test="${goodsVO.gd_shelf ==0}">下架</c:if> <c:if
							test="${goodsVO.gd_shelf ==1}">上架</c:if>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="查看詳情"> <input type="hidden"
								name="gd_no" value="${goodsVO.gd_no}"> <input
								type="hidden" name="action" value="getOne_For_Display">
						</FORM>
					</td>

					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="修改"> <input type="hidden"
								name="gd_no" value="${goodsVO.gd_no}"> <input
								type="hidden" name="requestURL"
								value="<%=request.getServletPath()%>"> <input
								type="hidden" name="whichPage" value="<%=whichPage%>"> <input
								type="hidden" name="action" value="getOne_For_Update">
						</FORM>
					</td>
					<td>
						<FORM METHOD="post"
							ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do"
							style="margin-bottom: 0px;">
							<input type="submit" value="刪除"> <input type="hidden"
								name="gd_no" value="${goodsVO.gd_no}"> <input
								type="hidden" name="requestURL"
								value="<%=request.getServletPath()%>"> <input
								type="hidden" name="whichPage" value="<%=whichPage%>"> <input
								type="hidden" name="action" value="delete">
						</FORM>
					</td>
				</tr>
			</c:forEach>
		</table>
	</section>
	<%@ include file="page2.file"%>
</body>
</html>