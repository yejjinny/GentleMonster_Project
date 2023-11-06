<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />

<%-- 내가 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/noAddressBook.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/addressBook.css" />

<title>Stores | GENTLE MONSTER Official Site</title>

<jsp:include page="../../common/header.jsp" />





<!-- Korean address format 메뉴창 -->
<div class="address_book contentswrap center_wrap account edit kr container-1350">

	<div class="topnav">
		<div class="topnav-left">
			<div class="page_menu_item link_item font--kr font--15 font--bd">
				<a class="title" href="<%=ctxPath%>/member/memberInfoViewAll.gm">회원정보</a>
			</div>
		</div>
		<ul class="page_menu_items page_menu_mobile_items">
			<li class="page_menu_item link_item">
				<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--13 font--rg"> 전체보기 </a>
			</li>
			<li class="page_menu_item link_item  ">
				<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--13 font--rg"> 위시리스트 </a>
			</li>
			<li class="page_menu_item link_item  selected">
				<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
			</li>
			<li class="page_menu_item link_item  ">
				<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--13 font--rg"> 주문 </a>
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
							<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg"> 회원정보 </a>
						</li>
						<!-- todo: move when develop layout -->
						<li class="page_menu_item link_item font--13 selected">
							<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
						</li>
						<li class="page_menu_item link_item font--13 ">
							<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
						</li>

					</ul>
				</div>
			</div>
			<div class="center-content">
				<!-- not exist address -->
				<div style="display: block;" id="not_exist_address" class="text_c font--kr font--13 font--rg">
					등록된 배송지가 없습니다.
					<div class="button-group">
						<button type="button" style="font-weight: bold;" class="btn btn-black font--kr font--13 font--rg" onclick="location.href='addressBookAdd.gm'">다른 주소 추가하기</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />
