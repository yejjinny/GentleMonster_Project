<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/admin/memberList.css">
<!-- JavaScript -->

<title>Stores | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />




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
							<select name="searchCategory">
								<option value="컬럼명">주문번호</option>
								<option value="컬럼명">주문상태</option>
								<option value="컬럼명">주문일자</option>
								<option value="컬럼명">주문자명</option>
								<option value="컬럼명">주문상세</option>
								<option value="컬럼명">주문금액</option>
								<option value="컬럼명">배송상태</option>
							</select>

							<input type="text" name="searchMemberInput" class="searchInput" placeholder="검색어를 입력하세요" />
							<button type="button" class="n-header__search n-header__mo jsHeaderSearch" data-category="navigation" data-action="search" data-label="search" aria-expanded="false" aria-controls="top_search_section" aria-label="Search" tabindex="">
								<svg stroke="#000000" version="1.1" baseProfile="basic" id="레이어_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve">
                                			<path d="M13.5,24.1c-5.8,0-10.6-4.8-10.6-10.6S7.7,2.9,13.5,2.9s10.6,4.8,10.6,10.6S19.3,24.1,13.5,24.1z M13.5,4.1
                                					c-5.2,0-9.4,4.2-9.4,9.4c0,5.2,4.2,9.4,9.4,9.4c5.2,0,9.4-4.2,9.4-9.4C22.9,8.3,18.7,4.1,13.5,4.1z"></path>
                                					<rect x="21.2" y="20.7" transform="matrix(0.787 -0.617 0.617 0.787 -10.2878 18.6108)" width="1.2" height="7.1"></rect>
                            	</svg>
							</button>
						</form>
					</div>

					<!-- 검색결과 없을시의 내용도 추가해야함 c:if -->
					<div class="memberList">
						<table class="table font--kr">
							<thead>
								<tr>
									<th>#</th>
									<th>주문번호</th>
									<th>주문상태</th>
									<th>주문일자</th>
									<th>주문자명</th>
									<th>주문상세</th>
									<th>주문금액</th>
									<th>배송상태</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th>1</th>
									<td>#000095715</td>
									<td>결제완료</td>
									<td>2023/09/27</td>
									<td>김땡땡</td>
									<td>알리오 X C1</td>
									<td>310,000원</td>
									<td>배송준비중</td>
								</tr>
								<tr>
									<th>2</th>
									<td>#000028552</td>
									<td>입금대기</td>
									<td>2023/10/04</td>
									<td>이연남</td>
									<td>브리 R3 외 1</td>
									<td>810,000원</td>
									<td>결제확인중</td>
								</tr>
								<tr>
									<th>3</th>
									<td>#000094654</td>
									<td>취소완료</td>
									<td>2023/10/16</td>
									<td>김철수</td>
									<td>알리오 X 01</td>
									<td>310,000원</td>
									<td>취소완료</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="memberListPagination">
						<nav>
						  <ul class="pagination">
						    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&laquo;</span></a></li>
						    <li class="page-item active"><a class="page-link" href="#">1</a></li>
						    <li class="page-item"><a class="page-link" href="#">2</a></li>
						    <li class="page-item"><a class="page-link" href="#">3</a></li>
						    <li class="page-item"><a class="page-link" href="#"><span aria-hidden="true">&raquo;</span></a></li> 
						  </ul>
						</nav>
					</div>

				</div>
			</div>
		</div>
	</div>































</div>









<jsp:include page="../common/footer.jsp" />