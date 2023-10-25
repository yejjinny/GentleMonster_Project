<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/order/order_complete.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />



<div class="container_sq">
	<div class="order_confirmation center_wrap cart_wrapper mo_order_confirm order_max-width344">
		<div class="contentswrap_top center_wrap ">
			<div class="content-wrap order_text_left">
				<div class="head order_m_b75">
					<p class="font--kr font--15 font--bd order_p_b28">주문 확인</p>
					<p class="font--kr font--13 font--rg order_line_height">주문해주셔서 감사합니다. 아래의 주문 상세 내역을 확인해주세요.</p>

					<div class="action">
						<a class="button font--kr font--rg font--13" href="수정필">내 계정으로 가기</a>
					</div>

				</div>
				<div class="info_customer">
					<div class="id_order font--kr font--15 font--bd order_p_b28">
						<p>주문번호 #${requestScope.orderOne.orderId}</p>
					</div>
					<div class="email font--kr font--13 font--rg order_line_height order_p_b7 order_p_b18">
						<p class="label">이메일</p>
						<p class="value">${sessionScope.loginUser.email}</p>
					</div>

					<div class="info_shipment">
						<div class="field address">
							<p class="label font--kr font--13 font--rg order_line_height">배송주소</p>
							<p class="value font--kr font--13 font--rg order_line_height">
								${requestScope.orderOne.fullName}<br>${requestScope.orderOne.address} ${requestScope.orderOne.detailAddress}<br> ${requestScope.orderOne.postCode}
							</p>
						</div>
						<div class="field phonenumber">
							<p class="label font--kr font--13 font--rg order_line_height">전화번호</p>
							<p class="value font--kr font--13 font--rg order_line_height">${requestScope.orderOne.tel}</p>
						</div>
					</div>
				</div>

				<div class="payment_method">
					<p class="label font--kr font--13 font--rg order_line_height">결제방식</p>
					<p class="font--kr font--13 font--rg order_line_height">카드</p>
				</div>
				<div class="order_product">
					<table>
						<tbody>
							<tr class="font--kr font--13 font--md order_line_height">
								<th class="image font--kr font--13 font--md order_line_height">제품명</th>
								<th class="product"></th>
								<th class="price font--kr font--13 font--md order_line_height" style="padding-left: 4px;">가격</th>
								<th class="qty font--kr font--13 font--md order_line_height" style="padding-left: 10px;">수량</th>
								<th class="subtotal font--kr font--13 font--md order_line_height">소계</th>
							</tr>
							<tr class="font--kr font--13 font--md order_line_height" style="vertical-align: top;">
								<td class="item">
									<img src="<%= ctxPath %>${requestScope.orderOne.mainImageFile}" alt="">
								</td>
								<td class="item product font--kr font--13 font--bd order_line_height">${requestScope.orderOne.productName}</td>
								<td class="item price font--kr font--13 font--md order_line_height" style="padding-left: 4px;">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.price}" />
									원
								</td>
								<td class="item qty font--kr font--13 font--md order_line_height" style="padding-left: 10px;">${requestScope.orderOne.quantity}</td>
								<td class="item subtotal font--kr font--13 font--md order_line_height">
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.price * requestScope.orderOne.quantity}" />
									원
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="order_summary order_margin_b174 order_margin_b100">
					<ul>
						<li class="field_summary subtotal" style="padding-bottom: 2px;">
							<span class="label font--kr font--13 font--md order_line_height">소계</span> 
							<span class="value font--kr font--13 font--md order_line_height">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.amount}" /> 원
							</span>
						</li>
						<li class="field_summary discount" style="padding-bottom: 2px;">
							<span class="label font--kr font--13 font--md order_line_height">배송비</span> <span class="value font--kr font--13 font--md order_line_height">0원</span>
						</li>
						<li class="field_summary discount" style="padding-bottom: 2px;">
							<span class="label font--kr font--13 font--md order_line_height">총합계</span> 
							<span class="value font--kr font--13 font--md order_line_height">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${requestScope.orderOne.amount}" /> 원
							</span>
						</li>
					</ul>
				</div>

			</div>
		</div>
	</div>
	<div class="contentswrap_top center_wrap ">
		<div class="register-wrap"></div>
	</div>
</div>

<jsp:include page="../common/footer.jsp" />