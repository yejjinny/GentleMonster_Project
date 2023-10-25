<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />

<%-- 내가 만든 CSS --%>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/EditAddressBook.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/addressBook.css" />

<title>Stores | GENTLE MONSTER Official Site</title>

<jsp:include page="../../common/header.jsp" />





<!-- Korean address format 메뉴창 -->
<div class="address_book contentswrap center_wrap account edit kr container-1350">

	<div class="topnav">
		<div class="topnav-left">
			<div class="page_menu_item link_item font--kr font--15 font--bd">
				<a class="title" href="수정필">회원정보</a>
			</div>
		</div>
		<ul class="page_menu_items page_menu_mobile_items">
			<li class="page_menu_item link_item">
				<a href="수정필" class="font--kr font--13 font--rg"> 전체보기 </a>
			</li>
			<li class="page_menu_item link_item">
				<a href="수정필" class="font--kr font--13 font--rg"> 위시리스트 </a>
			</li>
			<li class="page_menu_item link_item  selected">
				<a href="수정필" class="font--kr font--13 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
			</li>
			<li class="page_menu_item link_item">
				<a href="수정필" class="font--kr font--13 font--rg"> 주문 </a>
			</li>

		</ul>
		<div class="topnav-right">
			<div class="page_menu_item link_item">
				<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="https://www.gentlemonster.com/kr/customer/logout">로그아웃</a>
			</div>
		</div>

	</div>

	<div class="contentswrap_top center_wrap">
		<div class="edit-wrap text_l">
			<div class="page_nav">
				<p class="title font--kr font--15 font--bd">계정 설정</p>
				<div class="page_menu_list">
					<ul class="page_menu_items page_menu_mobile_items">
						<li class="page_menu_item link_item font--13 ">
							<a href="수정필" class="font--kr font--13 font--rg"> 회원정보 </a>
						</li>
						<li class="page_menu_item link_item font--13 selected">
							<a href="수정필" class="font--kr font--13 font--rg"> 주소록 </a>
						</li>
						<li class="page_menu_item link_item font--13 ">
							<a href="수정필" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
						</li>

					</ul>
				</div>
			</div>
			<div class="center-content center-content--wide">
				<form method="post" style="display: block" id="addressFormKr">
					<div>
						<input type="text" id="mb_adr_id" name="mb_adr_id" value="114564" hidden="">
					</div>

					<!-- CSS 내가 넣었음 font-weight bold넣었음  -->
					<div class="box-group box-group-child-2">
						<div class="input-box font--kr font--13 font--rg">
							<label class="input-label font--kr font--13 font--rg">성</label>
							<input type="text" class="width_100  padding_10 font--kr font--13 font--rg" name="mb_lname" id="login_id" required="" size="20" maxlength="2" value="손" placeholder="성"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<label class="input-label font--kr font--13 font--rg">이름</label>
							<input type="text" class="width_100  padding_10 font--kr font--13 font--rg" name="mb_fname" id="login_id" required="" size="20" maxlength="6" value="명" placeholder="이름"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>
					</div>

					<div class="input-box font--kr font--13 font--rg">
						<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">전화번호</p>
						<input type="text" id="mb_tel" name="mb_tel" class="width_100  padding_10 font--kr font--13 font--rg" required="" value="010 3923 9223"> <span class="_alert font--kr font--11 font--rg"></span>
					</div>

					<div class="input-box col-xs-margin-t-20">
						<div class="zip col-xs-12 input-box padding_0 col-xs-margin-b-20" hidden="">
							<div class="col-sm-9 col-sm-padding-l-0 col-sm-padding-r-10">
								<p class="input-label margin_b4 letter0 text_l">우편번호</p>
								<input type="text" id="kr_postcode" name="zipcode" class="width_100  padding_10" value="03348 (000-000)" readonly=""> <span class="_alert font--kr font--11 font--rg"></span>
							</div>
						</div>
						<div class="input-box post_address font--kr font--13 font--rg">
							<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">주소검색</p>
							<!-- 검색 기능을 표시할 <div>를 생성한다 -->
							<div id="postcodify" class="font--kr font--13 font--rg postcodify_search_form postcode_search_form" style="margin: 0px;">
								<div class="postcodify_search_controls postcode_search_controls" style="display: flex;">
									<label class="keyword_label" for="postcodify_16970902276602460">검색 키워드</label>
									<input type="text" class="keyword" value="" id="kr_address" placeholder="예) ㅇㅇ동, ㅇㅇ로" name="address1" style="border: 1px solid rgb(0, 0, 0);">
									<button type="button" class="search_button gm-component__spinner-container btn btn-black font--kr font--13 font--rg" id="postcodify_16970902276602460_button">검색</button>
									<button type="button" class="delete_button btn btn-black font--kr font--13 font--rg" id="delete_button" style="display: none;">삭제</button>
								</div>
								<span class="_alert font--kr font--11 font--rg"></span>
							</div>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">상세주소</p>
							<input type="text" id="kr_detailAddress" class="width_100  padding_10 font--kr font--13 font--rg" required="" value="2호" name="address2" placeholder="상세주소" style="border: 1px solid rgb(0, 0, 0);"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>

						<div class="input-box" style="display: none">
							<input type="text" name="mb_region" id="mb_region" value="KR">
						</div>

						<div class="agreement-group font--kr font--13 font--rg">
							<div class="input-box input-box-check">
								<label for="is_set_default">
									<input type="checkbox" id="is_set_default" name="is_set_default" class="checklistagree">
									<div class="input-box-check-layer"></div>
									<span class="font--kr font--13 font--rg">기본 배송지로 지정</span>
								</label>
							</div>
						</div>
						<div class="button-group">
							<button type="button" class="btn btn-black font--kr font--13 font--rg" onclick="checkAddressForm('update', 'kr')">저장</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />