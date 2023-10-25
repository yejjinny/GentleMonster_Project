<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String ctxPath = request.getContextPath();
%>
<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/order/order_pay.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/order/order_pay.js"></script>

<div class="container_sq">
	<div class="contentswrap center_wrap kr kr contentswrap-hearder">
		<div class="contentswrap_top center_wrap ">
			<div class="checkout">

				<header class="checkout-header">
					<h1 class="logo gm-c">
						<a href="https://www.gentlemonster.com/kr/" aria-label="GENTLE MONSTER" style="display: block">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 166 15.9">
				                <path d="M7.3 5.3V4.1c0-1.3-.6-1.9-2.1-1.9-1.6 0-2.2.6-2.2 1.9v7.7c0 1.3.5 1.9 2.1 1.9 1.5 0 2.2-1 2.2-2.5V9.4H4.8V7.2h5.5v8.5H7.7v-1.2c-.5.7-1.4 1.5-3.5 1.5C1.5 16 0 14.9 0 11.3V4.8C0 1.3 2.1 0 5.2 0c3 0 5.1 1.4 5.1 4.1v1.2h-3zm14.9-5v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm13.5 0v15.3H32L28 3.9v11.7h-3V.3h3.7l4 11.6V.3h3zm12.5 0v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm4.9 13.1H59v2.3h-8.9V.3h3v13.1zM69.9.3v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zM91 .3v15.3h-3V3.9l-2.6 11.8H83L80.5 3.8v11.9h-3V.3h4.2L84.2 12 86.7.3H91zM104.1 5v5.9c0 3.7-1.8 5-5.1 5s-5.1-1.2-5.1-5V5c0-3.7 1.8-5 5.1-5s5.1 1.3 5.1 5zm-3-.7c0-1.6-.6-2.1-2.1-2.1-1.6 0-2.1.5-2.1 2.1v7.4c0 1.6.6 2 2.1 2 1.6 0 2.1-.5 2.1-2V4.3zm16.7-4v15.3h-3.7l-4-11.7v11.7h-3V.3h3.7l4 11.6V.3h3zm12.3 3.6v.9h-3V4c0-1.3-.2-1.8-1.7-1.8-1.4 0-1.7.6-1.7 1.6 0 .9.2 1.3 1 1.8l2.9 1.9c1.6 1 2.5 1.6 2.5 4.4 0 2.7-1.8 4-4.7 4-3.5 0-4.9-1.2-4.9-4v-1.3h3v1.1c0 1.6.5 2 1.9 2s1.7-.6 1.7-1.7-.2-1.5-1.2-2.2L123 7.9c-1.8-1.2-2.4-1.8-2.4-4 0-1.9 1.1-3.8 4.7-3.8 3.7-.1 4.8 1.5 4.8 3.8M142.2.3v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm10.9 0v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm12.4 10.2v3.3c0 .8.2 1.5.6 1.9H163c-.3-.4-.5-1.1-.5-1.9v-3.3c0-1.2-.5-1.6-1.6-1.6h-2.1v6.8h-3V.3h5.5c4 0 4.5 2.2 4.5 4.3 0 1.7-.9 2.9-3.1 3.3 1.9.1 2.8 1.1 2.8 2.6zm-4.6-3.9c1.6 0 1.9-.7 1.9-2s-.2-2-1.9-2h-2.1v4h2.1z"
									fill="#000"></path>
				            </svg>
						</a>
					</h1>
					<h3 class="page_title font--kr font--15 font--bd check-out-font-weight">결제</h3>
					<a class="button button-link checkout-header-return font--kr font--13 font--rg size-reset atag-line" href="https://www.gentlemonster.com/kr/" data-category="ecommerce" data-action="continue_shop"> 쇼핑 계속하기 </a>
				</header>

				<div class="checkout-stepper">
					<h3 class="page_title font--kr font--15 font--bd">결제</h3>
					<ul class="checkout-header-menu">
						<li class="checkout-header-menu-item font--kr font--15 font--bd  check-out-font-weight">
							<span class="step-number">①</span>
							로그인
						</li>
						<li class="checkout-header-menu-item font--kr font--15 font--bd  check-out-font-weight">
							<span class="step-number">②</span>
							배송주소
						</li>
						<li class="checkout-header-menu-item font--kr font--15 font--bd active check-out-font-weight">
							<span class="step-number">③</span>
							결제방법
						</li>

					</ul>
				</div>

				<div style="display: inline-block;">
					<div class="checkout-body mo-checkout-body">
						<section>
							<h3 class="checkout-title font--kr font--15 font--bd checkout_mb32">주문 상세</h3>

							<div class="text-box checkout-info-title">
								<h4 class="checkout-sub-title float-left font--kr font--13 font--bd">이메일</h4>
								<!-- <a class="button button-link float-right">수정</a> -->
							</div>
							<p class="text-box checkout-info-body mttype01 font--kr font--13 font--rg">${sessionScope.loginUser.email}</p>
							<div class="text-box checkout-info-title">
								<h4 class="checkout-sub-title float-left font--kr font--13 font--bd">배송</h4>
								<a class="button button-link float-right auto-height font--kr font--13 font--rg atag-line2" style="padding: 2px 0 !important;" href="javascript:history.back()">수정</a>
							</div>

							<div class="box-group box-group-child-2 checkout-info-body mttype01 group-type01">
								<div class="text-box">
									<p class="text-box line-height25 font--kr font--13 font--rg">배송주소</p>
									<div class="text-box mttype02">
										<p class="font--kr font--13 font--rg">${sessionScope.addressOne.familyName}${sessionScope.addressOne.lastName}</p>
										<p class="font--kr font--13 font--rg">${sessionScope.addressOne.address}${sessionScope.addressOne.detailAddress}</p>
										<p class="font--kr font--13 font--rg">${sessionScope.addressOne.postCode}</p>
									</div>
								</div>
								<div class="text-box">
									<p class="text-box line-height25 font--kr font--13 font--rg">전화번호</p>
									<p class="text-box line-height25 mttype02 font--kr font--13 font--rg">${sessionScope.addressOne.tel}</p>
								</div>
							</div>

							<div class="text-box checkout-info-body mttype03" style="padding-bottom: 26px;">
								<p class="text-box font--kr font--13 font--rg">배송사</p>
								<p class="text-box mttype04 font--kr font--13 font--rg">CJ대한통운</p>
							</div>
						</section>
					</div>

					<div class="checkout-body checkout-body-block checkout-result resulttype01">
						<!-- <h3 class="checkout-title mobile-show">주문내용</h3> -->
						<ul class="checkout-summary">
							<li>
								<div class="checkout-result-head checkout-result-row">
									<div class="checkout-result-col">
										<span class="mobile-hide font--kr font--13 font--bd">제품명</span>
									</div>
									<div class="checkout-result-col text_l font--kr font--13 font--rg check-out-pl14">가격</div>
									<div class="checkout-result-col font--kr font--13 font--rg" style="padding-left: 30px;">수량</div>
									<div class="checkout-result-col font--kr font--13 font--rg">소계</div>
								</div>
								<ul class="checkout-result-body font--kr font--13">



									<c:forEach var="cartVo" items="${sessionScope.cartList}">

										<li class="checkout-result-row checkout-border-top">
											<div class="checkout-result-col">
												<div class="checkout-summary-image">
													<img src="<%= ctxPath %>${cartVo.mainImageFile}" alt="${cartVo.productName}">
												</div>
												<div class="checkout-summary-data">
													<p class="checkout-summary-name font--kr font--12 font--bd">${cartVo.productName}</p>
													<p class="checkout-summary-stock font--kr font--13 font--rg">수량: ${cartVo.quantity}</p>
												</div>
											</div>
											<div class="checkout-result-col text_l">
												<p class="checkout-summary-price font--kr font--13 font--rg checkout-summary-price check-out-ml-10">
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price}" />
													원
												</p>
											</div>
											<div class="checkout-result-col check-out-mr6">
												<p class="checkout-summary-stock font--kr font--13 font--rg check-out-pl30 check-out-mr10">${cartVo.quantity}</p>
											</div>
											<div class="checkout-result-col">
												<p class="checkout-summary-price font--kr font--13 font--rg">
													<input type="hidden" name="sell_price_total" value="${cartVo.price * cartVo.quantity}" />
													<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price * cartVo.quantity}" />
													원
												</p>
											</div>
										</li>
									</c:forEach>


								</ul>
							</li>
							<li class="checkout-summary-head checkout-summary-head--subtotal mbtype01">
								<span class="font--kr font--13 font--rg">상품합계</span>
								<span id="product_total_price" class="font--kr font--13 font--rg"></span>
							</li>
							<li class="checkout-summary-head mbtype01">
								<span class="font--kr font--13 font--rg">배송비</span>
								<span class="checkout-summary-price font--kr font--13 font--rg trans-reset">0원</span>
							</li>
							<li class="checkout-summary-head checkout-summary-head--total">
								<span class="font--kr font--13 font--rg">총합계</span>
								<span class="totalAmountIncludeShip checkout-summary-price font--kr font--13 font--rg"></span>
							</li>
							<li>
								<hr class="checkout-summary-divider">
							</li>
						</ul>
					</div>
					<div class="checkout-body checkout-body-block mo_pdt0">
						<div class="agreement-group">
							<div class="input-box input-box-check mbtype01">
								<label for="privacy-policy">
									<input type="checkbox" id="privacy-policy" name="privacy_policy" value="T">
									<div class="input-box-check-layer"></div>
									<span class="font--kr font--13  font--rg">
										<a class="link" target="_blank" href="수정필">,
										<a class="link" target="_blank" href="수정필">개인정보 수집 및 이용</a>
										에 동의합니다. (필수)
									</span>
								</label>
							</div>

							<div class="input-box input-box-check mbtype01" style="display: none">
								<label for="privacy-policy-hidden">
									<input type="checkbox" id="privacy-policy-hidden" name="privacy_policy" value="T">
									<div class="input-box-check-layer"></div>
									<span class="font--kr font--13  font--rg">
										<a class="link" target="_blank" href="수정필">이용약관</a>,
										<a class="link" target="_blank" href="수정필">개인정보처리방침</a>
										에 동의합니다. (필수)
									</span>
								</label>
							</div>
						</div>

						<div class="button-group button-group-layout-side-reverse btngroup-mttype01 checkout_t48">
							<button type="button" id="go_to_payment" class="button checkout-button button-primary gm-component__spinner-container font--kr font--13 font--rg">
								<div class="gm-component__spinner-wrapper checkout-loading">
									<div class="gm-component__spinner dark"></div>
								</div>
								<span>결제</span>
							</button>
							<button type="button" class="button button-sub font--kr font--13 font--rg" onclick="history.back()">이전 단계로</button>
						</div>
					</div>
				</div>



				<form name="orderCompleteFrm" style="display: none;"></form>
			</div>
		</div>
	</div>

</div>


<jsp:include page="../common/footer.jsp" />
