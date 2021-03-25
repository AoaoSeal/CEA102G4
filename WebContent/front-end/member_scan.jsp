<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.art.model.*"%>
<%@ page import="com.artcount.model.*"%>
<%@ page import="com.goods.model.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<link rel="stylesheet" type="text/css"
		href="${pageContext.request.contextPath}/resource/css/styleWen.css">
	<style>
.divleft .imgm {
	width: 90px;
	object-fit: cover;
	border-radius: 50%;
	border: 6px solid lightgreen;
	height: 90px;
	float: left;
	margin-right: 10px;
}
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
	background-color: white;
	float: top;
	min-width: 500px;
	height: 220px;
	margin: 50px;
	border: 15px solid:#fff;
	box-shadow: 0 5px 35px rgb(0 0 0/ 8%);
}

.bidbox .box .imgBx {
	position: relative;
	height: 45%;
}

.bidbox .box .imgBx img {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	object-fit: cover;
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
	top: -20px;
	left: 270px;
	position: relative;
	margin-left: 20px;
	font-weight: 400;
	color: #444;
}

.bidbox .box .text h4 span {
	font-weight: 700;
	margin-left: 15px;
	font-size: 1.8rem;
	color: #ff0157;
}

.bidbox .box .text h5 {
	font-size: 1.3rem;
	margin-top: -20px;
	margin-left: 20px;
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
	background-color: #fff0;;
	border: 0px;
	border-radius: 50%;
}

.bidbox .box .memimgBx {
	margin: 8px;
	float: left;
	position: relative;
	z-index: 999;
}

.bidbox .box .memimgBx .imgm {
	width: 70px;
	height: 70px;
	object-fit: cover;
	border-radius: 50%;
	border: 3px solid #ff0157;
}

.bidbox .box .heart {
	text-align: center;
	width: 10%;
	margin-left: 450px;
	margin-top: -50px;
}

.bidbox .box .heart p {
	padding-bottom: 0px;
}

.bidbox .box .heart img {
	width: 30px;
	object-fit: cover;
}

.imgm {
	width: 140px;
	object-fit: cover;
	border-radius: 50%;
	border: 6px solid lightgreen;
	height: 140px;
	/* float: left; */
	margin-right: 10px;
}

.member {
	align-items: center;
	position: relative;
}

.memberindex {
	position: relative;
	background-color: white;
	max-width: 1200px;
	padding: 50px;
	margin: 0 auto;
	margin-top: 100px;
}

.memberimgm {
	margin: 10px;
	position: a;
	width: 100%;
	/* height: 100px; */
	object-fit: cover;
	text-align: center;
	/* overflow: overlay; */
}

.memindextext {
	position: relative;
	align-items: center;
	margin: 0 auto;
	width: 300px;
}

.memindextext .membernick {
	position: relative;
	align-items: center;
	margin: 0 auto;
	width: 300px;
}

.memberindex hr {
	position: relative;
	width: 900px;
	margin: 0 auto;
}
</style>

	<section class="menu" id="menu">
		<div class="memberindex">
			<div class="memberimgm">
				<img class="imgm"
					src="${pageContext.request.contextPath}/${memberVO.allPic}" alt="">
				<div class="memindextext">
					<h2 class="membernick">${memberVO.memNick}</h2>
					<h4 class="membernick">${memberVO.memText}</h4>
					<!-- 						<h5 class="membernick">關注: twotwo</h5> -->
					<!-- 						<h5 class="membernick">粉絲: twotwo</h5> -->
					<!-- 						<h5 class="membernick">文章數: twotwo</h5> -->
				</div>
			</div>
			<hr>
			<div class="title">
				<h2 class="titleText">${memberVO99.memNick}的社群</h2>

			</div>
			<div class="content">

				<%
					ArticleService artSvc = new ArticleService();
					List<ArticleVO> list = artSvc.getAll();
					pageContext.setAttribute("list", list);
				%>
				<jsp:useBean id="artCount"
					class="com.artcount.model.ArtCountService" />
				<jsp:useBean id="artcSvc" class="com.artc.model.ArtcService" />
				<c:forEach var="articleVO"
					items="${(empty ListArticle) ? list : ListArticle}" varStatus="art">
					<c:if test="${articleVO.memId == memberVO.memId}">
						<c:if test="${articleVO.artStatus==1}">

							<div class="box">
								<A
									href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${articleVO.artNo}">
									<div class="artc">
										<c:forEach var="artcVO" items="${artcSvc.all}">
											<c:if test="${articleVO.artcNo==artcVO.artcNo}">
	         	         [${artcVO.artcName}] 
             		   </c:if>
										</c:forEach>
									</div>
									<div class="text">
										<div class="artTitle">
											<b>${articleVO.artTitle}</b>
										</div>
									</div>
									<div class="artText">${articleVO.artText}</div>
									<div class="imgBx">
										<img class="titlePic"
											src="<%=request.getContextPath()%>/art/artpic.do${articleVO.picSrc}">
									</div>
									<div class="time">
										<fmt:formatDate value="${articleVO.artTime}"
											pattern="HH:mm:ss" />
										文章發表時間:${articleVO.artTime}
									</div>

									<div class="artCount">
										<div class="artCountText">
											<p>${artCount.getArtCount(articleVO.artNo)}</p>
										</div>
										<img class="artCountpic"
											src="<%=request.getContextPath()%>/resource/images/like.png">
									</div>
								</a>
								<div class="heart">
									<p class="pheart">0</p>
									<img class="${articleVO.artNo}" name="imgheart" src="">
								</div>
								<div class="but">
									<A
										href="<%=request.getContextPath()%>/art/art.do?action=getOneArt&artNo=${articleVO.artNo}">查看詳情</A>
								</div>
							</div>
						</c:if>
					</c:if>
				</c:forEach>



			</div>
			<hr>
			<div class="title">
				<h2 class="titleText">${memberVO99.memNick}的商城</h2>

			</div>

			<div class="content">
				<%
					GoodsService goodsSvc = new GoodsService();
					List<GoodsVO> list2 = goodsSvc.getAll2();
					pageContext.setAttribute("list2", list2);
				%>

				<c:forEach var="goodsVO" items="${list2}">
					<c:if test="${goodsVO.mem_id == memberVO.memId}">
						<div class="box">
							<div class="imgBx">
								<img height="150" width="150" id="imgs" class="card-img-top"
									src="<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
							data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>"
									alt="Card image cap">
							</div>
							<div class="memimgBx">
								<div class="heart">
									<p class="pheart">?</p>
									<img class="${goodsVO.gd_no}" name="imgheart" src="">
								</div>
							</div>
							<div class="text">
								<h3>${goodsVO.gd_name}</h3>
								<h4>
									分類:
									<c:forEach var="gcVO" items="${gcSvc.all}">
										<c:if test="${goodsVO.gc_no==gcVO.gc_no}">
	                    ${gcVO.gc_name}
                   		</c:if>
									</c:forEach>
								</h4>
								<h3>價格:NT${goodsVO.gd_price}</h3>
							</div>
							<div class="but">
								<FORM METHOD="post"
									ACTION="<%=request.getContextPath()%>/front-end/goods/goods.do">
									<input type="hidden" name="gd_no" value="${goodsVO.gd_no}">
									<input type="hidden" name="action" value="getOne_For_Display">
									<input class="submit" type="submit" value="查看詳情">
									<!-- 					<button>查看詳情</button> -->
								</FORM>
							</div>
						</div>
					</c:if>
				</c:forEach>


			</div>
		</div>
	</section>




</body>
</html>