<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/order/orderDetail.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />





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
					<a href="수정필" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="수정필" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="수정필" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="수정필" class="font--kr font--15 font--rg"> 주문 </a>
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
								<span class="order-title-text font--15 font--md"> Order </span> #000094654
							</h2>
							<div class="order-qty font--kr font--13 font--rg">주문 수량 : 3</div>
							<div class="order-date font--en font--13 font--rg">2023/09/27</div>
							<!-- order status
							<div class="order-status">상태: 취소완료</div>
							// order status -->
						</div>
						<div class="ordercancel-actions"></div>
					</div>
				</div>
				<div class="ordercancel-info">
					<div class="ordercancel-items">
						<div class="ordercancel-item-list">
							<div class="ordercancel-item">
								<input type="hidden" class="ordercancel-price" value="310000"> <input type="hidden" class="sku" value="9F9VZTIUFM4E"> <input type="hidden" class="qty" value="1"> <input type="hidden" class="uid" value="MTUyMjgz">
								<div class="item-position font--kr font--13 font--bd">주문 1</div>
								<div class="item-description font--kr font--13 font--bd">취소완료</div>
								<div class="item-info-box">
									<div class="item-image">
										<img class="item-img" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/b30b2c4494df46b5c4beed6ec9b510ab/1/1/11001_1240442012210435006_01.jpg" alt="">
									</div>
									<div class="box_info">
										<div class="info_checkbox">
											<div class="item-info">
												<div class="item-name font--kr font--13 font--bd">알리오 X C1</div>
												<div class="item-price font--kr font--13 font--rg">310,000원</div>
												<div class="font--kr font--13 font--rg"></div>
												<div class="item-qty font--kr font--13 font--rg">수량: 1</div>
											</div>

										</div>
									</div>
								</div>
								<!-- <div class="cancel_comment">
									<textarea class="c_comment font--kr font--13 font--rg" name="c_comment" placeholder="취소 및 반품 사유를 입력해주세요."></textarea>
								</div> -->
							</div>
							<div class="ordercancel-item">
								<input type="hidden" class="ordercancel-price" value="310000"> <input type="hidden" class="sku" value="8NX8YBQ7JSZW"> <input type="hidden" class="qty" value="1"> <input type="hidden" class="uid" value="MTUyMjg0">
								<div class="item-position font--kr font--13 font--bd">주문 2</div>
								<div class="item-description font--kr font--13 font--bd">취소완료</div>
								<div class="item-info-box">
									<div class="item-image">
										<img class="item-img" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/b30b2c4494df46b5c4beed6ec9b510ab/1/1/11001_1140442012219889804_01.jpg" alt="">
									</div>
									<div class="box_info">
										<div class="info_checkbox">
											<div class="item-info">
												<div class="item-name font--kr font--13 font--bd">알리오 X 01</div>
												<div class="item-price font--kr font--13 font--rg">310,000원</div>
												<div class="font--kr font--13 font--rg"></div>
												<div class="item-qty font--kr font--13 font--rg">수량: 1</div>
											</div>

										</div>
									</div>
								</div>
								<!-- <div class="cancel_comment">
									<textarea class="c_comment font--kr font--13 font--rg" name="c_comment" placeholder="취소 및 반품 사유를 입력해주세요."></textarea>
								</div> -->
							</div>
							<div class="ordercancel-item">
								<input type="hidden" class="ordercancel-price" value="500000"> <input type="hidden" class="sku" value="1HCZWV6FZS4U6"> <input type="hidden" class="qty" value="1"> <input type="hidden" class="uid" value="MTUyMjg1">
								<div class="item-position font--kr font--13 font--bd">주문 3</div>
								<div class="item-description font--kr font--13 font--bd">취소완료</div>
								<div class="item-info-box">
									<div class="item-image">
										<img class="item-img" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/b30b2c4494df46b5c4beed6ec9b510ab/1/1/11001_BREE_R3_1_1.jpg" alt="">
									</div>
									<div class="box_info">
										<div class="info_checkbox">
											<div class="item-info">
												<div class="item-name font--kr font--13 font--bd">브리 R3</div>
												<div class="item-price font--kr font--13 font--rg">500,000원</div>
												<div class="font--kr font--13 font--rg"></div>
												<div class="item-qty font--kr font--13 font--rg">수량: 1</div>
											</div>

										</div>
									</div>
								</div>
								<!-- <div class="cancel_comment">
									<textarea class="c_comment font--kr font--13 font--rg" name="c_comment" placeholder="취소 및 반품 사유를 입력해주세요."></textarea>
								</div> -->
							</div>
						</div>
						<div class="items-button btn-mttype01" hidden="">
							<!-- 주문 취소 -->
							<button id="do_cancel" class="ordercancel-item-button font--kr disable">취소하기</button>
						</div>
						<div class="ordercancel-announce">
							<div class="text-style sub-title font--kr">주문 취소 안내</div>
							<div class="footer-contents-text margin_36 customercare-s-font2 font--kr">
								<ul class="ordercancel-list">
									<li>
										<span>•</span><em class="font--kr">‘결제 완료’ 단계 : [회원정보-주문-주문상세] 에서 취소 가능합니다.</em>
									</li>
									<li>
										<span>•</span><em class="font--kr">‘상품 준비중’ 이후 단계: 주문취소 불가하며, 제품 수령 후 '반품'으로 진행 부탁드립니다.</em>
									</li>
									<li>
										<span>•</span><em class="font--kr">당일배송 주문 건은 오전 10시까지 주문 취소가 가능합니다.</em>
									</li>
								</ul>
							</div>
							<div class="text-style sub-title font--kr">반품 안내</div>
							<div class="footer-contents-text margin_36 customercare-s-font2 font--kr">
								<ul class="ordercancel-list">
									<li>
										<span>•</span><em class="font--kr">반품 접수는 제품 수령 후 7일 이내 가능하며, 반품비는 무료입니다.</em>
									</li>
									<li>
										<span>•</span><em class="font--kr">당일배송의 경우 판매자(젠틀몬스터) 귀책 사유로 인한 반품 외에는 배송비를 차감한 금액이 환불됩니다. </em>
									</li>
									<li>
										<span>•</span><em class="font--kr">주문 상태가 ‘배송 완료’일 경우 [회원정보] &gt; [주문] &gt; [주문 상세보기] 에서 반품접수 가능하며, ‘배송중’으로 보여질 경우 젠틀몬스터 고객서비스팀(1600-2126)으로 연락 주시기 바랍니다.</em>
									</li>
									<li>
										<span>•</span> <em class="font--kr"> 반품 절차는 <a href="수정필" class="ordercancel-announce__btn"> 교환 및 반품 규정 </a> 을 확인하시길 바랍니다.
										</em>
									</li>
								</ul>
							</div>
						</div>
						<!-- 220726 nrnr -->
					</div>
					<div class="ordercancel-payment-info">
						<div class="shipping-method info-item">
							<div class="info-title font--kr font--13 font--bd">배송사</div>
							<div id="shipping_company" class="info-detail font--kr font--13 font--rg">CJ대한통운</div>
						</div>
						<div class="shipping-address info-item" id="shipping_info_div" style="visibility: visible;">
							<div class="info-title font--kr font--13 font--bd">배송 주소</div>
							<div class="info-detail font--kr font--13 font--rg">
								신예진<br> 서울특별시 노원구 한글비석로 39-2 웅냥냥<br> 대한민국<br> 01780<br>
							</div>
						</div>
						<!-- 220603 김연호 : 선물하기 시작 -->
						<!-- <div class="presents" id="present_div" style="visibility: hidden; display: none;">
							보내는 분 
							<div class="info-item send-to">
								<div class="info-title font--kr font--13 font--bd">보내는 분</div>
								<div class="info-detail">
									<div class="order-detail__name">
										<span class="total-item font--kr font--13 font--rg">이름</span> <span class="total-detail font--kr font--13 font--rg" id="send-name">sss</span>
									</div>
									<div class="order-detail__phone">
										<span class="total-item font--kr font--13 font--rg">전화번호</span> <span class="total-detail font--kr font--13 font--rg" id="send-phone">sss</span>
									</div>
									<div class="order-detail__email">
										<span class="total-item font--kr font--13 font--rg">이메일</span> <span class="total-detail font--kr font--13 font--rg" id="send-email">sss</span>
									</div>
									<div class="order-detail__pay">
										<span class="total-item font--kr font--13 font--rg">결제 방식</span> <span class="total-detail font--kr font--13 font--rg"> 가상계좌<br style="display: none">
										</span>

										<div class="billing-address info-item">
											<div class="info-title font--kr font--13 font--bd">입금 계좌번호</div>
											<div class="info-detail font--kr font--13 font--rg">KEB하나은행 13396146692537</div>
										</div>
									</div>
								</div>
							</div>

							받는 분 
							<div class="info-item dear-to">
								<div class="info-title font--kr font--13 font--bd">받는 분</div>
								<div class="info-detail">
									<div class="order-detail__dear">
										<span class="total-item font--kr font--13 font--rg">받는 분</span><span class="total-detail font--kr font--13 font--rg" id="detail_dear"></span>
									</div>
									<div class="order-detail__way">
										<span class="total-item font--kr font--13 font--rg">전달 방법</span><span class="total-detail font--kr font--13 font--rg" id="detail_way"></span>
									</div>

									<div class="order-detail">
										<span class="total-item font--kr font--13 font--rg">배송주소</span> <span class="total-detail font--kr font--13 font--rg"> 받는 분이 입력하신 배송지로 배송됩니다. </span>
									</div>
									<div class="order-detail">
										<span class="total-item font--kr font--13 font--rg">배송사</span> <span class="total-detail font--kr font--13 font--rg"> CJ대한통운 </span>
									</div>
								</div>
							</div>

							모바일 카드
							<div class="info-item mobile-card">
								<div class="info-title font--kr font--13 font--bd">모바일 카드</div>
								<div class="info-detail">
									<div class="order-detail__card">
										메세지 영역을 만들어 추후에 카드 디자인이 회색이 아닐 경우 예외처리 필요.
										<figure>
											<img id="detail_still_img" src="" alt="">
											<span class="font--kr font--13 font--bd" id="detail_msg"></span>
										</figure>
									</div>
								</div>
							</div>
						</div> -->
						<!-- 220603 김연호 : 선물하기 끝 -->
						<div class="billing-address info-item">
							<div class="info-title font--kr font--13 font--bd">결제 수단</div>
							<div class="info-detail font--kr font--13 font--rg">가상계좌</div>
						</div>
						<div class="billing-address info-item">
							<div class="info-title font--kr font--13 font--bd">입금 계좌번호</div>
							<div class="info-detail font--kr font--13 font--rg">KEB하나은행 1234568978</div>
						</div>


						<div class="order-detail info-item">
							<div class="info-title font--kr font--13 font--bd">주문 상세</div>
							<div class="info-detail">
								<div class="subtotal">
									<span class="total-item font--kr font--13 font--rg">소계</span><span class="total-detail font--kr font--13 font--rg">1,120,000원</span>
								</div>
								<div class="shipping-fee">
									<span class="total-item font--kr font--13 font--rg">배송비</span><span class="total-detail font--kr font--13 font--rg">0원</span>
								</div>
								<div class="grand-total">
									<span class="total-item font--kr font--13 font--rg">합계</span><span class="total-detail font--kr font--13 font--rg">1,120,000원</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>






<jsp:include page="../common/footer.jsp" />