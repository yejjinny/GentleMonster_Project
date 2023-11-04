<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/admin/orderList.css">
<!-- JavaScript -->

<title>전체주문목록 | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/admin/orderList.js"></script>



<!-- Contents -->
<div id="storePage" class="store store--fs content-container">
	<div class="store_page">
		<!-- Store Title -->
		<div class="content-top-dummy relative jsContDummy" id="store_title--wrap" style="display: block;">
			<div class="content-top jsContTop">
				<div class="content-container">
					<h1 class="page-title font--kr font--16 font--bd float-left" id="store_title">전체주문목록</h1>
				</div>
			</div>
		</div>
		<!--// Store Title -->
	</div>




	<div id="flagship_list">

		<div class="store__item">
			<!-- 이미지 수정하기 -->
			<div class="flagship_list">
				<div class="store__content store__content--fs clearfix">

					<div class="searchMember">
						<form name="searchMemberFrm">

							<select name="orderSearchResult" class="orderSearchResult">
								<c:forEach var="orderSearch" items="${requestScope.orderSearchResultMap}">

									<c:if test="${orderSearch.key eq requestScope.order}">
										<option value="${orderSearch.key}" selected>${orderSearch.value}</option>
									</c:if>
									<c:if test="${orderSearch.key ne requestScope.order}">
										<option value="${orderSearch.key}">${orderSearch.value}</option>
									</c:if>

								</c:forEach>
							</select>

							<select name="searchCategory" class="searchSelect">
								<c:forEach var="searchCategory" items="${requestScope.searchCategoryMap}" varStatus="status">

									<c:if test="${searchCategory.key eq requestScope.colName}">
										<option value="${searchCategory.key}" selected>${searchCategory.value}</option>
									</c:if>
									<c:if test="${searchCategory.key ne requestScope.colName}">
										<option value="${searchCategory.key}">${searchCategory.value}</option>
									</c:if>

								</c:forEach>
							</select>

							<input type="text" name="searchOrderInput" class="searchInput" placeholder="검색어를 입력하세요" value="${requestScope.value}" />
							<button type="button" class="searchOrderBtn n-header__search n-header__mo jsHeaderSearch">
								<svg stroke="#000000" version="1.1" baseProfile="basic" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve">
                                			<path d="M13.5,24.1c-5.8,0-10.6-4.8-10.6-10.6S7.7,2.9,13.5,2.9s10.6,4.8,10.6,10.6S19.3,24.1,13.5,24.1z M13.5,4.1
                                					c-5.2,0-9.4,4.2-9.4,9.4c0,5.2,4.2,9.4,9.4,9.4c5.2,0,9.4-4.2,9.4-9.4C22.9,8.3,18.7,4.1,13.5,4.1z"></path>
                                					<rect x="21.2" y="20.7" transform="matrix(0.787 -0.617 0.617 0.787 -10.2878 18.6108)" width="1.2" height="7.1"></rect>
                            	</svg>
							</button>
						</form>
					</div>

					<div class="memberList">
						<table class="table font--kr">
							<thead>
								<tr>
									<th>#</th>
									<th>주문번호</th>
									<th>주문상태</th>
									<th>주문일자</th>
									<th>주문회원번호</th>
									<th>주문자명</th>
									<th>주문상세</th>
									<th>주문금액</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${not empty requestScope.orderList}">
									<c:forEach var="orderVo" items="${requestScope.orderList}" varStatus="status">
										<tr>
											<th>${orderVo.rno}</th>
											<td>${orderVo.orderId}</td>
											<td>${orderVo.orderStatus}</td>
											<td>${orderVo.orderDay}</td>
											<td>${orderVo.fk_memberId}</td>
											<td>${orderVo.fullName}</td>
											<td>${orderVo.productName}</td>
											<td>
												<fmt:formatNumber type="number" maxFractionDigits="3" value="${orderVo.amount}" />원
											</td>
										</tr>
									</c:forEach>
								</c:if>

								<c:if test="${empty requestScope.orderList}">
									<td colspan="8" style="text-align: center;">검색 결과가 없습니다.</td>
								</c:if>
							</tbody>
						</table>
					</div>

					<div class="memberListPagination">
						<nav>
							<ul class="pagination">
								${requestScope.pageBar}
							</ul>
						</nav>
					</div>

				</div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../common/footer.jsp" />