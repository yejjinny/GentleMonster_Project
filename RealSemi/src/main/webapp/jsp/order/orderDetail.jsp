<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/order/orderDetail.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/order/orderDetail.js"></script>




<div class="container_sq ordercancel">
	<div class="contentswrap center_wrap container-1350 account">

		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="수정필">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="https://www.gentlemonster.com/kr/customer/logout">로그아웃</a>
				</div>
			</div>
		</div>
		<div class="contentswrap_top center_wrap order-pdtype01">
			<div class="edit-wrap text_l">
				<div class="head">
					<div class="ordercancel-header">
						<div class="ordercancel-description">
							<h2 class="order-number font--kr font--15 font--md">
								<span class="order-title-text font--15 font--md"> Order </span>
								#${requestScope.orderOne.orderId}
							</h2>
							<div class="order-qty font--kr font--13 font--rg">주문 수량 : ${requestScope.orderOne.quantity}</div>
							<div class="order-date font--en font--13 font--rg">${requestScope.orderOne.orderDay}</div>
							<div class="order-status">상태: ${requestScope.orderOne.orderStatus}</div>
						</div>
						<div class="ordercancel-actions"></div>
					</div>
				</div>
				<div class="ordercancel-info">
					<div class="ordercancel-items">
						<div class="ordercancel-item-list">

							<c:forEach var="orderDetailVo" items="${requestScope.orderDetailList}" varStatus="status">

								<div class="ordercancel-item">
									<div class="item-position font--kr font--13 font--bd">주문 ${status.count}</div>
									<div class="item-info-box">
										<div class="item-image">
											<img class="item-img" src="<%= ctxPath %>${orderDetailVo.mainImageFile}" alt="">
										</div>
										<div class="box_info">
											<div class="info_checkbox">
												<div class="item-info">
													<div class="item-name font--kr font--13 font--bd">${orderDetailVo.productName}</div>
													<div class="item-price font--kr font--13 font--rg">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderDetailVo.price}" />
														원
													</div>
													<div class="font--kr font--13 font--rg"></div>
													<div class="item-qty font--kr font--13 font--rg">수량: ${orderDetailVo.quantity}</div>
												</div>

											</div>
										</div>
									</div>
								</div>

							</c:forEach>

						</div>
						<!-- 						<div class="items-button btn-mttype01" hidden=""> -->

						<c:if test="${requestScope.orderOne.orderStatus eq '결제완료'}">
							<div class="items-button btn-mttype01">
								<!-- 주문 취소 -->
								<button type="button" id="do_cancel" onClick="cancelOrder(${requestScope.orderOne.orderId})" class="ordercancel-item-button font--kr disable">취소하기</button>
							</div>
						</c:if>
						<div class="ordercancel-announce">
							<div class="text-style sub-title font--kr">주문 취소 안내</div>
							<div class="footer-contents-text margin_36 customercare-s-font2 font--kr">
								<ul class="ordercancel-list">
									<li>
										<span>•</span>
										<em class="font--kr">‘결제 완료’ 단계 : [회원정보-주문-주문상세] 에서 취소 가능합니다.</em>
									</li>
									<li>
										<span>•</span>
										<em class="font--kr">‘상품 준비중’ 이후 단계: 주문취소 불가하며, 제품 수령 후 '반품'으로 진행 부탁드립니다.</em>
									</li>
									<li>
										<span>•</span>
										<em class="font--kr">당일배송 주문 건은 오전 10시까지 주문 취소가 가능합니다.</em>
									</li>
								</ul>
							</div>
							<div class="text-style sub-title font--kr">반품 안내</div>
							<div class="footer-contents-text margin_36 customercare-s-font2 font--kr">
								<ul class="ordercancel-list">
									<li>
										<span>•</span>
										<em class="font--kr">반품 접수는 제품 수령 후 7일 이내 가능하며, 반품비는 무료입니다.</em>
									</li>
									<li>
										<span>•</span>
										<em class="font--kr">당일배송의 경우 판매자(젠틀몬스터) 귀책 사유로 인한 반품 외에는 배송비를 차감한 금액이 환불됩니다. </em>
									</li>
									<li>
										<span>•</span>
										<em class="font--kr">주문 상태가 ‘배송 완료’ 혹은 ‘배송중’으로 보여질 경우 젠틀몬스터 고객서비스팀(1600-2126)으로 연락 주시기 바랍니다.</em>
									</li>
									<li>
										<span>•</span>
										<em class="font--kr"> 반품 절차는
											<button type="button" class="link" data-toggle="modal" data-target="#refundModal">교환 및 반품 규정</button> 을 확인하시길 바랍니다.
										</em>
									</li>
								</ul>
							</div>
						</div>
					</div>
					<div class="ordercancel-payment-info">
						<div class="shipping-method info-item">
							<div class="info-title font--kr font--13 font--bd">배송사</div>
							<div id="shipping_company" class="info-detail font--kr font--13 font--rg">CJ대한통운</div>
						</div>
						<div class="shipping-address info-item" id="shipping_info_div" style="visibility: visible;">
							<div class="info-title font--kr font--13 font--bd">배송 주소</div>
							<div class="info-detail font--kr font--13 font--rg">
								${requestScope.orderOne.fullName}<br> ${requestScope.orderOne.address}${requestScope.orderOne.detailAddress}<br> ${requestScope.orderOne.postCode}<br>
							</div>
						</div>
						<div class="billing-address info-item">
							<div class="info-title font--kr font--13 font--bd">결제 수단</div>
							<div class="info-detail font--kr font--13 font--rg">카드 결제</div>
						</div>

						<div class="order-detail info-item">
							<div class="info-title font--kr font--13 font--bd">주문 상세</div>
							<div class="info-detail">
								<div class="subtotal">
									<span class="total-item font--kr font--13 font--rg">소계</span>
									<span class="total-detail font--kr font--13 font--rg">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.amount}" />
										원
									</span>
								</div>
								<div class="shipping-fee">
									<span class="total-item font--kr font--13 font--rg">배송비</span>
									<span class="total-detail font--kr font--13 font--rg">0원</span>
								</div>
								<div class="grand-total">
									<span class="total-item font--kr font--13 font--rg">합계</span>
									<span class="total-detail font--kr font--13 font--rg">
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.amount}" />
										원
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 교환반품 Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="refundModal">
		<div class="modal-dialog" style="max-width: 600px;">
			<div class="modal-content">

				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title font--kr">이용약관</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<iframe style="width: 100%; height: 600px;" src="<%=ctxPath%>/common/modal.gm?modalName=refundModal"> </iframe>
				</div>


				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>


</div>






<jsp:include page="../common/footer.jsp" />