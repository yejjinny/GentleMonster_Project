<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../../common/header.jsp" />
<script src="<%=ctxPath%>/js/member/addressbook.js" type="text/javascript"></script>




<div class="container_sq">

	<div class="address_book contentswrap center_wrap account edit kr container-1350">

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







				<div class="center-content">
					<!-- exist address -->
					<%--기본배송지 시작 --%>
					<c:forEach var="addressVO" items="${requestScope.addressList}" varStatus="status">
						<c:if test="${addressVO.isDefaultAddr eq '1'}">
							<div id="exist_default" class="box_address">
								<form method="post" id="form_114568" name="deleteFrm">
									<input type="hidden" name="addressbookid" id="addressbookid" value="${addressVO.addressBookId}" />
									<input type="hidden" name="btnDelAddrId" id="btnDelAddrId${status.index}" value="${addressVO.addressBookId}" />
									<div class="title font--kr font--13 font--bd">기본 배송지</div>
									<div class="font--kr font--13 font--rg">
										<input type="text" name="adr_id" value="114568" hidden="">
										<input type="text" name="adr_lastname" value="신" hidden="">
										<input type="text" name="adr_firstname" value="예진" hidden="">
									</div>
									<div class="name font--kr font--13 font--rg">
										<span>${addressVO.familyName}${addressVO.lastName}</span>
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.tel}</span>
										<input type="text" name="adr_tel" value="010 1234 5678" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.address} ${addressVO.detailAddress}</span>
										<input type="text" name="adr_street" value="서울특별시 노원구 한글비석로 4" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>대한민국</span>
										<input type="text" name="adr_country" value="KR" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.postCode}</span>
										<input type="text" name="adr_postcode" value="01862 (000-000)" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<input type="text" name="adr_street2" value="몰라 이게 어디야" hidden="">
									</div>
									<!-- 기본주소 체크된 경우 -->
									<div class="font--kr font--13 font--rg">
										<input type="text" name="is_set_default" value="1" hidden="">
									</div>
									<div class="button-group two_button">
										<button id="edit_info" type="submit" class="btn btn-black font--kr font--13 font--rg" formaction="<%=ctxPath%>/address/addressBookEditView.gm">수정</button>
										<button id="delBtnBasic" onclick="deleteAddress_confirmm('${status.index}')" type="button" class="btn btn-white btn-delete-address margin_l10 font--kr font--13 font--rg" style="box-shadow: none;">삭제</button>
									</div>
								</form>
							</div>
						</c:if>
					</c:forEach>
					<%--기본배송지 끝 --%>

					<%--기본배송지 제외 forEach문으로 목록 나타내기 시작--%>
					<c:forEach var="addressVO" items="${requestScope.addressList}" varStatus="status">
						<%-- <c:if test="${addressVO.isdefaultaddr eq '1'}">
						</c:if>	
						--%>
						<c:if test="${addressVO.isDefaultAddr ne '1'}">
							<div class="box_address">
								<form method="post" id="deleteFrmVal" name="deleteFrmVal">
									<%--기본배송지 버튼을 누를시 회원아이디 와 주소록아이디 저장 시작--%>
									<input type="hidden" name="fk_memberid" value="${addressVO.fk_memberId}" />
									<input type="hidden" name="addressbookid" id="addressbookid" value="${addressVO.addressBookId}" />
									<input type="hidden" name="btnDelAddrId" id="btnDelAddrId${status.index}" value="${addressVO.addressBookId}" />

									<%--기본배송지 버튼을 누를시 회원아이디 와 주소록아이디 저장 끝--%>
									<div class="font--kr font--13 font--rg">
										<input type="text" name="adr_lastname" value="신" hidden="">
										<input type="text" name="adr_firstname" value="추가" hidden="">
									</div>
									<div class="name type2 font--kr font--13 font--rg">
										<input type="text" name="adr_id" value="114569" hidden="">
										<div>
											<span>${addressVO.familyName}${addressVO.lastName}</span>
										</div>
										<div>
											<button type="submit" formaction="<%=ctxPath%>/address/addressBookDefaultCheck.gm" class="default-btn font--kr font--12 font--rg">기본 주소로 설정</button>
										</div>
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.tel}</span>
										<input type="text" id="adr_tel" name="adr_tel" value="010 1235 6789" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.address} ${addressVO.detailAddress}</span>
										<input type="text" id="adr_street" name="adr_street" value="${addressVO.address}" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>대한민국</span>
										<input type="text" id="adr_country_code" name="adr_country_code" value="KR" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<span>${addressVO.postCode}</span>
										<input type="text" id="adr_postcode" name="adr_postcode" value="01862 (000-000)" hidden="">
									</div>
									<div class="font--kr font--13 font--rg">
										<input type="text" id="adr_street2" name="adr_street2" value="몰라 이게 어디야" hidden="">
									</div>
									<div class="button-group two_button">
										<button id="edit_info" type="submit" class="btn btn-black font--kr font--13 font--rg" formaction="<%=ctxPath%>/address/addressBookEditView.gm">수정</button>
										<button id="delBtnn" onclick="deleteAddress_confirmm('${status.index}')" type="button" class="btn btn-white btn-delete-address margin_l10 font--kr font--13 font--rg" style="box-shadow: none;">삭제</button>
									</div>
								</form>
							</div>
						</c:if>
					</c:forEach>
					<%--기본배송지 제외 forEach문으로 목록 나타내기 끝  onclick="deleteAddress_confirmm()" --%>








					<div class="button-group margin_t80">
						<button type="button" class="btn btn-black font--kr font--13 font--rg" onclick="location.href='addressBookAdd.gm'">다른 주소 추가하기</button>
					</div>
				</div>










			</div>
		</div>
	</div>
</div>







<jsp:include page="../../common/footer.jsp" />