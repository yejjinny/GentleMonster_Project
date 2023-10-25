<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressbook.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/wish/wish.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />




<div class="container_sq">

	<div class="contentswrap center_wrap  account wish-list edit kr container-1350">

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
				<li class="page_menu_item link_item  selected">
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
		<div class="contentswrap_top">
			<div class="edit-wrap text_l">
				<div class="head">
					<div class="title font--kr font--15 font--bd">
						위시리스트 <span id="list-total-count" class="font--en font--14">(7)</span>
					</div>
				</div>
				<div id="product-list" class="product-list product-list-colunm4" data-infinite-scroll="" data-is-loading="false">
					<ul class="product-list__wrapper inline">
						<li data-id="T4Q9KRIRLBE6">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_OBOE-W2_1.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">오보에 W2</p>
												<p class="product__price font--kr font--13 font--rg">320,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="T4Q9KRINJ06O">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NONNO-KC6_1.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">논노 KC6</p>
												<p class="product__price font--kr font--13 font--rg">289,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="T4Q9KRIP3ITY">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_OBOE-01_1.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">오보에 01</p>
												<p class="product__price font--kr font--13 font--rg">320,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="T4Q9KRIO91OQ">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NONNO-Y6_1.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">논노 Y6</p>
												<p class="product__price font--kr font--13 font--rg">289,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="8JA8YM6XYUQ6">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_NINE_PART_PIECE_GC5_2_1.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">나인 파트 피스 GC5</p>
												<p class="product__price font--kr font--13 font--rg">380,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="9AMW03ZNVRPE">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_JULES_G11_2.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">줄스 G11</p>
												<p class="product__price font--kr font--13 font--rg">360,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
						<li data-id="14E4P7JEV0TYD">
							<div class="product">
								<div class="product__image-wrapper">
									<a class="product__link" href="수정필">
										<img data-src="" alt="" src="https://www-prd-kr.gentlemonster.com/media/catalog/product/cache/6c6f229b8a7ab97f51028776641e27d1/1/1/11001_BREE_G41M__2.jpg">
									</a>
								</div>
								<div class="product__info relative">
									<div class="clearfix">
										<div class="product__spec float-left">
											<a class="product__link" href="수정필">
												<p class="product__name font--kr font--13 font--bd">브리 G4(1M)</p>
												<p class="product__price font--kr font--13 font--rg">500,000원</p>
											</a>
										</div>

									</div>

									<!--제품 유효성 검사를 위한 hidden 구간 재영-->
									<input type="hidden" name="it_id[]" value=""> <input type="hidden" name="tmpit_id[]" value=""> <input type="hidden" name="sw_direct"> <input type="hidden" name="url"> <input type="hidden" name="location" value="au"> <input type="hidden" name="ct_qty" value="1" class="frm_input" size="5"> <input type="hidden" name="io_type" value="0"> <input type="hidden" name="io_id" value=""> <input type="hidden" name="io_value" value=""> <input type="hidden" name="io_stock" value=""> <input type="hidden" name="io_qty" value=""> <input type="hidden" name="io_type_sub" value="1"> <input type="hidden" name="io_id_sub" value=""> <input type="hidden" name="io_value_sub" value=""> <input type="hidden" name="io_stock_sub" value=""> <input type="hidden" name="io_qty_sub" value="">
									<!--hidden 구간 재영-->

									<button class="btn btn-black gm-component__spinner-container product__cart__btn">
										<div class="cart-loading gm-component__spinner-wrapper">
											<div class="gm-component__spinner dark"></div>
										</div>
										<span class="cart-text font--kr font--13 font--rg">쇼핑백에 추가</span>
									</button>
									<button class="btn btn-black font--kr font--13 font--rg" style="display: none;">쇼핑백에 추가</button>
									<div class="product-share">
										<button class="product__wish__btn jsBtnWish font--kr font--13 font--rg on">
											삭제<span class="btn-close"></span>
										</button>
									</div>
								</div>
							</div>
						</li>
					</ul>
					<div class="product-list__loading gm-component__spinner-container">
						<div class="gm-component__spinner-wrapper">
							<div class="gm-component__spinner"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>




<jsp:include page="../common/footer.jsp" />