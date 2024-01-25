<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />

<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../../common/header.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/editMemberInfo/changePwd.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/addressBook.css" />
<script src="<%=ctxPath%>/js/member/editMemberInfo/changePwd.js" type="text/javascript"></script>

<div class="container_sq">
	<div class="reset_password contentswrap center_wrap account edit kr container-1350">

		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="<%=ctxPath%>/member/memberInfoViewAll.gm">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item">
					<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  selected">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label=""  href="<%= ctxPath%>/register/logout.gm">로그아웃</a>
				</div>
			</div>
		</div>
		<div class="contentswrap_top center_wrap">
			<div class="edit-wrap text_l">
				<div class="page_nav">
					<p class="title font--kr font--15 font--bd">계정 설정</p>
					<div class="page_menu_list">
						<ul class="page_menu_items page_menu_pc_items">
							<li class="page_menu_item link_item font--13">
								<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg"> 회원정보 </a>
							</li>
							<li class="page_menu_item link_item font--13">
								<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
							</li>
							<li class="page_menu_item link_item font--13 selected">
								<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
							</li>
						</ul>
					</div>
				</div>
				<div class="center-content">
					<form name="changePassword" id="form_reset_password" action="" method="post">
						<input type="hidden" name="mb_email" value="email@naver.com">
						<div class="input-box font--kr font--13 font--rg">
							<label for="reg_mb_password_old" class="password input-label font--kr font--13 font--rg"> 현재 비밀번호</label>
							<input type="password" class="input-pwd width_100 padding_10 font--kr font--13 font--rg" name="reg_mb_password_old" id="reg_mb_password_old" size="20" maxlength="20">
							<span id="nowPwdCheck" style="color:white;"   class="font--kr font--13 font--rg">필수 입력란 입니다.</span>
							 
						 
							<span class="_alert font--kr font--11 font--rg" data-alert="This field is required."></span>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<label for="mb_password" class="password input-label font--kr font--13 font--rg"> 새로운 비밀번호</label>
							<input type="password" class="input-pwd padding_10 font--kr font--13 font--rg" name="mb_password" id="mb_password" size="20" maxlength="20">
							<span id="pwdCheck" style="color:white;"   class="font--kr font--13 font--rg">비밀번호 형식을 확인하세요.</span>
							 
							 
							<span class="_alert font--kr font--11 font--rg" data-alert="This field is required."></span>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<label for="confirm_mb_password" class="password input-label font--kr font--13 font--rg"> 새로운 비밀번호 확인</label>
							<input type="password" class="input-pwd width_100 padding_10 font--kr font--13 font--rg" name="confirm_mb_password" id="confirm_mb_password" size="20" maxlength="20">
							 <span id="confirmCheck" style="color:white;"   class="font--kr font--13 font--rg">일치하는 비밀번호를 입력하세요.</span>
							 
							
							 
							<span class="_alert font--kr font--11 font--rg" data-alert="This field is required."></span>
						</div>
						<div class="pw-condition-box" id="pw_pattern">
							<div class="desc font--kr font--13 font--rg">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
							<div class="pw-conditions">
								<div id="pw-condition-min-character">
									 <span id="numberSum"   class="font--kr font--13 font--rg"> -최소 8자 이상</span>
								</div>
								<div id="pw-condition-upper-letter">
									 <span  id="upper" class="font--kr font--13 font--rg"> -최소 1개의 대문자 사용</span>
								</div>
								<div id="pw-condition-symbol">
									<span  id="special" class="font--kr font--13 font--rg"> -최소 1개의 특수문자 사용</span>
								</div>
								<div id="pw-condition-number">
									<span  id="number" class="font--kr font--13 font--rg"> -최소 1개의 숫자 사용</span>
								</div>
							</div>
						</div>
						<button id="button_reset_password" type="button" class="btn btn-black font--kr font--13 font--rg" >비밀번호 변경</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../../common/footer.jsp" />