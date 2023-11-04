<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
//    /tempSemi
%>




<%-- header meta 관련--%>
<jsp:include page="../../common/header_meta.jsp" />

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify02.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/changePwd.css" />

<title>GENTLE MONSTER Official Site</title>

<%-- header --%>
<jsp:include page="../../common/header.jsp" />
<script type="text/javascript" src="<%=ctxPath%>/js/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify02.js"></script>
 
<%-- 본문 시작 --%>
<div class="container_sq">

	<!-- 	<div class="main_page contentswrap center_wrap account edit kr container-1350"> -->
	<div class="edit_profile contentswrap center_wrap account edit kr container-1350">

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
					<a href="" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
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


		<!-- 계정설정 본문 시작 -->
		<div class="contentswrap_top center_wrap">
			<div class="edit-wrap text_l">

				<div class="page_nav">
					<p class="title font--kr font--15 font--bd">계정 설정</p>
					<div class="page_menu_list">
						<ul class="page_menu_items page_menu_pc_items">
							<li class="page_menu_item link_item font--13 selected">
								<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg"> 회원정보 </a>
							</li>
							<li class="page_menu_item link_item font--13 ">
								<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
							</li>
							<li class="page_menu_item link_item font--13 ">
								<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
							</li>
						</ul>
					</div>
				</div>

				<div class="center-content center-content--wide">
				<%--  action="memberInfoEditEnd.gm" method="post"  --%>
					<form name="fmemberconfirm"   >
						<input type="hidden" name="mb_id" value=""> <input type="hidden" name="w" value="u">
						<!-- 이메일 -->
						<div class="email input-box font--kr font--13">
							<label for="reg_mb_email" class="input-label font--kr font--13 font--rg">이메일</label>
							<input type="text" class="width_100  padding_10 font--en font--13 font--rg" required="" name="mb_email" value="${sessionScope.loginUser.email}"  id="reg_mb_email" style="font-size: 14px;"> <input type="hidden" name="old_email" value=""> <span class="alert" data-alert=""></span>
						</div>
						<!-- 성별 -->
						<div class="input-box">
							<label for="mbGender" class="input-label font--kr font--13 font--rg">성별</label>
							<div id="mbGender" class="select-box">
								<div class="pc-select font--kr font--13">
									<!-- <span id="gender_current" class="current font--kr font--13 font--rg" style="color: rgb(0, 0, 0);"> 여성 </span> -->
									<div class="option-list">
										  <div class="list-inner">   
										
											<ul class="font--kr font--13 font--rg">
												<li data-value="M" class="font--kr font--13 font--rg">남성</li>
												<li data-value="F" class="font--kr font--13 font--rg">여성</li>
											</ul>
										</div>
									</div>
								</div>
								<div class="font--kr font--13 font--rg">
								<input type="hidden" id="gender_select" value="${sessionScope.loginUser.genderVal}" />
									 <select class="mo-select rg-input font--kr font--13 font--rg" name="mb_sex" id="mb_gender" > 
								<!-- 	<select class="myselect"> -->
										 
										<option id="male" value="1" >남성</option>
										<option id="female" value="2" >여성</option>
									</select>
								</div>
								
								
							
								<span class="alert" data-alert=""></span>
							</div>
						</div>
						<!-- 이름 -->
						<div class="box-group box-group-child-2">
							<div class="input-box font--kr font--13">
								<label class="input-label font--kr font--13 font--rg">성</label>
								<input type="text" class="width_100 input_grey padding_10 font--kr font--13 font--rg unchangable" name="mb_lname" id="login_id" readonly="" size="20" maxlength="20" value="${sessionScope.loginUser.familyName}"> <span class="alert" data-alert=""></span>
							</div>
							<div class="input-box font--kr font--13">
								<label class="input-label font--kr font--13 font--rg">이름</label>
								<input type="text" class="width_100 input_grey padding_10 font--kr font--13 font--rg unchangable" name="mb_fname" id="login_id" readonly="" size="20" maxlength="20" value="${sessionScope.loginUser.lastName}"> <span class="alert" data-alert=""></span>
							</div>
						</div>
						<!-- 생년월일 -->
						<div id="mbBirthDay" class="box-group box-group-child-3 input-box">
							<label class="input-label font--kr font--13 font--rg">생년월일</label>
							<div class="box-group box-group-child-2">
								<!-- 년 -->
								<div class="input-box font--kr font--13">
									<input type="text" class="width_100 input_grey padding_10 font--kr font--13 font--rg unchangable" name="mb_birth_year" id="mb_birth_year" readonly="" size="20" maxlength="20" value="${sessionScope.loginUser.birthYear}"> <span class="alert" data-alert=""></span>
								</div>
								<!-- 월 -->
								<div class="input-box font--kr font--13">
									<input type="text" class="width_100 input_grey padding_10 font--kr font--13 font--rg unchangable" name="mb_birth_month" id="mb_birth_month" readonly="" size="20" maxlength="20" value="${sessionScope.loginUser.birthMonth}"> <span class="alert" data-alert=""></span>
								</div>
								<!-- 일 -->
								<div class="input-box font--kr font--13">
									<input type="text" class="width_100 input_grey padding_10 font--kr font--13 font--rg unchangable" name="mb_birth_day" id="mb_birth_day" readonly="" size="20" maxlength="20" value="${sessionScope.loginUser.birthDay}"> <span class="alert" data-alert=""></span>
								</div>
							</div>
						</div>

						<div class="input-box" hidden="">
							<p class="input-label">광고성 정보 수신 동의 (선택)</p>
						</div>
						<div class="agreement-group" hidden="">
							<div class="input-box input-box-check">
								<label for="terms-1">
									<input type="checkbox" id="terms-1" name="marketing_info" class="checklistagree" unchecked="">
									<div class="input-box-check-layer"></div>
									<span>마케팅 정보 수신 및 활용 동의 (선택)</span>
								</label>
							</div>
						</div>
						<div class="actions">
							<button type="button" id="MemberEditBtn" class="btn btn-black font--kr font--13 font--rg">수정하기</button>
						</div>
					</form>
					<div class="dim-layer">
						<div class="dimBg none-bg"></div>
					</div>
					<div id="cannot_change" class="pop-wrap">
						<div class="pop-content-alert" style="padding: 20px 20px 20px 20px;">
							<p class="desc text_l font--kr font--13 font--rg">
								이름과 생년월일은 변경이 불가능합니다.<br>변경을 원하실 경우 고객문의센터로 연락을 부탁드립니다.
							</p>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- 계정설정 본문 끝 -->

</div>

<%-- 본문 끝 --%>



<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />