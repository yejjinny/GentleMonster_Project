<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>
<!-- JavaScript -->
<script src="<%=ctxPath%>/js/jquery-3.7.1.min.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/js/common/header.js"></script>
<script src="<%=ctxPath%>/js/bootstrap.bundle.min.js" type="text/javascript"></script>

<!-- CSS -->
<link rel="icon" href="<%=ctxPath%>/image/gm-logo.png" />
<link rel="apple-touch-icon" href="<%=ctxPath%>/image/gm-logo.png" />
<link rel="stylesheet" href="<%=ctxPath%>/css/common/common.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/bootstrap/bootstrap.min.css" type="text/css">

</head>
<body>
	<div class="n-header-wrap relative n-header--bg- jsNHeaderWrap sticky">
		<div class="n-header-sticky">
			<!-- header -->
			<header class="n-header jsNHeader">
				<div class="n-header-container kr jsScrollHeight jsNHeaderCont noti-scroll-header">
					<div class="n-header__inner relative">
						<div class="n-header__logo float-left">
							<a href="<%=ctxPath%>/index.gm" style="display: block">
								<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 166 15.9">
                            <path
										d="M7.3 5.3V4.1c0-1.3-.6-1.9-2.1-1.9-1.6 0-2.2.6-2.2 1.9v7.7c0 1.3.5 1.9 2.1 1.9 1.5 0 2.2-1 2.2-2.5V9.4H4.8V7.2h5.5v8.5H7.7v-1.2c-.5.7-1.4 1.5-3.5 1.5C1.5 16 0 14.9 0 11.3V4.8C0 1.3 2.1 0 5.2 0c3 0 5.1 1.4 5.1 4.1v1.2h-3zm14.9-5v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm13.5 0v15.3H32L28 3.9v11.7h-3V.3h3.7l4 11.6V.3h3zm12.5 0v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm4.9 13.1H59v2.3h-8.9V.3h3v13.1zM69.9.3v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zM91 .3v15.3h-3V3.9l-2.6 11.8H83L80.5 3.8v11.9h-3V.3h4.2L84.2 12 86.7.3H91zM104.1 5v5.9c0 3.7-1.8 5-5.1 5s-5.1-1.2-5.1-5V5c0-3.7 1.8-5 5.1-5s5.1 1.3 5.1 5zm-3-.7c0-1.6-.6-2.1-2.1-2.1-1.6 0-2.1.5-2.1 2.1v7.4c0 1.6.6 2 2.1 2 1.6 0 2.1-.5 2.1-2V4.3zm16.7-4v15.3h-3.7l-4-11.7v11.7h-3V.3h3.7l4 11.6V.3h3zm12.3 3.6v.9h-3V4c0-1.3-.2-1.8-1.7-1.8-1.4 0-1.7.6-1.7 1.6 0 .9.2 1.3 1 1.8l2.9 1.9c1.6 1 2.5 1.6 2.5 4.4 0 2.7-1.8 4-4.7 4-3.5 0-4.9-1.2-4.9-4v-1.3h3v1.1c0 1.6.5 2 1.9 2s1.7-.6 1.7-1.7-.2-1.5-1.2-2.2L123 7.9c-1.8-1.2-2.4-1.8-2.4-4 0-1.9 1.1-3.8 4.7-3.8 3.7-.1 4.8 1.5 4.8 3.8M142.2.3v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm10.9 0v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm12.4 10.2v3.3c0 .8.2 1.5.6 1.9H163c-.3-.4-.5-1.1-.5-1.9v-3.3c0-1.2-.5-1.6-1.6-1.6h-2.1v6.8h-3V.3h5.5c4 0 4.5 2.2 4.5 4.3 0 1.7-.9 2.9-3.1 3.3 1.9.1 2.8 1.1 2.8 2.6zm-4.6-3.9c1.6 0 1.9-.7 1.9-2s-.2-2-1.9-2h-2.1v4h2.1z"
									></path>
                        </svg>
							</a>
						</div>
						<div class="n-header__nav n-header__pc text-center kr">
							<nav class="n-nav">
								<ul class="n-nav__list inline">
									<li class="n-nav__item">
										<a href="<%=ctxPath%>/product/product.gm?categoryId=1" data-category="navigation" data-action="sunglasses" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd" onclick="return delCurrentScroll();">선글라스</a>
									</li>
									<li class="n-nav__item">
										<a href="<%=ctxPath%>/product/product.gm?categoryId=2" data-category="navigation" data-action="glasses" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd" onclick="return delCurrentScroll();">안경</a>
									</li>
									<li class="n-nav__item">
										<a href="<%=ctxPath%>/style/style.gm" data-category="navigation" data-action="styles" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd">스타일</a>
									</li>
									<li class="n-nav__item">
										<a href="<%=ctxPath%>/store/store.gm" data-category="navigation" data-action="stores" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd">매장보기</a>
									</li>

									<%-- 관리자 _ 민경--%>
									<c:if test="${sessionScope.loginUser.grade == 2}">
										<li class="n-nav__item">
											<a href="<%=ctxPath%>/admin/memberList.gm" style="color: blue;" data-category="navigation" data-action="stores" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd">회원목록</a>
										</li>
										<li class="n-nav__item">
											<a href="<%=ctxPath%>/admin/addProduct.gm" style="color: blue;" data-category="navigation" data-action="stores" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd">상품등록</a>
										</li>
										<li class="n-nav__item">
											<a href="<%=ctxPath%>/admin/orderList.gm" style="color: blue;" data-category="navigation" data-action="stores" data-label="main-menu" class="n-nav__link font--kr font--13 font--bd">전체주문목록</a>
										</li>
									</c:if>
									<%-- 관리자 끝 --%>
								</ul>
							</nav>
						</div>
						<div class="float-right clearfix relative">
							<div class="n-search float-left relative">
								<div class="n-search__top jsSearchTop">
									<button data-toggle="modal" data-target="#searchModal" type="button" class="n-header__search n-header__mo float-left jsHeaderSearch" data-category="navigation" data-action="search" data-label="search" aria-expanded="false" aria-controls="top_search_section" aria-label="Search" tabindex="">
										<svg stroke="#000000" version="1.1" baseProfile="basic" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve">
                                <path d="M13.5,24.1c-5.8,0-10.6-4.8-10.6-10.6S7.7,2.9,13.5,2.9s10.6,4.8,10.6,10.6S19.3,24.1,13.5,24.1z M13.5,4.1
                                c-5.2,0-9.4,4.2-9.4,9.4c0,5.2,4.2,9.4,9.4,9.4c5.2,0,9.4-4.2,9.4-9.4C22.9,8.3,18.7,4.1,13.5,4.1z"></path>
                                <rect x="21.2" y="20.7" transform="matrix(0.787 -0.617 0.617 0.787 -10.2878 18.6108)" width="1.2" height="7.1"></rect>
                            </svg>
									</button>
								</div>
							</div>
							<div class="n-header__right float-left clearfix relative">

								<%-- 로그인 _ 민경--%>
								<c:if test="${empty sessionScope.loginUser}">
									<div class="n-header__account n-header__pc float-left" id="loginBtn">
										<a href="<%=ctxPath%>/register/login.gm" data-category="navigation" data-action="login" data-label="main-menu" class="n-header__link font--kr font--13 font--md" id="loginBtn"> 로그인 </a>
									</div>
								</c:if>
								<c:if test="${not empty sessionScope.loginUser}">
									<div class="n-header__account n-header__pc float-left" id="loginBtn">
										<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" data-category="navigation" data-action="login" data-label="main-menu" class="n-header__link font--kr font--13 font--md" id="loginBtn"> 회원정보 </a>
									</div>
								</c:if>
								<%-- 로그인 _ 민경--%>
								<div class="n-header__cart float-left relative" id="cartIcon">
									<button data-toggle="modal" data-target="#cartModal" type="button" data-category="navigation" data-action="cart" data-label="cart" aria-expanded="false" aria-controls="cart_section_popup" aria-label="Cart">
										<span class="n-header__cart-icon">
											<svg stroke="#000000" version="1.2" baseProfile="tiny" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve" aria-label="cart">
                                        <path d="M20.7,8.9c0.1-1.3,0.1-4.5-1.7-6.5c-1-1.1-2.3-1.6-3.9-1.6c-1.7,0-3,0.6-3.9,1.6c-1.7,2-1.8,5.2-1.7,6.5H3.6v19.8h22.9V8.9
                                        H20.7z M12,3.3c0.7-0.8,1.7-1.2,3-1.2c1.3,0,2.3,0.4,3,1.2c1.5,1.7,1.5,4.6,1.4,5.7h-8.9C10.6,7.9,10.5,5,12,3.3z M25.2,27.6H4.8
                                        V10.1h20.5V27.6z"></path>
                                    </svg>
											<c:if test="${not empty sessionScope.cartList}">
												<c:set var="cartCnt" value="0" />
												<c:forEach var="cartVo" items="${sessionScope.cartList}">
													<c:set var="cartCnt" value="${cartCnt+cartVo.quantity}" />
												</c:forEach>
												<span class="cart-count tab_cart_btn font--kr font--md">
													<c:out value="${cartCnt}" />
												</span>
											</c:if>
										</span>
									</button>
								</div>
								<button type="button" id="aside-btn_menu_open" class="n-header__mo relative float-left jsAsideBtn" data-category="navigation" data-action="menu-open" data-label="menu open" aria-expanded="false" aria-controls="mobile-menu-div" aria-label="Global Menu">
									<span class="aside-btn">
										<span class="aside-btn__bar aside-btn__bar--first"></span>
										<span class="aside-btn__bar aside-btn__bar--second"></span>
										<span class="aside-btn__bar aside-btn__bar--third"></span>
									</span>
								</button>
							</div>
						</div>
					</div>
				</div>
			</header>
			<!--// header -->
		</div>
	</div>




	<!-- 검색용 Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="searchModal">
		<div class="modal-dialog" style="max-width: 800px;">
			<div class="modal-content">

				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title font--kr">검색</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<form name="searchFrm" class="searchFrm">
						<div class="searchFrmWrap" class="font--kr">
							<input type="text" style="display: none;" />
							<input class="font--kr" type="text" name="search" id="search" placeholder="검색어를 입력하세요" autocomplete="off" />
							<button type="button" class="searchBtn">
								<svg stroke="#000000" version="1.1" baseProfile="basic" id="레이어_2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve">
	                                <path d="M13.5,24.1c-5.8,0-10.6-4.8-10.6-10.6S7.7,2.9,13.5,2.9s10.6,4.8,10.6,10.6S19.3,24.1,13.5,24.1z M13.5,4.1
	                                c-5.2,0-9.4,4.2-9.4,9.4c0,5.2,4.2,9.4,9.4,9.4c5.2,0,9.4-4.2,9.4-9.4C22.9,8.3,18.7,4.1,13.5,4.1z"></path>
	                                <rect x="21.2" y="20.7" transform="matrix(0.787 -0.617 0.617 0.787 -10.2878 18.6108)" width="1.2" height="7.1"></rect>
	                            </svg>
							</button>
						</div>
					</form>



					<div class="searchWrap">

						<%-- 최근 검색어  --%>
						<div class="searchHistory float-left">
							<div class="n-search-popup__title font--kr font--13 font--md">최근검색어</div>
							<div class="keywordHistory">
								<ul id="keywordHistory__list" class="keywordHistory__list" role="list-box">
									<%-- <c:if test="${not empty sessionScope.searchKeywordList}">
										<c:forEach var="str" items="${sessionScope.searchKeywordList}">
											<li class="keywordHistory_item">
												<a href="<%= ctxPath %>/common/searchKeyword.gm?search=${str}" class="font--kr font--14 font--md">${str}</a>
											</li>
										</c:forEach>
									</c:if> --%>
								</ul>
							</div>
						</div>

						<div class="searchCollection float-right">
							<div class="n-search-popup__title font--kr font--13 font--md">다양한 상품을 만나보세요</div>
							<div class="collection-cate">
								<ul class="collection-cate__list inline">
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/product.gm?categoryId=1">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/sunglasses/category/1.jpg" alt="선글라스-Sunglasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">선글라스</div>
										</a>
									</li>
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/product.gm?categoryId=2">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/glasses/category/1.jpg" alt="안경-Glasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">안경</div>
										</a>
									</li>
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/category.gm?bestSeller=1&categoryId=1">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/sunglasses/category/2.jpg" alt="베스트셀러-Sunglasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">베스트셀러</div>
										</a>
									</li>
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/category.gm?isBlueLight=1&categoryId=2">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/glasses/category/3.jpg" alt="블루라이트 차단-Glasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">블루라이트 차단</div>
										</a>
									</li>
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/category.gm?frameId=2&categoryId=1">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/sunglasses/category/6.jpg" alt="캣아이 프레임-Sunglasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">캣아이 프레임</div>
										</a>
									</li>
									<li class="collection-cate__item text-center">
										<a href="<%=ctxPath%>/product/category.gm?frameId=3&categoryId=1">
											<div class="collection-cate__thumb">
												<img src="<%=ctxPath%>/image/sunglasses/category/7.jpg" alt="원형 프레임-Sunglasses" class="collection-cate__img">
											</div>
											<div class="collection-cate__name font--kr font--11 font--md">원형 프레임</div>
										</a>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>









	<!-- 쇼핑백용 Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="cartModal">
		<div class="modal-dialog" style="max-width: 500px;">
			<div class="modal-content">

				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title font--kr">쇼핑백</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="cart_section_popup popup_wrap cart-layer open">
						<div class="cart_section_popup_inner font--en">
							<div class="cart_list">

								<%-- 로그인여부 확인 (로그인 되어 있을 경우) --%>
								<c:if test="${not empty sessionScope.loginUser}">

									<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>
									<c:if test="${not empty sessionScope.cartList}">
										<c:forEach var="cartVo" items="${sessionScope.cartList}" varStatus="status">

											<div class="cart_item font--11 font--md">
												<div class="cart_product_img">
													<!-- 상품 상세화면으로 이동용  -->
													<a href="<%= ctxPath %>/product/productDetail.gm?productDetailId=${cartVo.productDetailId}">
														<img src="<%= ctxPath %>${cartVo.mainImageFile}" alt="" title="">
													</a>
												</div>

												<div class="cart_product_info">
													<div class="cart_product_name font--kr font--12 font--bd">${cartVo.productName}</div>
													<div class="cart_price">
														<span class="mini_cart_item_total_price font--kr font--12 font--rg">
															<input type="hidden" value="${cartVo.price}" id="primeCost${cartVo.cartId}" />
															<input type="hidden" value="${cartVo.price * cartVo.quantity}" name="price_total" id="price${cartVo.cartId}" />
															<span class="cartItemTotalPrice" id="mini_cart_item_total_price${cartVo.cartId}">
																<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price * cartVo.quantity}" />
																원
															</span>
														</span>
													</div>


													<div class="cart_product_etc headerCart">
														<div class="field">
															<button type="button" class="subtract_qty" onclick="goUpdateModal(${cartVo.cartId}, 'subtract');">-</button>
															<input type="number" class="input_qty font--kr font--12 font--rg" id="cartQuantity${cartVo.cartId}" value="${cartVo.quantity}" min="1" max="10" readonly="false">
															<button type="button" class="add_qty" onclick="goUpdateModal(${cartVo.cartId}, 'add');">+</button>
														</div>
													</div>
												</div>
												<div id="remove_item">
													<button type="button" class="remove_item font--kr font--12 font--rg" onclick="goDeleteModal(${cartVo.cartId});">삭제</button>
												</div>
											</div>
										</c:forEach>
									</c:if>
									<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>


									<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>
									<c:if test="${empty sessionScope.cartList}">
										<div class="noItemInCart font--kr font--15 font--bd">쇼핑백에 등록된 상품이 없습니다.</div>
									</c:if>
									<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>


								</c:if>
								<%-- end of 로그인여부 확인 (로그인 되어 있을 경우) --%>



								<%-- 로그인여부 확인 (로그인 안 되어 있을 경우)  --%>
								<c:if test="${empty sessionScope.loginUser}">
									<div class="noLoginUser font--kr font--15 font--bd">로그인이 되어있지 않습니다. 로그인 후 이용해주세요</div>
								</c:if>
								<%-- end of 로그인여부 확인 (로그인 안 되어 있을 경우)  --%>
							</div>


							<%-- 로그인여부 확인 (로그인 되어 있을 경우) --%>
							<c:if test="${not empty sessionScope.loginUser}">
								<div class="cart_group" id="cart_group">
									<input type="hidden" name="records" value="2">
									<div class="cart_total_box">
										<div class="cart_shipping">
											<div class="cart_subtotal font--13 font--md font--kr" style="position: inherit !important; border-top: none;">
												<span class="cart_label font--kr">배송비</span>
												<span class="cart_shipping font--kr">무료</span>
											</div>
										</div>
										<div class="cart_total">
											<div class="cart_subtotal font--13 font--md" style="position: inherit !important;">
												<span class="cart_label font--kr font--13 font--rg">합계</span>
												<span class="cart_amount font--kr font--13 font--rg"></span>
											</div>
										</div>
										<div class="cart_btn_group">
											<div class="btn_item cart_popup_btn font--rg font--11">
												
												<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>
												<c:if test="${not empty sessionScope.cartList}">
													<button class="cartOrderBtnHeader cart-layer__btn font--kr font--12 font--rg" type="submit">결제하기</button>
												</c:if>
												<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>
												
												<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>
												<c:if test="${empty sessionScope.cartList}">
													<button class="cartOrderBtnHeader cart-layer__btn font--kr font--12 font--rg" type="submit" disabled>결제하기</button>
												</c:if>
												<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>
												
											</div>
											<div class="btn_item cart_popup_btn">
												<a class="cart-layer__btn cart-layer__btn--white font--kr font--rg font--12" href="<%=ctxPath%>/cart/cart.gm" data-category="ecommerce&quot;" data-action="view_cart">자세히 보기</a>
											</div>
										</div>
									</div>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>