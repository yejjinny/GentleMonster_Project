<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/member/addressBook/addressBook.css">
<link rel="stylesheet" href="<%=ctxPath%>/css/order/orderList.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />


<div class="container_sq">
	<div class="orderinquiry contentswrap account center_wrap container-1350">


		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="<%=ctxPath%>/member/memberInfoViewAll.gm">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg"> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  selected">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" href="<%=ctxPath%>/register/logout.gm">로그아웃</a>
				</div>
			</div>
		</div>
		<div class="contentswrap_top center_wrap mo-cont-mgttype01">
			<div class="edit-wrap text_l">
				<div class="head">
					<div class="title font--kr font--15 font--bd">주문</div>
				</div>
				<div class="order-history-list">
					<c:if test="${not empty requestScope.orderList}">
						<c:forEach var="orderVo" items="${requestScope.orderList}">

							<div class="order-history-item">
								<div class="order-history-item-info">
									<div class="box-left">
										<img class="order-image" src="<%= ctxPath %>${orderVo.mainImageFile}" alt="">
									</div>
									<div class="box-right">
										<div class="order-info">
											<div class="order-increment-id font--kr font--13 font--rg">ORDER #${orderVo.orderId}</div>
											<div class="order-increment-id font--kr font--13 font--rg">${orderVo.orderStatus}</div>
											<div class="order-total-items">
												<span class="font--kr font--13 font--rg">주문 수량</span>
												:
												<span class="font--kr font--13 font--rg">${orderVo.quantity}</span>
											</div>
											<div class="order-date font--kr font--13 font--rg">${orderVo.orderDay}</div>
										</div>
										<div class="order-actions">
											<form id="orderDetailFrm${orderVo.orderId}" method="post" action="<%=ctxPath%>/order/orderDetail.gm">
												<input type="hidden" name="orderId" value="${orderVo.orderId}">
												<input type="submit" id="button${orderVo.orderId}" value = "주문 상세보기" class="text_hover_main action view-order font--kr font--13 font--rg">
											</form>
										</div>
									</div>
								</div>
							</div>

						</c:forEach>
					</c:if>


					<c:if test="${empty requestScope.orderList}">
						<div class="noOrderHistory">주문하신 상품이 존재하지 않습니다</div>
					</c:if>
				</div>

				<div class="orderListPagination">
					<nav>
						<ul class="pagination">${requestScope.pageBar}
						</ul>
					</nav>
				</div>

			</div>
		</div>
	</div>
</div>







<jsp:include page="../common/footer.jsp" />