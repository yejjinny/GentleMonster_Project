<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
//    /tempSemi
%>

<%-- header meta관련--%>
<jsp:include page="../common/header_meta.jsp" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/bootstrap/bootstrap.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/glasses/glasses_viewDetail.css" />





<!--  이게 뭐냐면... 젠몬공식사이트에 있는 html 전체복사 중 link 된 것  확인하고 파일 만들어서 css에 넣고 위에 링크넣기 (안 돌아가면 이거 주석 풀어보는 것도?)
<link href="https://www.gentlemonster.com/kr/assets/scss/visualize.css?ver=230915_3" rel="stylesheet">
<link href="https://www.gentlemonster.com/kr/assets/scss/style.css?ver=230915_3" rel="stylesheet">
<link href="https://www.gentlemonster.com/kr/assets/scss/common.css?ver=230915_3" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="https://www.gentlemonster.com/kr/assets/css/renew2022/shop/common.css?ver=230915_3">
-->




<!-- 상품명 수정필 -->
<title>상품명 | GENTLE MONSTER Official Site</title>
<%-- header --%>
<jsp:include page="../common/header.jsp" />








<%-- 본문 --%>







<div class="container_sq">
	<!-- !ceg(210520) WOW 제품 일 경우 class 'world-of-warcraft' 추가 -->
	<div class="detail layout-container ">
		<!--// !ceg WOW 제품 일 경우 class 'world-of-warcraft' 추가 -->
		<div class="detail__content jsDetailCont flex">
			<!-- Detail images -->
			<div class="detail-imgs relative">
				<div class="detail-imgs__container jsImgSlide" data-break="768">
					<div class="detail-imgs__wrapper inline">
						<!-- IMG SECTION -->
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_01.jpg" alt="알리오 X 01">
							</div>
						</div>
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_02.jpg" alt="알리오 X 01">
							</div>
						</div>
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_04.jpg" alt="알리오 X 01">
							</div>
						</div>
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_05.jpg" alt="알리오 X 01">
							</div>
						</div>
						<div class="detail-imgs__item relative">
							<div class="detail-imgs__content">
								<img class="detail-imgs__image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_WEB_2023_OPT_PACKAGE_167.jpg" alt="알리오 X 01">
							</div>
						</div>
					</div>
				</div>
				<div class="detail__scrollbar jsSlideScrollbar"></div>
				<div class="detail__pagination jsSlidePagination font--en"></div>
			</div>
			<!--// Detail images -->
			<!-- Colors : Mobile check필요-->



			<div class="product-colors product-colors--mobile">
				<ul class="product-colors__list inline">
					aga;8NX8YBQ7JSZW
					<li class="product-colors__item relative on">
						<a href="https://www.gentlemonster.com/kr/shop/item/aliox01/8NX8YBQ7JSZW" class="product-colors__link" style="background-image: url('https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_01.jpg');"></a>
					</li>
					aga;9F9VZTIU98HM
					<li class="product-colors__item relative ">
						<a href="https://www.gentlemonster.com/kr/shop/item/alioxb4/9F9VZTIU98HM" class="product-colors__link" style="background-image: url('https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210137402_01.jpg');"></a>
					</li>
					aga;9F9VZTIUFM4E
					<li class="product-colors__item relative ">
						<a href="https://www.gentlemonster.com/kr/shop/item/alioxc1/9F9VZTIUFM4E" class="product-colors__link" style="background-image: url('https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210435006_01.jpg');"></a>
					</li>
					aga;9F9VZTIUMZXR
					<li class="product-colors__item relative ">
						<a href="https://www.gentlemonster.com/kr/shop/item/alioxgd1/9F9VZTIUMZXR" class="product-colors__link" style="background-image: url('https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210779503_01.jpg');"></a>
					</li>
				</ul>
			</div>
			<!--// Colors : Mobile -->
			<!-- Product info -->
			<div class="product-info jsPrdInfoWrap">
				<div class="product-info__content relative jsPrdInfoCont">
					<!-- bluelight -->
					<div class="product__blue-light font--11 font--rg">Blue Light Protection</div>
					<!--// bluelight -->
					<div class="product-info__top clearfix">
						<!-- Name -->
						<h1 class="product-name font--kr font--bd font--20 word-break word-break--kr">알리오 X 01</h1>
						<!--// Name -->
						<!-- Price -->
						<div class="product-price font--kr font--md font--15">310,000원</div>
						<!--// Price -->
					</div>
					<!-- 종현님 duty-->
					<!-- Colors : Web -->
					<div class="product-colors product-colors--pc">
						<ul class="product-colors__list inline">
							<li class="product-colors__item relative on">
								<a href="https://www.gentlemonster.com/kr/shop/item/aliox01/8NX8YBQ7JSZW" class="product-colors__link" style="background-image: url(https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1140442012219889804_01.jpg);"></a>
							</li>
							<li class="product-colors__item relative ">
								<a href="https://www.gentlemonster.com/kr/shop/item/alioxb4/9F9VZTIU98HM" class="product-colors__link" style="background-image: url(https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210137402_01.jpg);"></a>
							</li>
							<li class="product-colors__item relative ">
								<a href="https://www.gentlemonster.com/kr/shop/item/alioxc1/9F9VZTIUFM4E" class="product-colors__link" style="background-image: url(https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210435006_01.jpg);"></a>
							</li>
							<li class="product-colors__item relative ">
								<a href="https://www.gentlemonster.com/kr/shop/item/alioxgd1/9F9VZTIUMZXR" class="product-colors__link" style="background-image: url(https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_1240442012210779503_01.jpg);"></a>
							</li>
						</ul>
					</div>
					<!--// Colors : Web -->
					<!-- Description -->
					<div class="product-desc font--kr font--rg font--13 word-break word-break--kr">
						알리오 X 01은 사각형태의 블랙 콤비 프레임입니다. 기존 하금테 프레임인 알리오 모델을 재해석하여 티타늄이 사용된 클래식한 제품입니다. 2021 Collection에서 새롭게 선보인 팁 디자인과 로고 디테일이 브랜드의 아이덴티티를 강조하며 엔드피스의 메탈 장식이 특징입니다. 블루라이트 차단과 99.9% UV 차단이 되는 클리어 렌즈를 사용하였습니다.
						<!-- 마르지엘라 제품 - 구매 제한 문구 -->
					</div>
					<!--// Description -->



					<div class="detail__btn-wrap">
						<!-- 일시 품절 -> 로그인 알림 버튼 -->
						<div id="button-checkout" class="detail__btn-list">
							<button class="detail__btn btn-ui btn-ui--black font--kr font--bd font--13" onclick="addToCart()" data-category="ecommerce" data-action="add_to_cart" product-name="알리오 X 01" product-sku="8NX8YBQ7JSZW" product-price="310000">
								<div class="cart-loading gm-component__spinner-wrapper">
									<div class="gm-component__spinner dark"></div>
								</div>
								<span class="cart-text"> 쇼핑백에 추가 </span>
							</button>
						</div>

						<!-- ALL -->
						<div class="detail__btn-list">
							<button class="detail__btn btn-ui font--kr font--bd font--13 jsBtnWish" data-category="ecommerce" data-action="add_to_wishlist" data-id="8NX8YBQ7JSZW">관심상품 추가</button>
						</div>
					</div>

					<!-- Service info -->
					<div class="service-info font--kr font--bd font--11">무료 배송 및 무료 반품 서비스</div>
					<!--// Service info -->





					<!-- Detail info -->
					<div class="detail-info">
						<!-- Spec ### -->
						<div class="detail-info__box">
							<div class="detail-info__top relative jsInfoToggle on">
								<div class="detail-info__subject font--kr font--rg font--13">제품 세부 정보</div>
								<div class="detail-info__arrow n-arrow n-arrow--up jsInfoArrow"></div>
							</div>

							<!-- giftcard Detail info  -->
							<div class="detail-info__content jsInfoContent" style="display: block;">
								<div class="detail-info__row">
									<div class="detail-info__txt font--kr font--rg font--13 word-break word-break--kr">
										<p>
											<span class="detail-info__txt detail-info__txt--bullet">블루라이트 차단</span><span class="detail-info__txt detail-info__txt--bullet">슬림한 하금테 스타일</span><span class="detail-info__txt detail-info__txt--bullet">메탈 라이닝 디테일</span><span class="detail-info__txt detail-info__txt--bullet">β-티타늄 소재의 템플</span><span class="detail-info__txt detail-info__txt--bullet">프레임 정면: 139.2mm, 템플 길이: 148mm<br>렌즈 가로: 49.5mm, 렌즈 높이: 43.2mm<br>브릿지: 21mm
											</span>
										</p>

										<span class="detail-info__txt detail-info__txt--bullet"> <!-- 제조자 --> 제조자 및 수입자: IICOMBINED CO., LTD.
										</span> <span class="detail-info__txt detail-info__txt--bullet"> <!-- 제조국명 --> 제조국명: 중국
										</span>
									</div>
								</div>
							</div>
						</div>
						<!--// Spec -->

						<!-- Deliery&Return -->
						<div class="detail-info__box">
							<div class="detail-info__top relative jsInfoToggle">
								<div class="detail-info__subject font--kr font--rg font--13">배송 &amp; 반품</div>
								<div class="detail-info__arrow n-arrow n-arrow--down jsInfoArrow"></div>
							</div>
							<div class="detail-info__content jsInfoContent">
								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet"> <!-- 무료 배송 --> 무료 배송<br>오늘 주문한 상품을 영업일 기준 1-3일내에 받아보세요.<br>
										</span>
									</div>
								</div>




								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet"> <!-- 무료 반품 --> 무료 반품<br>무료 반품 서비스를 이용하세요. 구매하신 제품은 수령하신 날로부터 7일 이내에 접수해 주셔야 합니다. 제품은 사용되지 않은 상태를 유지해야 하며, 모든 구성품을 포함하고 있어야 합니다.<br>
										</span>
									</div>
								</div>

								<!-- 무료 선물 포장 서비스 -->
								<div class="detail-info__row">
									<div class="font--kr font--rg font--14 word-break word-break--kr">
										<span class="detail-info__txt detail-info__txt--bullet"> 무료 선물 포장 서비스<br>젠틀몬스터 공식 온라인 스토어에서 구매하는 모든 분들께 선물 포장 서비스를 제공해 드립니다. <br>
										<br> <img src="https://web-resource.gentlemonster.com/assets/img/shop/package/gift_wrapping_2023.jpg" alt="">
										</span>
									</div>
								</div>

							</div>
						</div>
						<!--// Deliery&Return -->



						<!-- import duty & tax -->


					</div>
					<!--// Detail info -->
				</div>
			</div>
			<!--// Product info -->
		</div>
	</div>
	<!-- Installment / BoxingSystem / Pickup Modal -->
</div>






<%-- footer --%>
<jsp:include page="../common/footer.jsp" />