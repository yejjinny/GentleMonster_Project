<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<%-- header meta관련--%>
<jsp:include page="../common/header_meta.jsp" />

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/common/product_viewDetail.css" />

<!-- 상품명 수정필 -->
<title>${requestScope.productDetail.productName} | GENTLE MONSTER Official Site</title>
<%-- header --%>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/common/product_viewDetail.js"></script>






<%-- 본문 --%>







<div class="container_sq">
	<div class="detail layout-container ">
		<div class="detail__content jsDetailCont flex">
			<!-- Detail images -->
			<div class="detail-imgs relative">
				<div class="detail-imgs__container jsImgSlide" data-break="768">
					<div class="detail-imgs__wrapper inline">

						<!-- 메인이미지 -->
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="<%= ctxPath %>${requestScope.productDetail.mainImageFile}" alt="${requestScope.productDetail.productName}">
							</div>
						</div>

						<!-- 상세이미지 -->
						<c:forEach var="pdImageVO" items="${requestScope.productDetailImageList}" varStatus="status">
							<div class="detail-imgs__item relative">
								<div class="detail-imgs__content">
									<c:if test="${fn:contains(pdImageVO.imageFile, 'mp4')}">
										<video id="" class="detail-imgs__image" autoplay="" loop="" muted="" playsinline="" poster="">
											<source src="<%= ctxPath %>${pdImageVO.imageFile}" type="video/mp4">
										</video>
									</c:if>
									<c:if test="${not fn:contains(pdImageVO.imageFile, 'mp4')}">
										<img class="detail-imgs__image" src="<%= ctxPath %>${pdImageVO.imageFile}" alt="${requestScope.productDetail.productName}">

									</c:if>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<div class="detail__scrollbar jsSlideScrollbar"></div>
				<div class="detail__pagination jsSlidePagination font--en"></div>
			</div>
			<!--// Detail images -->


			<!-- Product info -->
			<div class="product-info jsPrdInfoWrap">
				<div class="product-info__content relative jsPrdInfoCont">
					<!-- bluelight -->
					<c:if test="${requestScope.productDetail.isBlueLight eq 1}">
						<div class="product__blue-light font--11 font--rg">Blue Light Protection</div>
					</c:if>
					<!--// bluelight -->


					<div class="product-info__top clearfix">
						<!-- Name -->
						<h1 class="product-name font--kr font--bd font--20 word-break word-break--kr">${requestScope.productDetail.productName}</h1>
						<!--// Name -->
						<!-- Price -->
						<div class="product-price font--kr font--md font--15">
							<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.productDetail.price}" />
							원
						</div>
						<!--// Price -->
					</div>
					<!-- Colors : Web -->
					<div class="product-colors product-colors--pc">
						<ul class="product-colors__list inline">

							<li class="product-colors__item relative on">
								<a href="" class="product-colors__link" style="background-image: url(<%= ctxPath %>${requestScope.productDetail.mainImageFile});"></a>
							</li>

							<c:forEach var="other" items="${requestScope.otherList}" varStatus="status">
								<li class="product-colors__item relative ">
									<a href="<%= ctxPath %>/product/productDetail.gm?productDetailId=${other.productDetailId}" class="product-colors__link" style="background-image: url(<%= ctxPath %>${other.mainImageFile});"></a>
								</li>
							</c:forEach>

						</ul>
					</div>
					<!--// Colors : Web -->
					<!-- Description -->
					<div class="product-desc font--kr font--rg font--13 word-break word-break--kr">${requestScope.productDetail.description}</div>
					<!--// Description -->



					<div class="detail__btn-wrap">
						<div id="button-checkout" class="detail__btn-list">

							<!-- 재고가 0일 경우 -->
							<c:if test="${requestScope.productDetail.stock eq 0}">

								<button class="detail__btn btn-ui btn-ui--black font--kr font--bd font--13" disabled>
									<div class="cart-loading gm-component__spinner-wrapper">
										<div class="gm-component__spinner dark"></div>
									</div>
									<span class="cart-text"> 품절 </span>
								</button>

							</c:if>
							<!-- end of 재고가 0일 경우 -->


							<!-- 재고가 0이 아닐 경우 -->
							<c:if test="${requestScope.productDetail.stock ne 0}">
								<form name="addCartItemFrm">
									<input type="hidden" name="productDetailId" value="${requestScope.productDetail.productDetailId}" />
									<button type="button" class="addCart detail__btn btn-ui btn-ui--black font--kr font--bd font--13">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text"> 쇼핑백 추가 </span>
									</button>
								</form>
							</c:if>
							<!-- end of 재고가 0이 아닐 경우 -->
						</div>


						<c:if test="${not empty sessionScope.loginUser}">
							<div class="detail__btn-list">
								<button class="detail__btn btn-ui font--kr font--bd font--13 jsBtnWish" onclick="goAdd(${requestScope.productDetail.productDetailId})">관심상품 추가</button>
							</div>
						</c:if>
					</div>

					<!-- Service info -->
					<div class="service-info font--kr font--bd font--13">무료 배송 및 무료 반품 서비스</div>
					<!--// Service info -->

					<!-- Detail info -->
					<div class="detail-info">
						<!-- Spec ### -->
						<div class="detail-info__box">
							<div class="productDetailInfoTop detail-info__top relative jsInfoToggle on">
								<div class="detail-info__subject font--kr font--rg font--13">제품 세부 정보</div>
								<div class="productDetailArrow detail-info__arrow n-arrow n-arrow--up jsInfoArrow"></div>
							</div>

							<div class="productDetailInfo detail-info__content jsInfoContent" style="display: block;">
								<div class="detail-info__row">
									<div class="detail-info__txt font--kr font--rg font--13 word-break word-break--kr">
										<p>

											<c:if test="${requestScope.productDetail.isBlueLight eq 1}">
												<span class="detail-info__txt detail-info__txt--bullet">블루라이트 차단</span>
											</c:if>

											<span class="detail-info__txt detail-info__txt--bullet">${requestScope.productDetail.silhouette}</span>
											<span class="detail-info__txt detail-info__txt--bullet">${requestScope.productDetail.detail}</span>
											<span class="detail-info__txt detail-info__txt--bullet">
												프레임 정면: ${requestScope.productDetail.frameSize}mm, 템플 길이: ${requestScope.productDetail.templeLength}mm<br>렌즈 가로: ${requestScope.productDetail.lenseWidthSize}mm, 렌즈 높이: ${requestScope.productDetail.lenseHeightSize}mm<br>브릿지: ${requestScope.productDetail.bridge}mm
											</span>
										</p>

										<span class="detail-info__txt detail-info__txt--bullet"> 제조자 및 수입자: IICOMBINED CO., LTD. </span>
										<span class="detail-info__txt detail-info__txt--bullet"> 제조국명: 중국 </span>
									</div>
								</div>
							</div>
						</div>
						<!--// Spec -->

						<!-- Deliery&Return -->
						<div class="detail-info__box">
							<div class="shipInfoTop detail-info__top relative jsInfoToggle">
								<div class="detail-info__subject font--kr font--rg font--13">배송 &amp; 반품</div>
								<div class="shipInfoArrow detail-info__arrow n-arrow n-arrow--down jsInfoArrow"></div>
							</div>
							<div class="shipInfo detail-info__content jsInfoContent">
								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet">
											<!-- 무료 배송 -->
											무료 배송<br>오늘 주문한 상품을 영업일 기준 1-3일내에 받아보세요.<br>
										</span>
									</div>
								</div>


								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet">
											<!-- 무료 반품 -->
											무료 반품<br>무료 반품 서비스를 이용하세요. 구매하신 제품은 수령하신 날로부터 7일 이내에 접수해 주셔야 합니다. 제품은 사용되지 않은 상태를 유지해야 하며, 모든 구성품을 포함하고 있어야 합니다.<br>
										</span>
									</div>
								</div>

								<!-- 무료 선물 포장 서비스 -->
								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet">
											무료 선물 포장 서비스<br>젠틀몬스터 공식 온라인 스토어에서 구매하는 모든 분들께 선물 포장 서비스를 제공해 드립니다. <br> <br>
											<img src="https://web-resource.gentlemonster.com/assets/img/shop/package/gift_wrapping_2023.jpg" alt="">
										</span>
									</div>
								</div>

							</div>
						</div>

					</div>
				</div>
			</div>
			<!--// Product info -->
		</div>
	</div>
</div>






<%-- footer --%>
<jsp:include page="../common/footer.jsp" />