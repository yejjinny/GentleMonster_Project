<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String ctxPath = request.getContextPath();
%>
<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/order/order.css">

<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../common/header.jsp" />

<script src="<%=ctxPath%>/js/order/order.js"></script>
<!-- 다음 postcode api오픈소스 -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>



<div class="container_sq">
	<div class="contentswrap center_wrap kr kr contentswrap-hearder">
		<div class="contentswrap_top center_wrap ">
			<div class="checkout">

				<header class="checkout-header">
					<h1 class="logo gm-c">
						<a href="수정필" style="display: block">
							<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 166 15.9">
				                <path
									d="M7.3 5.3V4.1c0-1.3-.6-1.9-2.1-1.9-1.6 0-2.2.6-2.2 1.9v7.7c0 1.3.5 1.9 2.1 1.9 1.5 0 2.2-1 2.2-2.5V9.4H4.8V7.2h5.5v8.5H7.7v-1.2c-.5.7-1.4 1.5-3.5 1.5C1.5 16 0 14.9 0 11.3V4.8C0 1.3 2.1 0 5.2 0c3 0 5.1 1.4 5.1 4.1v1.2h-3zm14.9-5v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm13.5 0v15.3H32L28 3.9v11.7h-3V.3h3.7l4 11.6V.3h3zm12.5 0v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm4.9 13.1H59v2.3h-8.9V.3h3v13.1zM69.9.3v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zM91 .3v15.3h-3V3.9l-2.6 11.8H83L80.5 3.8v11.9h-3V.3h4.2L84.2 12 86.7.3H91zM104.1 5v5.9c0 3.7-1.8 5-5.1 5s-5.1-1.2-5.1-5V5c0-3.7 1.8-5 5.1-5s5.1 1.3 5.1 5zm-3-.7c0-1.6-.6-2.1-2.1-2.1-1.6 0-2.1.5-2.1 2.1v7.4c0 1.6.6 2 2.1 2 1.6 0 2.1-.5 2.1-2V4.3zm16.7-4v15.3h-3.7l-4-11.7v11.7h-3V.3h3.7l4 11.6V.3h3zm12.3 3.6v.9h-3V4c0-1.3-.2-1.8-1.7-1.8-1.4 0-1.7.6-1.7 1.6 0 .9.2 1.3 1 1.8l2.9 1.9c1.6 1 2.5 1.6 2.5 4.4 0 2.7-1.8 4-4.7 4-3.5 0-4.9-1.2-4.9-4v-1.3h3v1.1c0 1.6.5 2 1.9 2s1.7-.6 1.7-1.7-.2-1.5-1.2-2.2L123 7.9c-1.8-1.2-2.4-1.8-2.4-4 0-1.9 1.1-3.8 4.7-3.8 3.7-.1 4.8 1.5 4.8 3.8M142.2.3v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm10.9 0v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm12.4 10.2v3.3c0 .8.2 1.5.6 1.9H163c-.3-.4-.5-1.1-.5-1.9v-3.3c0-1.2-.5-1.6-1.6-1.6h-2.1v6.8h-3V.3h5.5c4 0 4.5 2.2 4.5 4.3 0 1.7-.9 2.9-3.1 3.3 1.9.1 2.8 1.1 2.8 2.6zm-4.6-3.9c1.6 0 1.9-.7 1.9-2s-.2-2-1.9-2h-2.1v4h2.1z"
									fill="#000"
								>
								</path>
					        </svg>
						</a>
					</h1>
					<h3 class="page_title font--kr font--15 font--bd check-out-font-weight">결제</h3>
					<a class="button button-link checkout-header-return font--kr font--13 font--rg size-reset atag-line" href="수정필"> 쇼핑 계속하기 </a>
				</header>

				<div class="checkout-stepper">
					<h3 class="page_title font--kr font--15 font--bd">결제</h3>
					<ul class="checkout-header-menu">
						<li class="checkout-header-menu-item font--kr font--15 font--bd  check-out-font-weight">
							<span class="step-number">①</span> 로그인
						</li>
						<li class="checkout-header-menu-item font--kr font--15 font--bd active check-out-font-weight">
							<span class="step-number">②</span> 배송주소
						</li>
						<li class="checkout-header-menu-item font--kr font--15 font--bd  check-out-font-weight">
							<span class="step-number">③</span> 결제방법
						</li>

					</ul>
				</div>






				<div class="checkout-body pdt-type01">
					<form name="shippingFrm" id="shipping-form" class="checkout-form">
						<section class="shipping-address">
							<h3 class="page_title font--kr font--15 font--bd mb-type01">배송지 정보</h3>


							<div class="input-box">
								<label for="target_select_address" class="input-label">주소유형</label>
								<div id="target_select_address" class="select-box ws-select-box on">
									<div class="box">
										<div class="select">기본 주소</div>
										<ul class="list" style="display: none;">
											<li value="default">기본 주소</li>


											<%-- 주소록 등록된 거 있는지 여부확인 (존재한다면 실행) --%>
											<c:if test="${not empty requestScope.addressList}">

												<c:forEach var="addressVo" items="${requestScope.addressList}">
													<%-- 기본 주소일 경우 --%>
													<c:if test="${addressVo.isDefaultAddr eq 1}">
														<li value="default" class="selected-addr" onClick="clickAddress(${addressVo.addressBookId});">
													</c:if>
													<%-- end of 기본 주소일 경우 --%>

													<%-- 기본 주소 아닐 경우 --%>
													<c:if test="${addressVo.isDefaultAddr eq 0}">
														<li value="idx_1" class="selected-addr" onClick="clickAddress(${addressVo.addressBookId});">
													</c:if>
													<%-- end of 기본 주소 아닐 경우 --%>

													<div class="section-row" style="justify-content: start !important;">
														<div style="width: 105px; font-weight: bold;">${addressVo.familyName}${addressVo.lastName}</div>
														<div>${addressVo.address}</div>
													</div>
													</li>
												</c:forEach>

											</c:if>
											<%-- end of 주소록 등록된 거 있는지 여부확인 (존재한다면 실행) --%>
										</ul>


										<!-- 얜 어따쓰는지 모르겠음  수정필-->
										<!-- <button type="button" id="selectedAddress" onclick="changeAddress(this)" hidden=""></button> -->
									</div>

								</div>



								<input type="hidden" name="addressBookId" value="${requestScope.addressOne.addressBookId}" />
								<div class="box-group box-group-child-2 mttype01">
									<div class="input-box">
										<label class="input-label font--kr font--13 font--rg">성</label> <input type="text" class="width_100 padding_10 font--kr" name="mb_lname" id="login_id" size="20" maxlength="2" placeholder="성" value="${requestScope.addressOne.familyName}"> <span class="alert">성은 필수입력사항입니다.</span>
									</div>
									<div class="input-box">
										<label class="input-label font--kr font--13 font--rg">이름</label> <input type="text" class="width_100 padding_10" name="mb_fname" id="login_id" size="20" maxlength="6" placeholder="이름" value="${requestScope.addressOne.lastName}"> <span class="alert">이름은 필수입력사항입니다.</span>
									</div>
								</div>

								<div class="input-box mo-tel-mttype01">
									<p class="input-label font--kr font--13 font--rg">전화번호</p>
									<input type="tel" name="mb_hp" id="ship_tel" placeholder="전화번호" class="rg-input font--kr font--13" value="${requestScope.addressOne.tel}"> <span class="alert">전화번호는 필수입력사항입니다.</span>
								</div>
								<div class="input-box" hidden="">
									<p class="input-label font--kr font--13 font--rg">우편번호</p>
									<div class="in-button">
										<input type="text" id="mb_zipcode" name="mb_zipcode" readonly="" class="rg-input" value="${requestScope.addressOne.postCode}">
									</div>
									<span class="alert">우편번호는 필수입력사항입니다.</span>
								</div>

								<div class="input-box post_address">
									<p class="input-label font--kr font--13 font--rg">배송지 검색</p>
									<div id="postcodify" style="margin: 0px;" class="postcodify_search_form postcode_search_form">
										<div class="postcodify_search_controls postcode_search_controls" style="display: flex;">
											<label class="keyword_label" for="postcodify_16970093347741433">검색 키워드</label> <input type="text" class="keyword font--kr font--13" readonly value="${requestScope.addressOne.address}" id="mb_addr-1" placeholder="예) 문래동 강서타워, 선유로 82" name="mb_address">
											<c:if test="${not empty requestScope.addressOne}">
												<button type="button" class="search_button gm-component__spinner-container check-out-but1" id="postcodify_16970093347741433_button" style="background: rgb(0, 0, 0); color: rgb(255, 255, 255); width: 180px; margin-left: 10px; line-height: 38px; display: none;">검색</button>
												<button type="button" class="delete_button check-out-but1 btn-black" id="delete_button" style="width: 180px; margin-left: 10px; line-height: 38px; display: block;">삭제</button>
											</c:if>
											<c:if test="${empty requestScope.addressOne}">
												<button type="button" class="search_button gm-component__spinner-container check-out-but1" id="postcodify_16970093347741433_button" style="background: rgb(0, 0, 0); color: rgb(255, 255, 255); width: 180px; margin-left: 10px; line-height: 38px;">검색</button>
												<button type="button" class="delete_button check-out-but1 btn-black" id="delete_button" style="width: 180px; margin-left: 10px; line-height: 38px; display: none;">삭제</button>
											</c:if>
										</div>
									</div>
									<span class="alert">검색버튼을 눌러 배송지 주소를 입력하여 주십시오.</span>
								</div>
								<div class="input-box">
									<p class="input-label font--kr font--13 font--rg">상세주소</p>
									<input type="text" id="mb_address_sub" name="mb_address_sub" class="rg-input font--kr" placeholder="상세주소" value="${requestScope.addressOne.detailAddress}"> <span class="alert"></span>
								</div>

								<div class="agreement-group mttype01">
									<div class="input-box input-box-check" style="margin: 0;">
										<label for="save_address"> <input type="hidden" id="change_address" name="change_address" value=""> <input type="checkbox" id="save_address" name="save_address" value="1">
											<div class="input-box-check-layer"></div> <span class="font--kr font--13 font--rg">기본 주소로 저장하기</span>
										</label>
									</div>
								</div>



								<div class="agreement-group">
									<div class="input-box input-box-check mbtype01">
										<label for="privacy-policy"> <input type="checkbox" id="privacy-policy" name="privacy_policy" value="T">
											<div class="input-box-check-layer"></div> <span class="font--kr font--13  font--rg"> <a class="link" target="_blank" href="수정필">이용약관</a>, <a class="link" target="_blank" href="수정필">개인정보 수집 및 이용</a> 에 동의합니다. (필수)
										</span>
										</label>
									</div>
									<div class="input-box input-box-check mbtype01" style="display: none">
										<label for="privacy-policy-hidden"> <input type="checkbox" id="privacy-policy-hidden" name="privacy_policy" value="T">
											<div class="input-box-check-layer"></div> <span class="font--kr font--13  font--rg"> <a class="link" target="_blank" href="수정필">이용약관</a>, <a class="link" target="_blank" href="수정필">개인정보처리방침</a>에 동의합니다. (필수)
										</span>
										</label>
									</div>
								</div>
							</div>
						</section>

						<div class="button-group button-group-layout-side-reverse btngroup-mttype01">
							<button type="button" class="button checkout-button gm-component__spinner-container button-primary font--kr font--13 font--rg" id="go_to_payment">
								<div class="gm-component__spinner-wrapper checkout-loading">
									<div class="gm-component__spinner dark"></div>
								</div>
								<span>다음 단계로</span>
							</button>
							<button type="button" class="button font--kr font--13 font--rg" onclick="history.back()">이전 단계로</button>
						</div>
					</form>
				</div>

				<aside id="summary-fix" class="checkout-side-content" style="">

					<div class="section-row">
						<h3 class="checkout-title font--kr font--15 font--bd check-out-font-weight">주문내용</h3>
						<!-- 쇼핑백으로 돌아가기 -->
						<a href="수정필">
							<u>수정</u>
						</a>
					</div>
					<ul class="checkout-summary">
						<li class="checkout-summary-head">
							<span class="font--kr font--13 font--rg">상품</span> <span class="font--kr font--13 font--rg">가격</span>
						</li>
						<li>
							<ul class="checkout-summary-list scrollHalf">

								<c:forEach var="cartVo" items="${sessionScope.cartList}">
									<li class="checkout-summary-item " style="margin-top: 2px;">
										<div class="checkout-summary-image">
											<img src="<%= ctxPath %>${cartVo.mainImageFile}" alt="${cartVo.productName}">
										</div>
										<div class="checkout-summary-data">
											<p class="checkout-summary-price font--kr font--13 font--rg">
												<input type="hidden" name="sell_price_total" value="${cartVo.price * cartVo.quantity}" />
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price * cartVo.quantity}" />
												원
											</p>
											<p class="checkout-summary-name font--kr font--13 font--bd">${cartVo.productName}</p>
											<p class="checkout-summary-stock font--kr font--13 font--rg">수량: ${cartVo.quantity}</p>

											<p></p>
										</div>
									</li>
								</c:forEach>


							</ul>
						</li>
						<li class="checkout-summary-head mbtype01 total-checkout-summary-head">
							<span class="font--en font--13 font--rg">상품합계</span> <span class="totalAmount font--kr font--13 font--rg"></span>
						</li>

						<!-- 배송비 확인해보기 -->
						<li class="checkout-summary-head checkout-summary-head--total checkout-total-type01 total-checkout-summary-tax">
							<span class="font--kr font--13 font--rg"> 배송비 </span> <span class="font--kr font--13 font--rg">0원</span>
						</li>

						<li>
							<hr class="checkout-summary-divider mttype01 mbtype01">
						</li>
						<li class="checkout-summary-head checkout-summary-head--total">
							<span class="font--kr font--13 font--rg">총합계 (수량: ${fn:length(cartList)})</span> <span class="checkout-summary-price font--kr font--13 font--rg"></span>
						</li>
					</ul>
				</aside>


			</div>
		</div>


	</div>
</div>
<jsp:include page="../common/footer.jsp" />




