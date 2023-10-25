<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
					<a class="title" href="수정필">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item  selected">
					<a href="수정필" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="수정필" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%= ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
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
								<a href="수정필" class="font--kr font--13 font--rg">수정</a>
							</div>
						</div>
						<div class="box_info">
							<p class="box_title font--kr font--13 font--rg">정보</p>
							<ul style="text-align: left">
								<li class="font--kr font--13 font--rg">
									성별: <span class="value">여성</span>
								</li>
								<li class="font--kr font--13 font--rg">
									성: <span class="value">김</span>
								</li>
								<li class="font--kr font--13 font--rg">
									이름: <span class="value">땡떙</span>
								</li>
								<li class="font--kr font--13 font--rg">
									생년월일: <span class="value font--en font--13 font--rg">1999/01/23</span>
								</li>
								<li class="font--kr font--13 font--rg">
									이메일: <span class="value">kimddang@gmail.com</span>
								</li>
							</ul>
						</div>
						<div class="box_address">
							<p class="box_title font--kr font--13 font--rg">주소</p>
							<div class="address_empty">
								<p class="font--kr font--13 font--rg">저장된 주소가 없습니다</p>
								<div class="action">
									<a class="mypage-btn btn btn-black font--kr font--13 font--rg" href="https://www.gentlemonster.com/kr/customer/address_input">새로운 주소 추가</a>
								</div>
							</div>
						</div>
					</div>

					<div class="box_right box_same">
						<div class="my_order">
							<div class="order">
								<div class="head">
									<div class="block_title">
										<p class="title font--kr font--15 font--bd">주문</p>
									</div>
									<div class="action">
										<a href="수정필" class="font--kr font--13 font--rg">모두 보기</a>
									</div>
								</div>
								<div class="list_order text_l">
									<table>
										<tbody>
											<tr class="item">
												<td class="id_order font--en font--13 font--rg">000095648</td>
												<td class="date font--en font--13 font--rg">2023/10/11</td>
												<td class="price font--en font--13 font--rg">888,000원</td>
											</tr>
										</tbody>
									</table>
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