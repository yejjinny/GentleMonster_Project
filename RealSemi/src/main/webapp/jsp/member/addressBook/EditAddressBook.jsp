<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />

<%-- 내가 만든 CSS --%>

<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/EditAddressBook.css" /> 
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/addressBook/addressBook.css" />

<title>Stores | GENTLE MONSTER Official Site</title>

<jsp:include page="../../common/header.jsp" />
<script src="<%=ctxPath%>/js/member/EditAddressBook.js" type="text/javascript"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>





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
			<li class="page_menu_item link_item">
				<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--13 font--rg"> 위시리스트 </a>
			</li>
			<li class="page_menu_item link_item  selected">
				<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
			</li>
			<li class="page_menu_item link_item">
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
						<li class="page_menu_item link_item font--13 selected">
							<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
						</li>
						<li class="page_menu_item link_item font--13 ">
							<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
						</li>

					</ul>
				</div>
			</div>
			<div class="center-content center-content--wide">
				<form   style="display: block" id="addressForm" name="addressForm">
					<div>
						<%--주소아이디와 회원아이디 히든 --%>
						<input type="hidden" name="addressbookid" value="${requestScope.editAvo.addressBookId}"/>
						<input type="hidden" name="fk_memberid" value="${requestScope.editAvo.fk_memberId}"/>
						<input type="text" id="mb_adr_id" name="mb_adr_id" value="114564" hidden="">
					</div>

					<!-- CSS 내가 넣었음 font-weight bold넣었음  -->
					<div class="box-group box-group-child-2">
						<div class="input-box font--kr font--13 font--rg">
							<label class="input-label font--kr font--13 font--rg">성</label>
							<input type="text" class="width_100  padding_10 font--kr font--13 font--rg" name="familyname" id="familyname" required="" size="20" maxlength="2" value="${requestScope.editAvo.familyName}" placeholder="성"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<label class="input-label font--kr font--13 font--rg">이름</label>
							<input type="text" class="width_100  padding_10 font--kr font--13 font--rg" name="lastname" id="lastname" required="" size="20" maxlength="6" value="${requestScope.editAvo.lastName}" placeholder="이름"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>
					</div>

					<div class="input-box font--kr font--13 font--rg">
						<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">전화번호</p>
						<input type="text" id="mb_tel" name="tel" class="width_100  padding_10 font--kr font--13 font--rg" required="" value="${requestScope.editAvo.tel}"> <span class="_alert font--kr font--11 font--rg"></span>
					</div>

					<div class="input-box col-xs-margin-t-20">
						<div class="zip col-xs-12 input-box padding_0 col-xs-margin-b-20" hidden="">
							<div class="col-sm-9 col-sm-padding-l-0 col-sm-padding-r-10">
								<p class="input-label margin_b4 letter0 text_l">우편번호</p>
								<input type="text" id="edit_postcode" name="zipcode" class="width_100  padding_10" value=""  > <span class="_alert font--kr font--11 font--rg"></span>
							</div>
						</div>
						<%-- 우편번호 input--%>
						<input type="hidden" id="edit_pcode" name ="edit_pcode" value="${requestScope.editAvo.postCode}"  />
						<div class="input-box post_address font--kr font--13 font--rg">
							<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">주소검색</p>
							<!-- 검색 기능을 표시할 <div>를 생성한다 -->
							<div id="postcodify" class="font--kr font--13 font--rg postcodify_search_form postcode_search_form" style="margin: 0px;">
								<div class="postcodify_search_controls postcode_search_controls" style="display: flex;">
									<label class="keyword_label" for="postcodify_16970902276602460">검색 키워드</label>
									<input type="text" class="keyword" value="" id="edit_address" placeholder="${requestScope.editAvo.address}" name="address" style="border: 1px solid rgb(0, 0, 0);">
									<button type="button" class="search_button gm-component__spinner-container btn btn-black font--kr font--13 font--rg" id="btnAddrSearch">검색</button> <%-- postcodify_16970902276602460_button--%>
									<input type="hidden" id="btnAddVal" value="unpush" /> <%--검색버튼 누른지 확인용 --%>
									<button type="button" class="delete_button btn btn-black font--kr font--13 font--rg" id="delete_button" style="display: none;">삭제</button>
								</div>
								<span class="_alert font--kr font--11 font--rg"></span>
							</div>
						</div>
						<div class="input-box font--kr font--13 font--rg">
							<p class="input-label margin_b4 letter0 text_l font--kr font--13 font--rg">상세주소</p>
							<input type="text" id="edit_detailAddress" class="width_100  padding_10 font--kr font--13 font--rg" required="" value="${requestScope.editAvo.detailAddress}" name="detailaddress" placeholder="상세주소" style="border: 1px solid rgb(0, 0, 0);"> <span class="_alert font--kr font--11 font--rg"></span>
						</div>

						<div class="input-box" style="display: none">
							<input type="text" name="mb_region" id="mb_region" value="KR">
						</div>
						
						
						
						<div class="agreement-group font--kr font--13 font--rg">
								<div class="input-box input-box-check">
									<label for="is_set_default">
										<input type="hidden" id="addrDefaultCheck" name="addrDefaultCheck" value="${requestScope.editAvo.isDefaultAddr}"/>	
										
										
														
														 
											 <c:if test="${requestScope.editAvo.isDefaultAddr eq '1'}">
												 
													<input type="checkbox" id="is_set_default" name="is_set_default" class="input-box-check checklistagree"  value="${requestScope.editAvo.isDefaultAddr}" checked>
													<div class="input-box-check-layer"></div>
													<span class="font--kr font--13 font--rg">기본 배송지로 지정</span>
											 
												</c:if>	
												
												<c:if test="${requestScope.editAvo.isDefaultAddr eq '0'}">	
												
													<input type="checkbox" id="is_set_default" name="is_set_default" class="input-box-check checklistagree" value="${requestScope.editAvo.isDefaultAddr}" >
													<div class="input-box-check-layer"></div>
													<span class="font--kr font--13 font--rg">기본 배송지로 지정</span>
											 
										
												</c:if>
										
									</label>
								</div>
							</div>
						

	
						
						<div class="button-group">
							<button type="button" id="btnEditAddr"  class="btn btn-black font--kr font--13 font--rg" onclick="goEdit()">저장</button> 
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />