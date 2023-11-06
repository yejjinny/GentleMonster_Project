<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
//    /tempSemi
%>




<%-- header meta 관련--%>
<jsp:include page="../../common/header_meta.jsp" />

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/changePwd.css" />



<title>GENTLE MONSTER Official Site</title>
<%-- header --%>
<jsp:include page="../../common/header.jsp" />
<script type="text/javascript" src="<%=ctxPath%>/js/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.js"></script>




<%-- 본문 --%>
<div class="container_sq">

	<!-- <div class="main_page contentswrap center_wrap account edit kr container-1350"> -->
	<div class="check_pass contentswrap center_wrap account edit kr container-1350">

		<!-- 회원정보 Category 시작-->
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
				<li class="page_menu_item link_item">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item selected">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="https://www.gentlemonster.com/kr/customer/logout">로그아웃</a>
				</div>
			</div>
		</div>
		<!-- 회원정보 Category 끝-->


		<%-- 계정설정 본문 시작  action="<%=ctxPath%>/member/memberInfoEditToPwdCheck.gm" --%>
		<form name="EditToCheckFrm" >
			<div class="contentswrap_top center_wrap">
				<div class="edit-wrap text_l">
	
					<div class="page_nav">
						<p class="title font--kr font--15 font--bd">계정 설정</p>
						<div class="page_menu_list">
							<ul class="page_menu_items page_menu_pc_items">
								<li class="page_menu_item link_item font--13 selected">
									<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg"> 회원정보 </a>
								</li>
								<!-- todo: move when develop layout -->
								<li class="page_menu_item link_item font--13 ">
									<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
								</li>
								<li class="page_menu_item link_item font--13 ">
									<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
								</li>
							</ul>
						</div>
					</div>
	
					<div class="center-content">
						<div class="input-box text_l">
							<input type="hidden" id ="memberId" name="memberId" value ="${sessionScope.loginUser.memberId}"/>
							<p class="password font--kr font--13 font--rg">비밀번호</p>
							<input type="password" class="width_100 padding_10" name="check_password_pw" id="check_password_pw" "> 
						</div>
						<button id="button_reset_password" type="button" class="btn btn-black font--kr font--13 font--rg btn-check-password">비밀번호 확인</button>
					</div>
	
				</div>
			</div>
		</form>
		
	</div>
	<!-- 계정설정 본문 끝 -->

</div>




<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />