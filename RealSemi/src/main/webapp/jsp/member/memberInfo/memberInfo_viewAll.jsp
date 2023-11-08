<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String ctxPath = request.getContextPath();
//    /tempSemi
%>




<%-- header meta 관련--%>
<jsp:include page="../../common/header_meta.jsp" />

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/memberInfo/memberInfo_viewAll.css" />


<title>GENTLE MONSTER Official Site</title>

<%-- header --%>
<jsp:include page="../../common/header.jsp" />



<%-- 본문 --%>
<div class="container_sq">

	<div class="main_page contentswrap center_wrap account edit kr container-1350">

		<!-- 회원정보 Category 시작-->
		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="<%=ctxPath%>/member/memberInfoViewAll.gm">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item  selected">
					<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="<%= ctxPath%>/register/logout.gm">로그아웃</a>
				</div>
			</div>
		</div>
		<!-- 회원정보 Category 끝-->

		<div class="contentswrap_top center_wrap ">
			<div class="edit-wrap text_l">
				<div class="content_mainpage">

					<div class="box_left box_same">
						<div class="head">
							<div class="block_title">
								<p class="title font--kr font--15 font--bd">계정 설정</p>
							</div>
							<div class="action">
								<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg">수정</a>
							</div>
						</div>
						<div class="box_info">
							<p class="box_title font--kr font--13 font--rg">정보</p>
							<ul style="text-align: left">
								<li class="font--kr font--13 font--rg">
									성별:
									<span class="value">${sessionScope.loginUser.genderVal}</span>
								</li>
								<li class="font--kr font--13 font--rg">
									성:
									<span class="value">${sessionScope.loginUser.familyName}</span>
								</li>
								<li class="font--kr font--13 font--rg">
									이름:
									<span class="value">${sessionScope.loginUser.lastName}</span>
								</li>
								<li class="font--kr font--13 font--rg">
									생년월일:
									<span class="value font--en font--13 font--rg">${sessionScope.loginUser.birthYear}-${sessionScope.loginUser.birthMonth}-${sessionScope.loginUser.birthDay}</span>
								</li>
								<li class="font--kr font--13 font--rg">
									이메일:
									<span class="value">${sessionScope.loginUser.email}</span>
								</li>
							</ul>
						</div>

						<%--기본배송지 가 있을경우--%>
						<c:if test="${not empty requestScope.addressDefault}">
							<div class="box_address">
								<p class="box_title font--kr font--13 font--rg">주소</p>
								<div class="address_empty">
									<ul style="text-align: left">
										<li class="font--kr font--13 font--rg">
											<span class="value">${requestScope.addressDefault.familyName}${requestScope.addressDefault.lastName}</span>
										</li>
										<li class="font--kr font--13 font--rg">
											<span class="value">${requestScope.addressDefault.address} ${requestScope.addressDefault.detailAddress}</span>
										</li>
										<li class="font--kr font--13 font--rg">
											<span class="value">대한민국</span>
										</li>
										<li class="font--kr font--13 font--rg">
											<span class="value font--en font--13 font--rg">${requestScope.addressDefault.postCode}</span>
										</li>
									</ul>
								</div>
							</div>
						</c:if>

						<%--기본배송지 가 없을 경우--%>
						<c:if test="${empty requestScope.addressDefault}">
							<div class="box_address">
								<p class="box_title font--kr font--13 font--rg">주소</p>
								<div class="address_empty">
									<p class="font--kr font--13 font--rg">저장된 주소가 없습니다</p>
									<div class="action">
										<a class="mypage-btn btn btn-black font--kr font--13 font--rg" href="<%=ctxPath%>/address/addressBookAdd.gm">새로운 주소 추가</a>
									</div>
								</div>
							</div>
						</c:if>

					</div>

					<div class="box_right box_same">
						<div class="my_order">
							<div class="order">
								<div class="head">
									<div class="block_title">
										<p class="title font--kr font--15 font--bd">주문</p>
									</div>
									<div class="action">
										<c:if test="${not empty requestScope.orderList}">
											<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--13 font--rg">모두 보기</a>
										</c:if>
									</div>
								</div>
								<div class="list_order text_l">
									<%-- 주문내역이 존재할 경우 --%>
									<c:if test="${not empty requestScope.orderList}">
										<table>
											<tbody>
												<c:forEach var="orderVo" items="${requestScope.orderList}">
													<tr class="item">
														<td class="id_order font--en font--13 font--rg">${orderVo.orderId}</td>
														<td class="date font--en font--13 font--rg">${orderVo.orderDay}</td>
														<td class="price font--en font--13 font--rg">
															<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderVo.amount}" />
															원
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</c:if>
									
									<%-- 주문내역이 존재하지 않을 경우 --%>
									<c:if test="${empty requestScope.orderList}">
										<div>주문하신 상품이 없습니다.</div>
									</c:if>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>

</div>



<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />