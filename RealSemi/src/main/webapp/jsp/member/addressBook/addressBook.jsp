<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<title>GENTLE MONSTER Official Site</title>
<script src="<%=ctxPath%>/js/member/addressbook.js" type="text/javascript"></script>
<jsp:include page="../../common/header.jsp" />




<div class="container_sq">

	<div class="address_book contentswrap center_wrap account edit kr container-1350">

		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="수정필">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item">
					<a href="수정필" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="수정필" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  selected">
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
		<div class="contentswrap_top center_wrap">
			<div class="edit-wrap text_l">
				<div class="page_nav">
					<p class="title font--kr font--15 font--bd">계정 설정</p>
					<div class="page_menu_list">
						<ul class="page_menu_items page_menu_pc_items">
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
				<div class="center-content">
					<!-- exist address -->
					<!-- show default address -->
					<div id="exist_default" class="box_address">
						<form method="post" id="form_114568">
							<div class="title font--kr font--13 font--bd">기본 배송지</div>
							<div class="font--kr font--13 font--rg">
								<input type="text" name="adr_id" value="114568" hidden=""> <input type="text" name="adr_lastname" value="신" hidden=""> <input type="text" name="adr_firstname" value="예진" hidden="">
							</div>
							<div class="name font--kr font--13 font--rg">
								<span>신예진</span>
							</div>
							<div class="font--kr font--13 font--rg">
								<span>010 1234 5678</span> <input type="text" name="adr_tel" value="010 1234 5678" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>서울특별시 노원구 한글비석로 4 몰라 이게 어디야</span> <input type="text" name="adr_street" value="서울특별시 노원구 한글비석로 4" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>대한민국</span> <input type="text" name="adr_country" value="KR" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>01862 (000-000)</span> <input type="text" name="adr_postcode" value="01862 (000-000)" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<input type="text" name="adr_street2" value="몰라 이게 어디야" hidden="">
							</div>
							<!-- 기본주소 체크된 경우 -->
							<div class="font--kr font--13 font--rg">
								<input type="text" name="is_set_default" value="1" hidden="">
							</div>
							<div class="button-group two_button">
								<button id="edit_info" type="submit" class="btn btn-black font--kr font--13 font--rg" formaction="수정필">수정</button>
								<button onclick="deleteAddress_confirm()" type="button" class="btn btn-white btn-delete-address margin_l10 font--kr font--13 font--rg" style="box-shadow: none;">삭제</button>
							</div>
						</form>
					</div>
					<!-- end default address -->
					<!-- show other address -->
					<div class="box_address">
						<form method="post" id="form_114569">
							<div class="font--kr font--13 font--rg">
								<input type="text" name="adr_lastname" value="신" hidden=""> <input type="text" name="adr_firstname" value="추가" hidden="">
							</div>
							<div class="name type2 font--kr font--13 font--rg">
								<input type="text" name="adr_id" value="114569" hidden="">
								<div>
									<span>신추가</span>
								</div>
								<div>
									<button type="submit" formaction="수정필" class="default-btn font--kr font--12 font--rg">기본 주소로 설정</button>
								</div>
							</div>
							<div class="font--kr font--13 font--rg">
								<span>010 1235 6789</span> <input type="text" id="adr_tel" name="adr_tel" value="010 1235 6789" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>서울특별시 노원구 한글비석로 24 몰라 이게 어디야</span> <input type="text" id="adr_street" name="adr_street" value="서울특별시 노원구 한글비석로 24" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>대한민국</span> <input type="text" id="adr_country_code" name="adr_country_code" value="KR" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<span>01862 (000-000)</span> <input type="text" id="adr_postcode" name="adr_postcode" value="01862 (000-000)" hidden="">
							</div>
							<div class="font--kr font--13 font--rg">
								<input type="text" id="adr_street2" name="adr_street2" value="몰라 이게 어디야" hidden="">
							</div>
							<div class="button-group two_button">
								<button id="edit_info" type="submit" class="btn btn-black font--kr font--13 font--rg" formaction="수정필">수정</button>
								<button onclick="deleteAddress_confirm()" type="button" class="btn btn-white btn-delete-address margin_l10 font--kr font--13 font--rg" style="box-shadow: none;">삭제</button>
							</div>
						</form>
					</div>
					<div class="button-group margin_t80">
						<button type="button" class="btn btn-black font--kr font--13 font--rg" onclick="location.href='수정필'">다른 주소 추가하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>







<jsp:include page="../../common/footer.jsp" />