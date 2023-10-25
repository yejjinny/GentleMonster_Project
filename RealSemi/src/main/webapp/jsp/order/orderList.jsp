<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/order/orderList.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />


<div class="container_sq">
	<div class="orderinquiry contentswrap account center_wrap container-1350">


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
				<li class="page_menu_item link_item  selected">
					<a href="수정필" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="https://www.gentlemonster.com/kr/customer/logout">로그아웃</a>
				</div>
			</div>
		</div>
		<div class="contentswrap_top center_wrap mo-cont-mgttype01">
			<div class="edit-wrap text_l">
				<div class="head">
					<div class="title font--kr font--15 font--bd">주문</div>
					<!-- <div class="action font--<?//=$css?>" id="previous_order_div" style="display: none">
						<a href="<?//= base_url('/customer/previous_order') ?>"><?//= lang("shop.previous.show") ?></a>
					</div> -->
				</div>
				<div class="order-history-list">
					<div class="order-history-item">
						<div class="order-history-item-info">
							<div class="box-left">
								<img class="order-image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/b30b2c4494df46b5c4beed6ec9b510ab/1/1/11001_NINE_PART_PIECE_GC5_1_1.jpg" alt="">
							</div>
							<div class="box-right">
								<div class="order-info">
									<div class="order-increment-id font--kr font--13 font--rg">ORDER #000095716</div>
									<div class="order-increment-id font--kr font--13 font--rg">
										입금대기<span class="font--13 font--rg"> 외 </span>1<span class="font--13 font--rg">건</span>
									</div>
									<div class="order-total-items">
										<span class="font--kr font--13 font--rg">주문 수량</span> : <span class="font--kr font--13 font--rg">3</span>
									</div>
									<div class="order-date font--kr font--13 font--rg">2023/10/12</div>
								</div>
								<div class="order-actions">
									<form action="수정필" method="post">
										<input hidden="" name="order_id" value="000095716"> <input hidden="" name="mb_id" value="pangjjinny@gmail.com">
										<button class="text_hover_main action view-order font--kr font--13 font--rg" type="submit">주문 상세보기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
					<div class="order-history-item">
						<div class="order-history-item-info">
							<div class="box-left">
								<img class="order-image" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/b30b2c4494df46b5c4beed6ec9b510ab/1/1/11001_1240442012210435006_01.jpg" alt="">
							</div>
							<div class="box-right">
								<div class="order-info">
									<div class="order-increment-id font--kr font--13 font--rg">ORDER #000094654</div>
									<div class="order-increment-id font--kr font--13 font--rg">
										취소완료<span class="font--13 font--rg"> 외 </span>2<span class="font--13 font--rg">건</span>
									</div>
									<div class="order-total-items">
										<span class="font--kr font--13 font--rg">주문 수량</span> : <span class="font--kr font--13 font--rg">3</span>
									</div>
									<div class="order-date font--kr font--13 font--rg">2023/09/27</div>
								</div>
								<div class="order-actions">
									<form action="수정필" method="post">
										<input hidden="" name="order_id" value="000094654"> <input hidden="" name="mb_id" value="pangjjinny@gmail.com">
										<button class="text_hover_main action view-order font--kr font--13 font--rg" type="submit">주문 상세보기</button>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>







				<!-- 부트스트랩 페이지네이션으로 할지 고민하기 수정필  -->
				<div class="paging">
					<ul class="pagination">
						<li class="page-left-arrow">
							<a class="page-link" herf=""> &lt; </a>
						</li>
						<li class="page-item">
							<a class="page-link" href="order?page=1">
								<b>1</b>
							</a>
						</li>
						<li class="page-right-arrow">
							<a class="page-link" herf=""> &gt; </a>
						</li>
					</ul>
				</div>



			</div>
		</div>
	</div>
</div>







<jsp:include page="../common/footer.jsp" />