<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="com.goods.model.*"%>

<%
GoodsVO goodsVO = (GoodsVO) request.getAttribute("goodsVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>

<html>
<body>

	<section class="menu" id="menu">


		<link
			href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
			rel="stylesheet" id="bootstrap-css">
		<script
			src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		<!------ Include the above in your HEAD tag ---------->

		<link
			href="http://cdn.shopify.com/s/files/1/0067/5617/1846/t/2/assets/timber.scss.css"
			rel="stylesheet" type="text/css" media="all" />
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
			integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
			crossorigin="anonymous">
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.0/animate.css"
			rel="stylesheet" type="text/css" media="all" />
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
			rel="stylesheet" type="text/css" />
		<link rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
		<link
			href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.css"
			rel="stylesheet" type="text/css" />
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"
			integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ="
			crossorigin="anonymous"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/elevatezoom/3.0.8/jquery.elevatezoom.min.js"></script>
		<script
			src="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>


		<style>
.breadcrumb-list>li {
	font-size: 14px;
	list-style: none;
	display: inline;
}

.breadcrumb-list>li a:after {
	content: "/";
	vertical-align: middle;
	margin: 0 5px;
	color: #7a7a7a;
}

.action-wishlist:hover, .action-wishlist:focus {
	color: #fff;
}

.add-to-cart.action-wishlist {
	width: 50px;
	text-align: center;
	padding: 0;
}

.add-to-cart.action-wishlist i {
	margin-right: 0px;
}

.product-add-to-cart .cart-title, .product-add-to-cart .cart-title:hover,
	.product-list-action .cart-title, .product-list-action .cart-title:hover
	{
	background-color: transparent;
	border-bottom: none;
	color: inherit;
}

.product-add-to-cart .pro-add-btn i, .product-list-action .pro-add-btn i
	{
	margin-right: 10px;
	font-size: 18px;
}

.add-to-cart {
	display: inline-block;
}

.action-wishlist:hover, .action-wishlist:focus {
	color: #fff;
}

.add-to-cart.action-wishlist i {
	margin-right: 0px;
}

.product-add-to-cart {
	float: none;
}

.single-product-wishlist {
	display: inline-block;
	position: relative;
	margin-left: 20px;
}

.product-thumbnail .owl-nav {
	display: none;
}

.breadcrumb-area {
	padding: 30px 0;
	background-color: #f3f3f3;
}

.breadmome-name {
	color: #ff6a00;
	font-size: 24px;
	font-weight: 500;
	text-transform: capitalize;
	margin: 0 0 18px;
}

.breadcrumb-content>ul>li {
	display: inline-block;
	list-style: none;
	position: relative;
	font-size: 14px;
	color: #333;
}

.breadcrumb-content>ul>li.active {
	color: #ff6a00;
}

.breadcrumb-content>ul>li:after {
	content: "/";
	vertical-align: middle;
	margin: 0 5px;
	color: #7a7a7a;
}

.breadcrumb-content>ul>li:last-child:after {
	display: none;
}

.mt-80 {
	margin-top: 80px
}

.mb-80 {
	margin-bottom: 80px
}

.single-product-name {
	font-size: 22px;
	text-transform: capitalize;
	font-weight: 900;
	color: #444;
	line-height: 24px;
	margin-bottom: 15px;
}

.single-product-reviews {
	margin-bottom: 10px;
}

.single-product-price {
	margin-top: 25px;
}

.single-product-action {
	margin-top: 30px;
	padding-bottom: 30px;
	border-top: 1px solid #ebebeb;
	border-bottom: 1px solid #ebebeb;
	float: left;
	width: 100%;
}

.product-discount {
	display: inline-block;
	margin-bottom: 20px;
}

.product-discount span.price {
	font-size: 28px;
	font-weight: 900;
	line-height: 30px;
	display: inline-block;
	color: #008bff;
}

.product-info {
	color: #333;
	font-size: 18px;
	font-weight: 400;
}

.product-info p {
	line-height: 30px;
	font-size: 14px;
	color: #333;
	margin-top: 30px;
}

.product-add-to-cart span.control-label {
	display: block;
	margin-bottom: 10px;
	text-transform: capitalize;
	color: #232323;
	font-size: 14px;
}

.product-add-to-cart {
	overflow: hidden;
	margin: 20px 0px;
	float: left;
	width: 100%;
}

.cart-plus-minus-box {
	border: 1px solid #e1e1e1;
	border-radius: 0;
	color: #3c3c3c;
	height: 49px;
	text-align: center;
	width: 50px;
	padding: 5px 10px;
}

.product-add-to-cart .cart-plus-minus {
	margin-right: 25px;
}

.cart-plus-minus {
	position: relative;
	width: 75px;
	float: left;
	padding-right: 25px;
}

.add-to-cart {
	background: #008bff;
	border: 0;
	border-bottom: 3px solid #0680e5;
	color: #fff;
	box-shadow: none;
	padding: 0 30px;
	border-radius: 3px;
	font-weight: 400;
	cursor: pointer;
	font-size: 14px;
	text-transform: capitalize;
	height: 50px;
	line-height: 50px;
}

.add-to-cart:hover {
	background: #ff6a00;
	border-color: #e96405;
}
</style>


		<section class="menu" id="menu">
			<div class="title">
				<h2 class="titleText">商品詳情</h2>
			</div>
			<div class="wrapper">
				<div class="breadcrumb-wrapper"></div>
				<main>
					<div id="shopify-section-product-template" class="shopify-section">
						<div class="single-product-area mt-80 mb-80">
							<div class="container">
								<div class="row">
									<div class="col-md-5">
										<div class="product-details-large" id="ProductPhoto">
											<img width="3000" height="3000" class="img-fluid"
												id="ProductPhotoImg" class="product-zoom" data-image-id=""
												alt="12. Aliexpress dropshipping by oberlo"
												data-zoom-image="<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
		data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>"
												src="<c:if test="${goodsVO.gd_mediumblob==null || empty goodsVO.gd_mediumblob}">
				${pageContext.request.contextPath}/front-end/goods/img/noImage.jpg
				</c:if>
				<c:if test="${goodsVO.gd_mediumblob!=null && !empty goodsVO.gd_mediumblob}">
		data:image/png;base64,${goodsVO.gd_mediumblob}</c:if>">
										</div>
										<div id="ProductThumbs" class="product-thumbnail owl-carousel">
										</div>
									</div>
									<jsp:useBean id="gcSvc" scope="page"
										class="com.gc.model.GcService" />
									<div class="col-md-7">
										<div class="single-product-content">
											<form method="post" id="AddToCartForm" accept-charset="UTF-8"
												class="shopify-product-form" enctype="multipart/form-data">
												<input type="hidden" name="form_type" value="product" /><input
													type="hidden" name="utf8" value="✓" />
												<div class="product-details">
													<h1 class="single-product-name">
														<td><%=goodsVO.getGd_name()%></td>
													</h1>
													<div class="single-product-reviews">
														<span class="shopify-product-reviews-badge"
															data-id="1912078270534"></span>
													</div>
													<div class="product-sku">
														商品編號: <span class="variant-sku">
															<td><%=goodsVO.getGd_no()%></td>
														</span>
													</div>
													<div class="product-sku">
														賣家編號: <span class="variant-sku">
															<td><%=goodsVO.getMem_id()%></td>
														</span>
													</div>
													<div class="product-sku">
														商品分類: <span class="variant-sku">
															<td><c:forEach var="gcVO" items="${gcSvc.all}">
																	<c:if test="${goodsVO.gc_no==gcVO.gc_no}">
	                    ${gcVO.gc_name}
                    </c:if>
																</c:forEach></td>
														</span>
													</div>
													<div class="product-sku">
														商品狀態: <span class="variant-sku">
															<td><c:if test="<%=goodsVO.getGd_status() == 0%>">全新</c:if>
																<c:if test="<%=goodsVO.getGd_status() == 1%>">二手</c:if></td>
														</span>
													</div>
													<div class="product-sku">
														上架時間: <span class="variant-sku">
															<td><%=goodsVO.getGd_date()%></td>
														</span>
													</div>
													<div class="single-product-price">
														<div class="product-discount">
															<span class="price" id="ProductPrice"><span
																class=money>NT
																	<td>$<%=goodsVO.getGd_price()%></td>
															</span></span>
														</div>
													</div>
													<tr>
														<div class="product-info">
															<div>商品簡介：</div>
														</div>
														<div class="product-info"><%=goodsVO.getGd_text()%>
														</div>
														<script>
															jQuery(function() {
																jQuery(
																		'.swatch :radio')
																		.change(
																				function() {
																					var optionIndex = jQuery(
																							this)
																							.closest(
																									'.swatch')
																							.attr(
																									'data-option-index');
																					var optionValue = jQuery(
																							this)
																							.val();
																					jQuery(
																							this)
																							.closest(
																									'form')
																							.find(
																									'.single-option-selector')
																							.eq(
																									optionIndex)
																							.val(
																									optionValue)
																							.trigger(
																									'change');
																				});
															});
														</script>
												</div>
											</form>

											<style>
.product-variant-option .selector-wrapper {
	display: none;
}
</style>
											<div class="product-add-to-cart">
												<span class="control-label">庫存數量:</span>

												<div class="cart-plus-minus">
													<input class="cart-plus-minus-box" type="text"
														name="quantity" value="<%=goodsVO.getGd_qty()%>" readonly>
												</div>

												<td><c:if
														test="<%=goodsVO.getGd_shelf() == 1 && goodsVO.getGd_qty() != 0%>">
														<FORM METHOD="post"
															ACTION="<%=request.getContextPath()%>/front-end/or/or.do"
															style="margin-bottom: 0px;">
															<input type="submit" value="立即搶購"> <input
																type="hidden" name="gd_no" value="${goodsVO.gd_no}">
															<input type="hidden" name="gd_qty"
																value="${goodsVO.gd_qty}"> <input type="hidden"
																name="or_price" value="${goodsVO.gd_price}"> <input
																type="hidden" name="action" value="getInsert">
														</FORM>
													</c:if> <c:if test="<%=goodsVO.getGd_shelf() == 0%>">
														<input type="button" value="商品已下架" disabled>
													</c:if> <c:if test="<%=goodsVO.getGd_qty() == 0%>">
														<input type="button" value="商品缺貨" disabled>
													</c:if> <c:if test="<%=goodsVO.getGd_shelf() == 3%>">
														<input type="button" value="商品已不存在" disabled>
													</c:if></td>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
			</div>

			<style type="text/css">
.product-details .countdown-timer-wrapper {
	display: none !important;
}
</style>

			<script>
				$(document).ready(function() {
					$('.fancybox').fancybox();
				});
			</script>
			<script>
				function productZoom() {
					$(".product-zoom").elevateZoom({
						gallery : 'ProductThumbs',
						galleryActiveClass : "active",
						zoomType : "inner",
						cursor : "crosshair"
					})
					$(".product-zoom").on("click", function(e) {
						var ez = $('.product-zoom').data('elevateZoom');
						$.fancybox(ez.getGalleryList());
						return false;
					});

				};
				function productZoomDisable() {
					if ($(window).width() < 767) {
						$('.zoomContainer').remove();
						$(".product-zoom").removeData('elevateZoom');
						$(".product-zoom").removeData('zoomImage');
					} else {
						productZoom();
					}
				};

				productZoomDisable();

				$(window).resize(function() {
					productZoomDisable();
				});
			</script>
			<script>
				$('.product-thumbnail').owlCarousel(
						{
							loop : true,
							center : true,
							nav : true,
							dots : false,
							margin : 10,
							autoplay : false,
							autoplayTimeout : 5000,
							navText : [ '<i class="fa fa-angle-left"></i>',
									'<i class="fa fa-angle-right"></i>' ],
							item : 3,
							responsive : {
								0 : {
									items : 2
								},
								480 : {
									items : 3
								},
								992 : {
									items : 3,
								},
								1170 : {
									items : 3,
								},
								1200 : {
									items : 3
								}
							}
						});
			</script>
		</section>
	</section>
</body>
</html>