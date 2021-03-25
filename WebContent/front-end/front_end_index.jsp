<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.artcount.model.*"%>

<c:set var="home" value=""></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:useBean id="memberSvc" class="com.member.model.MemberService" />
<jsp:useBean id="artCount" class="com.artcount.model.ArtCountService" />
<jsp:useBean id="artcSvc" class="com.artc.model.ArtcService" />
<jsp:useBean id="bidSvc" scope="page" class="com.bid.model.BidService" />

<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet"
		href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

	<!-- jQuery library -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

	<!-- Popper JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

	<!-- Latest compiled JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>



	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style.css">
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/style2.css">


	<%
		String uri = request.getServletPath();
		System.out.println("jsp=" + uri);
		request.getSession().setAttribute("uri", uri);
	%>

	<input id="openindex" type="hidden" name="openindex" value="home" />
	<section class="banner" id="banner">
		<div class="content">
			<div class="itbox">
				<div class="itboxtxt">
					<h3>近期行程</h3>
				</div>
				<jsp:useBean id="itSvc" scope="page"
				class="com.itinerary.model.ItService" />
				<jsp:useBean id="ldSvc" scope="page"
					class="com.leader.model.LdService" />
				<c:forEach var="itVO" items="${itSvc.all}" varStatus="status" begin="0" end="1">
					<div class="box">

						<div class="memimgBx">



							<c:forEach var="ldVO" items="${ldSvc.all}">
								<c:if test="${itVO.ldNo==ldVO.ldNo}">

									<img class="imgm"
										src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
										alt="">
									<div class="memtext" style="display: none">
										<img class="textimg"
											src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
											alt="">
										<div class="memnick">
											<h5>${ldVO.ldName}</h5>

										</div>

										<div class="memstatus">
											<h5>領隊</h5>
										</div>
										<div class="memfollow">

											<button>
												<img
													src="${pageContext.request.contextPath}/resource/images/info.png"
													alt="">
											</button>

											<div class="heart2">

												<p class="pheart"></p>
												<img class="${ldVO.ldNo}" name="imgheart" src="">
											</div>
								</c:if>
							</c:forEach>
						</div>
					</div>
					<div class="heart">
						<p class="pheart">0</p>
						<img class="${itVO.itNo}" name="imgheart" src="">
					</div>
					<A
						href="<%=request.getContextPath()%>/front-end/itinerary/it.do?itNo=${itVO.itNo}&action=getOne_For_Display">
			</div>
			<div class="imgBx">
				<img
					src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${itVO.itNo}"
					alt="">
			</div>
			<div class="text" id="${itVO.itNo}">
				<div>
					<h3>${itVO.itName}</h3>
				</div>

				<h5>出發日:${itVO.itDate}</h5>

				<h5>
					目前出價 : NT$<span class="firstprice">${itVO.itPrice}</span>
				</h5>
			</div>
		</div>


		</a>



		</c:forEach>
		
		</div>

		<div class="contenttxt">
			<h2>TI BA MOUNTAIN</h2>
		</div>
		<div class="bidbox">
			<div class="bidboxtxt">
				<h3>正在競標</h3>
			</div>
			



			<c:forEach var="bidVO" items="${bidSvc.all}" varStatus="status">
				<c:if test="${bidVO.bidStatus==2}">
					<div class="box">

						<div class="memimgBx">

							<c:forEach var="itVO" items="${itSvc.all}">
								<c:if test="${itVO.itNo== bidVO.itNo}">
									<c:forEach var="ldVO" items="${ldSvc.all}">
										<c:if test="${itVO.ldNo==ldVO.ldNo}">

											<img class="imgm"
												src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
												alt="">
											<div class="memtext" style="display: none">
												<img class="textimg"
													src="${pageContext.request.contextPath}/leader/ldPic.do?ldNo=${ldVO.ldNo}"
													alt="">
												<div class="memnick">
													<h5>${ldVO.ldName}</h5>

												</div>

												<div class="memstatus">
													<h5>領隊</h5>
												</div>
												<div class="memfollow">

													<button>
														<img
															src="${pageContext.request.contextPath}/resource/images/info.png"
															alt="">
													</button>

													<div class="heart2">

														<p class="pheart"></p>
														<img class="${ldVO.ldNo}" name="imgheart" src="">
													</div>
										</c:if>
									</c:forEach>
						</div>
					</div>
					<div class="heart">
						<p class="pheart">0</p>
						<img class="${bidVO.bidNo}" name="imgheart" src="">
					</div>
					<A
						href="<%=request.getContextPath()%>/front-end/bid/bid.do?bidNo=${bidVO.bidNo}&action=getOne_For_Display">
		</div>
		<div class="imgBx">
			<img
				src="${pageContext.request.contextPath}/itinerary/itPic.do?itNo=${bidVO.itNo}"
				alt="">
		</div>
		<div class="text" id="${bidVO.bidNo}">
			<div>
				<h3>${itVO.itName}</h3>
			</div>
			<c:set var="string1" value="${bidVO.bidTimestart}" />
			<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
			<c:set var="string3" value="${bidVO.bidTimeend}" />
			<c:set var="string4" value="${fn:substringBefore(string3,'.0')}" />
			<input type="hidden" class="bidTimestart" value="${string2}">
			<input type="hidden" class="bidTimeend" value="${string4}">

			<h4>
				剩餘時間<span class="timeout">00:00:00</span>
			</h4>
			<h5>
				目前出價 : NT $<span class="firstprice">${bidVO.bidPricestart}</span>
			</h5>


			</c:if>
			</c:forEach>

		</div>


		</a>
		</div>
		</c:if>


		</c:forEach>
		</div>
		</div>
	</section>
	
	
	<section class="expert" id="expert">
		<div class="title">
		<%
	ArticleService artSvc = new ArticleService();
	List<ArticleVO> list = artSvc.getAll();
	pageContext.setAttribute("list", list);
	
	List<ArticleVO> listc =(ArrayList)request.getAttribute("listc");
	if(listc!=null)
		pageContext.setAttribute("list", listc);
	
	
	%>
			<h2 class="titleText">
				最<span>新</span>文章
			</h2>
			<hr>
<!-- 			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elits.</p> -->
		</div>
		<div class="content">
			<div class="artbox">
		<c:forEach var="articleVO" items="${(empty ListArticle) ? list : ListArticle}" varStatus="art"
			begin="0" end="3">
			<c:if test="${articleVO.artStatus==1}">
		
			<div class="box">
			
				<A href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${articleVO.artNo}">
				<div class="artc">
					<c:forEach var="artcVO" items="${artcSvc.all}">
						<c:if test="${articleVO.artcNo==artcVO.artcNo}">
	         	         ${artcVO.artcName}
             		   	</c:if>
					</c:forEach>
				</div>
				<div class="text">
					<div class="artTitle">
						<b>${articleVO.artTitle}</b>	
					</div>
				</div>	
				<div class="artText" >
					${articleVO.artText}
				</div>
				<div class="imgBx">
					<img class="titlePic" src="<%=request.getContextPath()%>/art/artpic.do${articleVO.picSrc}">
					</div>
							<c:set var="string1" value="${articleVO.artTime}" />
							<c:set var="string2" value="${fn:substringBefore(string1,'.0')}" />
							<c:set var="string3" value="${fn:substringAfter(string2,'2021-')}" />
				<div class="time">
				<input type="hidden" class="ArtTimeh" value="${articleVO.artTime}"> 
				<div class="ArtTime"></div>
					文章發表時間:${string3}
						<div id="artMemPic">
					<img class='imgm' src='<%=request.getContextPath()%>/AllPic.do?table=member_list&amp;picColumn=mem_pic&amp;idColumn=mem_id&amp;id='${articleVO.memId}>
				</div>
				<div id="artmemName">
					${memberSvc.getOneMem(articleVO.memId).memName}
				</div>
				</div>
					
				
				</a>
				
					<div class="artCount">
					
					<p class="artCountText">
				
						${artCount.getArtCount(articleVO.artNo)}
					
					</p>
					
					
				<img class='artCountpic'  src='<%=request.getContextPath()%>/resource/images/Article/like.png' > 
				</div>
			
				<div class="heart">
							<p class="pheart">0</p>
							<img class="${articleVO.artNo}" name="imgheart" src="" >
					</div>
				
			</div>
			</c:if>
			
			</c:forEach>
			<div class="title">
				<a href="${pageContext.request.contextPath}/front-end/article/listAllArt.jsp" class="btn" style="margin-top: 100px">View All</a>
			</div>
		</div>
		</div>
	</section>
	<section class="testimonials" id="testimonials">
		<div class="title white">
			<h2 class="titleText">
				我們的<span>領隊</span>
			</h2>
<!-- 			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elit.</p> -->
		</div>
		<div class="content">
			
				<c:forEach var="ldVO" items="${ldSvc.all}" varStatus="status">
				
				<div class="box">
					<div class="imgBx">
						<img style="border-radius: 50%" src="<%= request.getContextPath()%>/leader/ldPic.do?ldNo=${ldVO.ldNo}"
							alt="">
					</div>
<!-- 					<div class="memimgBx"> -->
<!-- 						<button> -->
<!-- 							<img class="imgm" -->
<%-- 								src="${pageContext.request.contextPath}/resource/images/img_297675.png" --%>
<!-- 								alt=""> -->
<!-- 						</button> -->
<!-- 						<br> -->
<!-- 					</div> -->
					<div class="text">
						<h3>${ldVO.ldName}</h3>
						<h4>經歷:${ldVO.ldExpr}</h4>
						<h3>評分${ldVO.ldScore}</h3>
<%-- 						<jsp:useBean id="itSvc" scope="page" class="com.itinerary.model.ItService" /> --%>
							<c:forEach var="itVO" items="${itSvc.allbyLdNo}">			
		            			<c:if test="${itVO.ldNo==ldVO.ldNo}">
			            			<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/itinerary/it.do">
<%-- 			            				<br><font color=#8B4513>　● ${itVO.itName}</font> --%>
			            				<input type="hidden" name="itNo" value="${itVO.itNo}"> 
										<input type="hidden" name="action" value="getOne_For_Display">
										<input class="submit"type="submit" value="　● ${itVO.itName}">
			         			    </FORM>
		         			    </c:if>
	     				   </c:forEach>
					</div>
				</div>
			</c:forEach>
<!-- 			<div class="box"> -->
<!-- 				<div class="imgBx"> -->
<!-- 					<img -->
<%-- 						src="${pageContext.request.contextPath}/resource/images/img_297675.png" --%>
<!-- 						alt=""> -->
<!-- 				</div> -->
<!-- 				<div class="text"> -->
<!-- 					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, -->
<!-- 						sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. -->
<!-- 						Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris -->
<!-- 						nisi ut aliquip ex ea .</p> -->
<!-- 					<h3>Someone Famous</h3> -->
<!-- 				</div> -->
<!-- 			</div> -->
		</div>
	</section>
	
	
	
	
	
	<section class="menu" id="menu">
		<div class="title">
			<h2 class="titleText">
				最<span>新</span>商品
			</h2>
<!-- 			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elit.</p> -->
		</div>
		<div class="content">
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱1</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<div class="heart">
								<p>5</p>
								<button>
									<img
										src="${pageContext.request.contextPath}/resource/images/heartNo.png"
										alt="">
								</button>
							</div>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱2</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱3</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱4</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>

						<img
							src="${pageContext.request.contextPath}/resource/images/heartNo.png"
							alt="">
						<div class="memtext" hidden>
							<img class="textimg"
								src="${pageContext.request.contextPath}/resource/images/img_297675.png"
								alt="">
							<div class="memnick">
								<h5>登山熊</h5>
							</div>
							<div class="memstatus">
								<h5>領隊</h5>
							</div>
							<div class="memfollow">

								<button>
									<img
										src="${pageContext.request.contextPath}/resource/images/info.png"
										alt="">
								</button>
								<button>
									<img
										src="${pageContext.request.contextPath}/resource/images/chat.png"
										alt="">
								</button>
								<button>
									<img
										src="${pageContext.request.contextPath}/resource/images/heartNo.png"
										alt="">
								</button>
							</div>
						</div>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱5</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱6</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱7</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="box">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/thomas-tucker-au3CYbd7vCU-unsplash.jpg"
						alt="">
				</div>
				<div class="memimgBx">

					<img class="imgm"
						src="${pageContext.request.contextPath}/resource/images/img_297675.png"
						alt="">
					<div class="memtext" hidden>
						<img class="textimg"
							src="${pageContext.request.contextPath}/resource/images/img_297675.png"
							alt="">
						<div class="memnick">
							<h5>登山熊</h5>
						</div>
						<div class="memstatus">
							<h5>領隊</h5>
						</div>
						<div class="memfollow">

							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/info.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/chat.png"
									alt="">
							</button>
							<button>
								<img
									src="${pageContext.request.contextPath}/resource/images/heartNo.png"
									alt="">
							</button>
						</div>
					</div>
					<br>
					<div class="heart">
						<p>5</p>
						<button>
							<img
								src="${pageContext.request.contextPath}/resource/images/heartNo.png"
								alt="">
						</button>
					</div>
				</div>
				<div class="text">
					<h3>商品名稱8</h3>
					<h4>商品狀態</h4>
					<h3>NT:600</h3>
				</div>
				<div class="but">
					<button>直接購買</button>
				</div>
			</div>
			<div class="title">
				<a href="${pageContext.request.contextPath}/front-end/goods/listAllGoods2.jsp" class="btn">View All</a>
			</div>
		</div>
	</section>
	<section class="contact" id="contact">
		<div class="title">
			<h2 class="titleText">
				Our<span>M</span>enu
			</h2>
			<p>Lorem, ipsum dolor, sit amet consectetur adipisicing elit.</p>
		</div>
		<div class="contactForm">
			<h3>Send Message</h3>
			<div class="inputBox">
				<input type="text" placeholder="Name">
			</div>
			<div class="inputBox">
				<input type="text" placeholder="Email">
			</div>
			<div class="inputBox">
				<textarea placeholder="Name"></textarea>
			</div>
			<div class="inputBox">
				<input type="submit" value="Send">
			</div>
		</div>
	</section>
	<section class="about" id="about">
		<div class="row">
			<div class="co150">
				<h2 class="titleText">
					<span>A</span>bout US
				</h2>
				<p>
					Lorem, ipsum dolor, sit amet consectetur adipisicing elit. Qui
					soluta magni ea natus, ratione autem molestiae quam minima nemo
					doloremque accusantium voluptatum? Quidem error consectetur minima,
					adipisci non dolor ducimus.<br> Lorem ipsum dolor, sit amet
					consectetur adipisicing elit. Voluptate sapiente explicabo omnis
					esse asperiores iure magni, cum nemo unde eligendi accusantium quas
					nulla illo aut ad dolor earum? Sunt, pariatur.<br> Lorem,
					ipsum dolor, sit amet consectetur adipisicing elit. Qui soluta
					magni ea natus, ratione autem molestiae quam minima nemo doloremque
					accusantium voluptatum? Quidem error consectetur minima, adipisci
					non dolor ducimus.<br> Lorem ipsum dolor, sit amet consectetur
					adipisicing elit. Voluptate sapiente explicabo omnis esse
					asperiores iure magni, cum nemo unde eligendi accusantium quas
					nulla illo aut ad dolor earum? Sunt, pariatur.
				</p>
			</div>
			<div class="co150">
				<div class="imgBx">
					<img
						src="${pageContext.request.contextPath}/resource/images/eean-chen-nSbKjwyVQSU-unsplash.jpg"
						alt="">
				</div>
			</div>
		</div>
	</section>





	<link rel="stylesheet"
		href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
	<!--   <script src="//code.jquery.com/jquery-1.9.1.js"></script> -->
	<script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<link rel="stylesheet"
		href="http://jqueryui.com/resources/demos/style.css">
	<script>

	
	
	
	$(document).ready(function() {
// 		$(".memimgBx .imgm").click(function() {
// 			$(".memtext").not($(this).next(".memtext")).hide("fast");
// 			$(this).next(".memtext").toggle("fast");

// 		});
		
					
			$(".text").each(function() {
				let id =$(this).attr("id");
				let start = $(this).children(".bidTimestart").val();
				let end = $(this).children(".bidTimeend").val();

				    var time = new Date();
				    var nowTime = time.getTime(); 
				    var time3 = new Date(start);
				    var time2 = new Date(end);
				    
				    var endTimeget = time2.getTime();
				    var endtimestatus = true;
if(nowTime>endTimeget){
	endtimestatus = false;
	
	}
				    var startTimeget = time3.getTime();
				    
				var thistimeout = $(this).find(".timeout");
				var firstprice = $(this).find(".firstprice");
			

				if(nowTime >= startTimeget){
//						console.log("488有經過");
//						console.log(id);
					 $.ajax({
							url : PageContext + "/OpenBid.do",
							type : "POST",
							dataType : 'text',
							
							data : {
								bid_no : id,
								endtime:endtimestatus,
							},
							success : function(data) {

								
							}


				});
					
					 //進來時先做一次計時的裡面要做的事情
					 var oldprice = firstprice.html();
						var time = new Date();
					    var nowTime = time.getTime(); 
					    var time2 = new Date(end);
					    
					    var endTimeget = time2.getTime();

					    var offsetTime = (endTimeget - nowTime) / 1000;
					    var sec = parseInt(offsetTime % 60);
					    var min = parseInt((offsetTime / 60) % 60);
					    var hr = parseInt(offsetTime / 60 /60);
					    
					    if(parseInt(hr+min+sec)<=0){
							
							window.clearInterval(timeoutID);
							clearTimeout(setTimeout);
							var str =  "競標結束";
							thistimeout.html(str);
						    
						    
					    }else{
						    							    
						    if(sec.toString().length==1){
						    	
						    	sec ="0"+sec
						    }
							if(min.toString().length==1){
						    	
							min ="0"+min
						    }
							if(hr.toString().length==1){
						    	
								hr ="0"+hr
							    }
							 var str = hr + ":" + min + ":" + sec;

							 thistimeout.html(str);
				

							  $.ajax({
										url : PageContext + "/GetFirstPrice.do",
										type : "POST",
										dataType : 'text',
										
										data : {
											bid_no : id,
										},
										success : function(data) {
											if(parseInt(data)>parseInt(oldprice)){
												
												firstprice.animate({color:"#04ff00"},100);
												firstprice.html(data).animate({color:"#ffa500"},'slow');

											}
											
										}
							});
							  
					    } 
					 
					 
					    //進來時先做一次計時的裡面要做的事情
					    
					   
					 
					
					
					
					var timeoutID = window.setInterval(function() {
						var oldprice = firstprice.html();
						var time = new Date();
					    var nowTime = time.getTime(); 
					    var time2 = new Date(end);
					    
					    var endTimeget = time2.getTime();

					    var offsetTime = (endTimeget - nowTime) / 1000;
					    var sec = parseInt(offsetTime % 60);
					    var min = parseInt((offsetTime / 60) % 60);
					    var hr = parseInt(offsetTime / 60 /60);
					    
					    if(parseInt(hr+min+sec)<=0){
							
							window.clearInterval(timeoutID);
							clearTimeout(setTimeout);
							var str =  "競標結束";
							thistimeout.html(str);
						    
						    
					    }else{
						    
						    
						    if(sec.toString().length==1){
						    	
						    	sec ="0"+sec
						    }
							if(min.toString().length==1){
						    	
							min ="0"+min
						    }
							if(hr.toString().length==1){
						    	
								hr ="0"+hr
							    }
							 var str = hr + ":" + min + ":" + sec;
//								 console.log("time:="+str);
							 thistimeout.html(str);
//								 console.log(firstprice.html());

//								  $.ajax({
//											url : PageContext + "/GetFirstPrice.do",
//											type : "POST",
//											dataType : 'text',
										
//											data : {
//												bid_no : id,
//											},
//											success : function(data) {
//// 												console.log(parseInt(data)+"=="+parseInt(oldprice));

//												if(parseInt(data)>parseInt(oldprice)){
												
//													firstprice.animate({color:"#04ff00"},100);
//													firstprice.html(data).animate({color:"#ffa500"},'slow');
												

//												}
											
//											}


//								});
							  
					    } 
							  
					    
					
					}, 1000);
				
					var timeoutID2 = window.setInterval(function() {
						var oldprice = firstprice.html();
						console.log("刷新");
							  $.ajax({
										url : PageContext + "/GetFirstPrice.do",
										type : "POST",
										dataType : 'text',
										
										data : {
											bid_no : id,
										},
										success : function(data) {
//												console.log(parseInt(data)+"=="+parseInt(oldprice));

											if(parseInt(data)>parseInt(oldprice)){
												
												firstprice.animate({color:"#04ff00"},100);
												firstprice.html(data).animate({color:"#ffa500"},'slow');
												

											}
											
										}


							});
							  
					    
							  
					    
					
					}, 3000);    
					    
					    
					    
					    
					    
					    
				
				  
			}else{
				
				window.clearInterval(thistimeout);
				clearTimeout(setTimeout);
				var str =  "即將開始";
				thistimeout.html(str);
				
			}
			
			
				
			
		});
	
	});
//		window.onload(){ if(location.href.indexOf('#reloaded')==-1){ location.href=location.href+"#reloaded"; location.reload(); } } 
//		$(function(){ if($.cookie("refresh")!="no"){ setTimeout(function(){ window.location.reload(); 
	$(window).on('unload', function(){
		window.clearInterval(timeoutID2);
		window.clearInterval(timeoutID);
		clearTimeout(setTimeout);
		disconnect();
	});	

		</script>

	<style>
/* bidbox */
.bidbox input.submit {
	position: relative;
	background-color: #3394fb;
	margin-top: -5px;
	border: none;
	color: white;
	width: 100%;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.bidbox {
	flex-wrap: wrap;
	margin-top: 40px;
	max-width: 1300px;
	margin: auto;
	display: flex;
	justify-content: left;
	flex-direction: row;
	flex-wrap: wrap;
	padding-left: 50px;
}

}
.bidbox .bidboxtxt {
	width: 50%;
	max-height: 36px;
	background: #ff0157;
	display: flex;
	justify-content: center;
	flex-direction: row;
	flex-wrap: wrap;
	margin-left: 25px;
}

.bidbox .bidboxtxt h3 {
	color: #fff;
	font-size: 1.5rem;
}

.bidbox .box {
	background-color: white !important;
	float: top !important;
	padding-bottom: 20px !important;
	min-width: 500px !important;
	height: 260px !important;
	margin: 20px !important;
	border: 15px solid:#fff !important;
}

.bidbox .box .imgBx {
	position: relative;
	height: 45%;
}

.bidbox .box .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
	/* 	width: 100%; */
	/* 	height: 100%; */
	/* 	object-fit: cover; */
}

.bidbox .box .text {
	padding: 6px 0 5px;
}

.bidbox .box .text h3 {
	font-size: 1.5rem;
	margin-left: 20px;
	font-weight: 400;
	color: #111;
}

.bidbox .box .text h3 span {
	margin: 5px;
	font-size: 1rem;
	color: orange;
}

.bidbox .box .text h4 {
	top: -20px !important;
	left: 270px !important;
	font-size: 1rem !important;
	position: relative !important;
	margin-left: 20px !important;
	font-weight: 400 !important;
	color: #444 !important;
	text-decoration: none !important;
}

.bidbox .box .text h4 span {
	font-weight: 700;
	margin-left: 15px;
	font-size: 1.8rem;
	color: #ff0157;
}

.bidbox .box .text h5 {
	margin-left: 20px !important;
	width: 300px;
	color: #444;
}

.bidbox .box .text h5 span {
	margin-left: 10px;
	font-size: 2rem;
	font-weight: 800;
	color: orange;
}

.bidbox .box .but {
	/* 	margin-top: 6%; */
	
}

.bidbox .box .but button {
	background-color: #fff0;
	border: none;
	color: white;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.bidbox .heart button, .memimgBx button {
	background-color: #fff0;
	border: 0px;
	border-radius: 50%;
}

.bidbox .box .memimgBx {
	position: absolute;
	z-index: 999;
	margin: 10px;
}

.bidbox .box .memimgBx .imgm {
	width: 70px;
	height: 70px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ff0157;
}

.bidbox .box .heart {
	text-align: center !important;
	/* width: 50%; */
	margin-left: 450px !important;
	margin-top: 115px !important;
	position: absolute !important;
}

.bidbox .box .heart p {
	padding-bottom: 0px;
}

.bidbox .box .heart img {
	width: 30px;
	object-fit: cover;
}

.imgBx img {
	transform: scale(1, 1);
	transition: all 1s ease-out;
	object-fit: cover;
	/* transition: 0.5s; */
	overflow: hidden;
	width: 100%;
	height: 100%;
}
</style>
<style>

/* itbox */
.itbox input.submit {
	position: relative;
	background-color: #3394fb;
	margin-top: -5px;
	border: none;
	color: white;
	width: 100%;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.itbox {
	flex-wrap: wrap;
	margin-top: 40px;
	max-width: 1300px;
	margin: auto;
	display: flex;
	justify-content: left;
	flex-direction: row;
	flex-wrap: wrap;
	padding-left: 50px;
}

}
.itbox .bidboxtxt {
	width: 50%;
	max-height: 36px;
	background: #ff0157;
	display: flex;
	justify-content: center;
	flex-direction: row;
	flex-wrap: wrap;
	margin-left: 25px;
}

.itbox .bidboxtxt h3 {
	color: #fff;
	font-size: 1.5rem;
}

.itbox .box {
	background-color: white !important;
	float: top !important;
	padding-bottom: 20px !important;
	min-width: 500px !important;
	height: 260px !important;
	margin: 20px !important;
	border: 15px solid:#fff !important;
}

.itbox .box .imgBx {
	position: relative !important;
	height: 65% !important;
}

.itbox .box .imgBx img {
	position: absolute !important;
	top: 0 !important;
	left: 0 !important;
/* 	width: 100%; */
/* 	height: 100%; */
/* 	object-fit: cover; */
}

.itbox .box .text {
	padding: 6px 0 5px;
}

.itbox .box .text h3 {
	font-size: 1.5rem;
	margin-left: 20px;
	font-weight: 400;
	color: #111;
}

.itbox .box .text h3 span {
	margin: 5px;
	font-size: 1rem;
	color: orange;
}

.itbox .box .text h4 {
    top: -20px;
    left: 270px;
    font-size: 1rem;
    position: relative;
    margin-left: 20px;
    font-weight: 400;
    color: #444;
    text-decoration:none !important;
}

.itbox .box .text h4 span {
	font-weight: 700;
	margin-left: 15px;
	font-size: 1.8rem;
	color: #ff0157;
}

.itbox .box .text h5 {margin-left: 20px !important;width: 300px;color: #444;}

.itbox .box .text h5 span {
	margin-left: 10px !important;
	font-size: 2rem !important;
	font-weight: 800 !important;
	color: orange !important;
}

.itbox .box .but {
	/* 	margin-top: 6%; */
	
}

.itbox .box .but button {
	background-color: #fff0;
	border: none;
	color: white;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.itbox .heart button, .memimgBx button {
	background-color: #fff0;;
	border: 0px;
	border-radius: 50%;
}

.itbox .box .memimgBx {
   position: absolute !important;
    z-index: 999 !important;
    margin: 10px !important;
}

.itbox .box .memimgBx .imgm {
	width: 70px !important;
	height: 70px !important;
	object-fit: cover !important;
	border-radius: 50% !important;
	border: 3px solid #ff0157 !important;
}

.itbox .box .heart {
    text-align: center !important;
    /* width: 50%; */
    margin-left: 450px !important;
    margin-top: 115px !important;
    position: absolute !important;
}

.itbox .box .heart p {
margin:10px;
	padding-bottom: 0px;
}

 .heart img {
	width: 30px;
	object-fit: cover;
}
</style>


<style>

.artbox .box .imgBx {
	margin: 10px !important;
	position: relative !important;
	margin-top: -29px !important;
	width: 230px !important;
	overflow: hidden !important;
	height: 230px !important;
}

.artbox .box .text {
	position: relative !important;
	padding: 0px 0 0px !important;
	width: 100px !important;
	margin-left: 230px !important;
}

.artbox .box .text h3 {
	margin-left: 20px !important;
	font-weight: 400 !important;
	color: #111 !important;
}

.artbox .box .text h4 {
	margin-left: 20px !important;
	font-weight: 400 !important;
	color: #444 !important;
}

.artbox .box .but {
	margin-top: 6%;
}

.artbox .box .but button {
	background-color: #3394fb;
	border: none;
	color: white;
	width: 100%;
	padding: 8px 88px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

input.submit {
	background-color: #3394fb;
	margin-top: 10px;
	border: none;
	color: white;
	width: 100px;
	padding: 8px 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	cursor: pointer;
}

.heart button, .memimgBx button {
	/* background-color: #fff; */
	border: 0px;
}

 .artbox .box .memimgBx {
	padding: 10px !important;
	float: right !important;
}

.artbox .box .memimgBx .imgm {
	width: 30px !important;
	object-fit: cover !important;
	border-radius: 50% !important;
	border: 3px solid #ddd !important;
}

 .artbox .box .memimgBx .heart {
	text-align: center !important;
	/* margin-bottom: 0px; */
}

 .artbox .box .memimgBx .heart p {
	padding-bottom: 0px !important;
}

 .artbox .box .memimgBx .heart img {
	width: 30px !important;
	object-fit: cover !important;
}

.artbox .box {
	    min-width: 500px !important;
	    height: 250px !important;
	    min-height: 250px !important;
	    background-color: #fff !important;
	    /* box-shadow: 0 5px 10px #c6cac1; */
	    position: relative !important;
	    transition: 0.5s !important;
	    margin: 25px !important;
	    box-shadow: 0px 5px 15px rgb(0 0 0 / 80%) !important;
}

 .artbox .box:hover {
	box-shadow: 10px 15px 35px rgb(0 0 0 / 50%) !important;
/* 	border: 2px solid #6a9e20;	 */
}
b, strong {
    /* width: 100px; */
    font-size: 1.6rem;
    font-weight: bolder;
}
 .artbox .box .artc {
    position: absolute !important;

    font-size: 15px !important;
    background-color: rgba(0,0,0,.8) !important;
    padding: 4px 6px !important;
    border-radius: 3px !important;
    margin: 4px !important;
    color: #fff !important;
    z-index: 1 !important;
}
 .artbox .box .text {
    position: relative !important;
    padding: 0px 0 0px !important;
    width: 100px !important;
    margin-left: 230px !important;
}
.artbox .box .artTitle {
    position: relative !important;
    top: 0% !important;
    left: 58% !important;
    width: 200px !important;
    max-width: 500px !important;
    font-size: 15px !important;
    overflow: hidden !important;
    white-space: nowrap !important;
    text-overflow: ellipsis !important;
}
.artbox .box .artText {
    position: absolute !important;
    top: 35% !important;
    left: 58% !important;
    max-width: 200px !important;
    max-height: 300px !important;
    font-size: 15px !important;
    overflow: hidden !important;
    white-space: nowrap !important;
    text-overflow: ellipsis !important;
    display: -webkit-box !important;
    -webkit-line-clamp: 3 !important;
    -webkit-box-orient: vertical !important;
    white-space: normal !important;
}
.artbox .box .imgBx {
    margin: 10px !important;
    position: relative !important;
    margin-top: -29px !important;
    width: 230px !important;
    overflow: hidden !important;
    height: 230px !important;
}
.artbox .box .imgBx .titlePic {
    position: absolute !important;
    left: 0px !important;
    /* width: 57% !important; */
    height: 100% !important;
}

.artbox .box .time {
    position: absolute !important;
    top: 20% !important;
    right: 11% !important;
    font-size: 6px !important;
    color: black !important;
}
.ArtTime {
    position: absolute !important;
    bottom: 3% !important;
    left: 45% !important;
    font-size: 14px !important;
}
div#artMemPic img {
    width: 50px !important;
    height: 50px !important;
    border-radius: 50% !important;
    margin-top: 80% !important;
    border: 5px solid lightgreen !important;
}
div#artmemName {
    font-size: 17px !important;
    /* display: flex !important; */
    position: absolute !important;
    bottom: 11% !important;
    right: 30% !important;
    color: #6f7b8a !important;
}
.artbox .box .artCount {
    position: absolute !important;
    bottom: 6px !important;
    right: 10% !important;
    margin-bottom: 10px !important;
}
.artCountText {
    position: relative !important;
    /* margin-bottom: -20px !important; */
    margin-left: 37% !important;
    /* margin-bottom: -20px !important; */
    bottom: -4px !important;
}
.artCountpic {
    width: 21px !important;
    margin-left: -px !important;
    margin-bottom: -7px !important;
}
.artbox .box .heart {
    position: absolute !important;
    bottom: 0 !important;
    right: 5px !important;
}
.artbox .box .heart img {
    width: 30px !important;
    object-fit: cover !important;
}
.artbox {
    flex-wrap: wrap;
    margin-top: 40px;
    max-width: 1100px;
    /* margin: 40px; */
    display: inline-flex;
    justify-content: left;
    flex-direction: row;
    flex-wrap: wrap;
    padding-left: 0 auto;
}
.testimonials {
     background-image: url(/CEA102G4/resource/images/salmen-bejaoui-cerpzCd5amg-unsplash.jpg);
    background-size: cover;
    height: 640px;
    background-attachment: fixed;
}
   
</style>
<%-- <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resource/css/styleWen2.css"> --%>
</body>
</html>