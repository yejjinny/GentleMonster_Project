<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/cart/cart.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/cart/cart.js"></script>



<div class="container_sq">
	<!-- 장바구니 시작 -->
	<div class="contentswrap center_wrap cart_wrapper">
		<div class="contentswrap_top center_wrap ">
			<div class="center width_100 text_l" style="max-width: 1419px">
				<div class="content_cart_item">
					<p class="text_l color_0 padding_b30 font--kr font--15 font--bd">쇼핑백</p>

					<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>
					<c:if test="${not empty requestScope.cartList}">


						<%-- 타이틀 관련 --%>
						<div class="head">
							<p class="product font--kr font--13 font-rg">상품</p>
							<p class="price font--en font--13 font-rg">가격</p>
						</div>


						<div id="sod_bsk">
							<div class="tbl_head01 tbl_wrap width_100">
								<table id="cart-item-table" class="width_100">
									<tbody>
										<c:forEach var="cartVo" items="${requestScope.cartList}" varStatus="status">

											<tr style="border-bottom: 1px solid #e0e0e0">

												<%-- 상품대표이미지 --%>
												<td class="sod_img">
													<!-- 상품상세화면으로 가도록 -->
													<a class="cursor_p" href="수정필?productDetailId=${cartVo.productDetailId}">
														<img src="<%= ctxPath %>${cartVo.mainImageFile}" alt="" title="">
													</a>
												</td>

												<%-- 상품명 --%>
												<td class="sod_name text_l color_0" valign="top">
													<p class="name color_0 margin_b5 font--kr font--13 font--bd">${cartVo.productName}</p>
													<p class="price font--en font--13">
														<input type="hidden" value="${cartVo.price}" id="cartPrice${cartVo.cartId}" />
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price}" />
														원
													</p>
													<div class="cart_product_etc">
														<div class="field">
															<button type="button" class="subtract_qty" onclick="goUpdate(${cartVo.cartId}, ${cartVo.quantity}, 'subtract');">-</button>
															<%-- readonly 확인 수정필 --%>
															<input type="number" class="input_qty" id="cartQuantity${cartVo.cartId}" value="${cartVo.quantity}" min="1" max="10" readonly="false">
															<button type="button" class="add_qty" onclick="goUpdate(${cartVo.cartId}, ${cartVo.quantity}, 'add');">+</button>
														</div>
													</div>
												</td>

												<td class="td_num">
													<p class="text_r">
														<span class="cart_item_total_price font--en font--13 font--rg"> <input type="hidden" name="sell_price_total" id="cartTotalPrice${cartVo.cartId}" value="${cartVo.price * cartVo.quantity}"> <span id="cartTotalPriceSpan${cartVo.cartId}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${cartVo.price * cartVo.quantity}" />원 </span>
														</span>
													</p>

													<p class="size12 margin_t5 cursor_p">
														<span class="color_0 remove_item font--kr font--13 font--rg" onclick="goDelete(${cartVo.cartId});">삭제</span>
													</p>
												</td>

											</tr>

										</c:forEach>

									</tbody>
								</table>
							</div>
						</div>
					</c:if>
					<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 있을 경우) --%>






					<%-- 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>
					<c:if test="${empty requestScope.cartList}">
						<div class="noItemInCart font--kr font--15 font--bd">쇼핑백에 등록된 상품이 없습니다.</div>
					</c:if>
					<%-- end of 쇼핑백 상세내용 (유저의 쇼핑백 정보가 없을 경우) --%>
				</div>




				<%-- 주문상세 --%>
				<aside id="summary-fix" class="cart-side-content">
					<h3 class="checkout-title font--kr font--15 font--bd">주문상세</h3>
					<ul class="checkout-summary">
						<li class="checkout-summary-head checkout-total-type01">
							<!-- js로 수정 -->
							<span class="font--kr font--13">소계</span> <span class="totalAmount font--en font--13 js-subtotal"></span>
						</li>
						<li class="checkout-summary-head checkout-summary-head--total" style="border-top: none;">
							<!-- js로 수정 -> 디폴트가 무료인 것 같음 금액이 워낙 커서 -->
							<span class="font--kr font--13 font--rg">배송비</span> <span class="font--en font--13 font--rg js-shipping">무료</span>
						</li>
						<li class="checkout-summary-head checkout-summary-head--total">
							<!-- js로 수정 -->
							<span class="font--kr font--13">합계</span> <span class="checkout-summary-price font--en font--13 js-total"></span>
						</li>
					</ul>
					<div class="cart_action">
						<!-- js 만들기 -->
						<button type="button" class="cartOrderBtn cart-layer__btn bg_hover_main_fb text_c font--kr font--13">결제하기</button>
					</div>
					<div class="text_note">
						<p class="font--kr font--13">무료 반품 서비스가 제공되오니 안심하고 구매하십시오. 배송에 대한 자세한 내용을 확인하십시오.</p>
					</div>
				</aside>
				<%-- end of 주문상세 --%>
			</div>
		</div>
	</div>
</div>

<div class="cart_group" id="cart_group"></div>



















<!--
원래꺼

 <div class="container_sq">
	장바구니 시작
	<div class="contentswrap center_wrap cart_wrapper">
		<div class="contentswrap_top center_wrap ">
			<div class="center width_100 text_l" style="max-width: 1419px">
				<div class="content_cart_item">
					<p class="text_l color_0 padding_b30 font--kr font--15 font--bd">쇼핑백</p>
					<div class="head">
						<p class="product font--kr font--13 font-rg">상품</p>
						<p class="price font--en font--13 font-rg">가격</p>
					</div>
					<div id="sod_bsk">
						<form name="frmcartlist" id="sod_bsk_list" method="post" action="수정필">
							<div class="tbl_head01 tbl_wrap width_100">
								<table id="cart-item-table" class="width_100">
									<tbody>
										<tr style="border-bottom: 1px solid #e0e0e0" class="380,000원">
											<input type="hidden" name="index" value="0">
											<input type="hidden" name="uid" value="Njg5NjE5">
											<input type="hidden" name="sku" value="8JA8YM6ZOYOI">
											<td class="sod_img"><a class="cursor_p" href="수정필"> <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NINE_PART_PIECE_RC_2_1.jpg" alt="" title="">
											</a></td>
											<td class="sod_name text_l color_0" valign="top">
												<p class="name color_0 margin_b5 font--kr font--13 font--bd">나인 파트 피스 RC5</p>
												<p class="price font--en font--13">380,000원</p>
												<div class="cart_product_etc">
													<div class="field">
														<button type="button" class="subtract_qty">-</button>
														<input type="number" class="input_qty" value="1" min="1" max="10" readonly="">
														<button type="button" class="add_qty">+</button>
													</div>
												</div>
										</td>
											<td class="td_num">
												<p class="text_r">
													<span class="cart_item_total_price font--en font--13 font--rg"> <input type="hidden" name="sell_price_total" value="380000"> 380,000원
													</span>
												</p>
												<p class="size12 margin_t5 cursor_p">
													<span class="color_0 remove_item font--kr font--13 font--rg" data-category="ecommerce" data-action="remove_from_cart" data-label="{{나인 파트 피스 RC5}}|{{ 8JA8YM6ZOYOI }}|{{380000}}|{{1}}">삭제</span>
												</p>
										</td>
											<td class="td_chk"><input type="checkbox" name="ct_chk" value="1" id="ct_chk" checked="checked"></td>
									</tr>
										<tr style="border-bottom: 1px solid #e0e0e0" class="380,000원">
											<input type="hidden" name="index" value="1">
											<input type="hidden" name="uid" value="Njg5NjIw">
											<input type="hidden" name="sku" value="8JA8YM6XYUQ6">
											<td class="sod_img"><a class="cursor_p" href="수정필"> <img src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NINE_PART_PIECE_GC5_2_1.jpg" alt="" title="">
											</a></td>
											<td class="sod_name text_l color_0" valign="top">
												<p class="name color_0 margin_b5 font--kr font--13 font--bd">나인 파트 피스 GC5</p>
												<p class="price font--en font--13">380,000원</p>
												<div class="cart_product_etc">
													<div class="field">
														<button type="button" class="subtract_qty">-</button>
														<input type="number" class="input_qty" value="1" min="1" max="10" readonly="">
														<button type="button" class="add_qty">+</button>
													</div>
												</div>
										</td>
											<td class="td_num">
												<p class="text_r">
													<span class="cart_item_total_price font--en font--13 font--rg"> <input type="hidden" name="sell_price_total" value="380000"> 380,000원
													</span>
												</p>
												<p class="size12 margin_t5 cursor_p">
													<span class="color_0 remove_item font--kr font--13 font--rg" data-category="ecommerce" data-action="remove_from_cart" data-label="{{나인 파트 피스 GC5}}|{{ 8JA8YM6XYUQ6 }}|{{380000}}|{{1}}">삭제</span>
												</p>
										</td>
											<td class="td_chk"><input type="checkbox" name="ct_chk" value="1" id="ct_chk" checked="checked"></td>
									</tr>
								</tbody>
								</table>
							</div>
						</form>
					</div>
				</div>
				<aside id="summary-fix" class="cart-side-content" style="">
					<h3 class="checkout-title font--kr font--15 font--bd">주문상세</h3>
					<ul class="checkout-summary">
						<li class="checkout-summary-head checkout-total-type01"><span class="font--kr font--13">소계</span> <span class="font--en font--13 js-subtotal"> 760,000원 </span></li>
						<li class="checkout-summary-head checkout-summary-head--total" style="border-top: none;"><span class="font--kr font--13 font--rg">배송비</span> <span class="font--en font--13 font--rg js-shipping">무료</span></li>
						<li class="checkout-summary-head checkout-summary-head--total"><span class="font--kr font--13">합계</span> <span class="checkout-summary-price font--en font--13 js-total"> 760,000원 </span></li>
					</ul>
					<div class="cart_action">
						<button type="button" onclick="return form_check();" class="cart-layer__btn bg_hover_main_fb text_c font--kr font--13">결제하기</button>
					</div>
					<div class="text_note">
						<p class="font--kr font--13">무료 반품 서비스가 제공되오니 안심하고 구매하십시오. 배송에 대한 자세한 내용을 확인하십시오.</p>
					</div>
				</aside>
			</div>
		</div>
	</div>
</div>

<div class="cart_group" id="cart_group"></div> -->


<jsp:include page="../common/footer.jsp" />