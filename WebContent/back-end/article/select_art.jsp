<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.member.controller.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.artcount.model.*"%>
<%
	ArticleService artSvc = new ArticleService();
	List<ArticleVO> list = artSvc.getAll();
	pageContext.setAttribute("list", list);
%>

<jsp:useBean id="member" class="com.member.model.MemberService" />
<jsp:useBean id="artCount" class="com.artcount.model.ArtCountService" />
<jsp:useBean id="artcSvc" class="com.artc.model.ArtcService" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>瀏覽文章頁面</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resource/css/style3.css">

</head>
<body>
<style type="text/css">
.titlePic {
	width: 150px;
	height: 150px;
}

	table{
		font-size:18px;
	}
	th{
		font-size:18px!important;
	}
	div.col-md-11 {
	    margin: 20px 65px 0 65px;
	}
	
	#talebtn{
		margin:10px 0 20px 70px;
	}
 	.btnArt { 
 	    margin-left: 50px; 
 	    width: 120px; 
 	    height: 50px; 
	    font-size: 18px; 
 	    border-radius: 8px; 
   	    background-color: #26BEC9;  
 	    color: #000; 
  	    opacity: 0.7;  
 		transition: box-shadow .3s; 
 		border: none;
		border-bottom: 2px solid #ccc;
 	}	 

 	.btnArt:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 		 text-decoration: none!important; 
 		 opacity: 1;  
 	} 
	
 	.btnArtAdd{ 
 	    margin-left: 70px; 
 	    width: 150px; 
 	    height: 50px; 
 	    font-size: 18px; 
 	    border-radius: 10px; 
 	    border:1px solid #26BEC9; 
 	    background-color: #26BEC9; 
 	    color: #fff; 
  	    opacity: 0.8;  
 		transition: box-shadow .3s; 
 		border: 1px solid #ccc; 
 		margin-top:30px; 
 	}	 
	
 		.btnBid:hover{ 
 		 box-shadow: 0 0 11px rgba(33,33,33,.3);  
 	} 
		#pageArt{
			margin-left:1300px;
		}

		a{
			font-size: 18px;
		}
</style>
	
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">請修正以下錯誤:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<%
		session.setAttribute("location", request.getServletPath());
		MemberVO memberVO = (MemberVO) session.getAttribute("account");
		request.setAttribute("memberVO", memberVO);
	%>



	<div class="content">
		<div class="row">
			<div class="col-md-11">
				<div class="card">
					<div class="card-header">
						<h4 class="card-title">文章列表</h4>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead class=" text-primary">
									<tr>
										<th>文章分類</th>
										<th>文章封面</th>
										<th>文章標題</th>
										<th>發文時間</th>
										<th style="text-align: center">點讚數</th>
										<th style="text-align: center">文章狀態</th>
									</tr>
								</thead>
								<tbody>
								<%@ include file="page1.file"%>
									<c:forEach var="ArticleVO" items="${list}" varStatus="art"
										begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
										<tbody>
										<tr>
											<td><c:forEach var="artcVO" items="${artcSvc.all}">
													<c:if test="${ArticleVO.artcNo==artcVO.artcNo}">
	                    ${artcVO.artcName} 
                    </c:if>
												</c:forEach></td>
											<td><img class="titlePic"
												src="<%=request.getContextPath()%>/art/artpic.do${ArticleVO.picSrc}"></td>
											<td><A
												href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${ArticleVO.artNo}">${ArticleVO.artTitle}</a></td>
											<c:set var="string1" value="${ArticleVO.artTime}" />
											<c:set var="string2"
												value="${fn:substringBefore(string1,'.0')}" />
											<c:set var="string3"
												value="${fn:substringAfter(string2,'2021-')}" />
											<td>${string2}</td>


											<td style="text-align: center">${artCount.getArtCount(ArticleVO.artNo)}</td>
											<td style="text-align: center"><c:if
													test="${ArticleVO.artStatus==1}">正常</c:if> <c:if
													test="${ArticleVO.artStatus==2}">隱藏中</c:if></td>


											<td style="text-align: center"><c:if
													test="${ArticleVO.artStatus==1}">
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>/back-end/art/ArticleBack	"
														style="margin-bottom: 0px;">
														<input class="btnArt" type="submit" value="隱藏此文章"> <input
															type="hidden" name="artNo" value="${ArticleVO.artNo}">
														<input type="hidden" name="artStatus" value="2"> <input
															type="hidden" name="action" value="updateStatus">
													</FORM>
												</c:if> <c:if test="${ArticleVO.artStatus==2}">
													<FORM METHOD="post"
														ACTION="<%=request.getContextPath()%>/back-end/art/ArticleBack"
														style="margin-bottom: 0px;">
														<input class="btnArt" type="submit" value="顯示文章"> <input
															type="hidden" name="artNo" value="${ArticleVO.artNo}">
														<input type="hidden" name="artStatus" value="1"> <input
															type="hidden" name="action" value="updateStatus">
													</FORM>
												</c:if></td>

											<!-- 					<td> -->
											<!-- 					<FORM METHOD="post" -->
											<%-- 					ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;"> --%>
											<!-- 					<input type="submit" value="修改">  -->
											<%-- 					<input type="hidden" name="artNo" value="${ArticleVO.artNo}"> --%>
											<!-- 				    <input type="hidden" name="action" value="getOne_For_Update"> -->
											<!-- 					</FORM> -->
											<!-- 					</td> -->
											<!-- 					<td> -->
											<!-- 						<FORM METHOD="post" -->
											<%-- 							ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;"> --%>
											<!-- 							<input type="submit" value="刪除"> <input type="hidden" -->
											<%-- 								name="artNo" value="${ArticleVO.artNo}"> <input --%>
											<!-- 								type="hidden" name="action" value="delete"> -->
											<!-- 						</FORM> -->
											<!-- 					</td> -->
										</tr>
										</tbody>
									</c:forEach>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<div id="pageArt">
<%@ include file="page2.file"%>

</div>	












<!-- 	<div id=artback> -->
<!-- 	<table style="display: inline-table" border="solid" width="1000px" > -->
<!-- 		<tr> -->

<!-- 			<th>文章分類</th> -->
<!-- 			<th>文章封面</th> -->
<!-- 			<th>文章標題</th> -->
<!-- 			<th>發文時間</th> -->
<!-- 			<th style="text-align: center">點讚數</th> -->
<!-- 			<th style="text-align: center">文章狀態</th> -->
<!-- 			<th></th> -->
<!-- 		</tr> -->
	
<%-- 		<c:forEach var="ArticleVO" items="${list}" varStatus="art" --%>
<%-- 			begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>"> --%>

<!-- 				<tr> -->
<%-- 					<td><c:forEach var="artcVO" items="${artcSvc.all}"> --%>
<%-- 							<c:if test="${ArticleVO.artcNo==artcVO.artcNo}"> --%>
<%-- 	                    ${artcVO.artcName}  --%>
<%--                     </c:if> --%>
<%-- 						</c:forEach></td> --%>
<!-- 					<td><img class="titlePic" -->
<%-- 						src="<%=request.getContextPath()%>/art/artpic.do${ArticleVO.picSrc}"></td> --%>
<!-- 					<td><A -->
<%-- 						href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${ArticleVO.artNo}">${ArticleVO.artTitle}</a></td> --%>
<%-- 							<c:set var="string1" value="${ArticleVO.artTime}" /> --%>
<%-- 							<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" /> --%>
<%-- 							<c:set var="string3" value="${fn:substringAfter(string2,'2021-')}" /> --%>
<%-- 					<td>${string2} </td> --%>
							
				
<%-- 					<td style="text-align: center">${artCount.getArtCount(ArticleVO.artNo)}</td> --%>
<!-- 					<td style="text-align: center"> -->
<%-- 						<c:if test="${ArticleVO.artStatus==1}">正常</c:if> --%>
<%-- 						<c:if test="${ArticleVO.artStatus==2}">隱藏中</c:if> --%>
<!-- 					</td> -->
			
		
<!-- 					<td style="text-align: center"> -->
<%-- 						<c:if test="${ArticleVO.artStatus==1}"> --%>
<!-- 						<FORM METHOD="post" -->
<%-- 							ACTION="<%=request.getContextPath()%>/back-end/art/ArticleBack	" style="margin-bottom: 0px;"> --%>
<!-- 							<input type="submit" value="隱藏此文章"> -->
<%-- 							 <input type="hidden"name="artNo" value="${ArticleVO.artNo}">  --%>
<!-- 							 <input type="hidden"name="artStatus" value="2">  -->
<!-- 							 <input type="hidden" name="action" value="updateStatus"> -->
<!-- 						</FORM> -->
<%-- 						</c:if> --%>
				
<%-- 					<c:if test="${ArticleVO.artStatus==2}"> --%>
<!-- 						<FORM METHOD="post" -->
<%-- 							ACTION="<%=request.getContextPath()%>/back-end/art/ArticleBack" style="margin-bottom: 0px;"> --%>
<!-- 							<input type="submit" value="顯示文章"> -->
<%-- 							 <input type="hidden"name="artNo" value="${ArticleVO.artNo}">  --%>
<!-- 							 <input type="hidden"name="artStatus" value="1">  -->
<!-- 							 <input type="hidden" name="action" value="updateStatus"> -->
<!-- 						</FORM> -->
<%-- 						</c:if> --%>
<!-- 					</td> -->
					
				
<!-- 					<td> -->
<!-- 					<FORM METHOD="post" -->
<%-- 					ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;"> --%>
<!-- 					<input type="submit" value="修改">  -->
<%-- 					<input type="hidden" name="artNo" value="${ArticleVO.artNo}"> --%>
<!-- 				    <input type="hidden" name="action" value="getOne_For_Update"> -->
<!-- 					</FORM> -->
<!-- 					</td> -->
<!-- 					<td> -->
<!-- 						<FORM METHOD="post" -->
<%-- 							ACTION="<%=request.getContextPath()%>/art/art.do" style="margin-bottom: 0px;"> --%>
<!-- 							<input type="submit" value="刪除"> <input type="hidden" -->
<%-- 								name="artNo" value="${ArticleVO.artNo}"> <input --%>
<!-- 								type="hidden" name="action" value="delete"> -->
<!-- 						</FORM> -->
<!-- 					</td> -->
			

<!-- 				</tr> -->
			

<%-- 		</c:forEach> --%>

<!-- 	</table> -->
<!-- </div>	 -->
<!-- 	<br> -->
<%-- 	<%@ include file="page2.file"%> --%>




</body>
</html>