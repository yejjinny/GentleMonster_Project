<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" href="<%=ctxPath%>/css/common/privacyModal.css">

<div class="contentswrap center_wrap">
	<div class="contentswrap_top center_wrap us">
		<div class="center width_100 text_l notice">
			<div class="notice__header us">
				<h1 class="notice__title">개인정보 수집 및 이용 동의</h1>
			</div>
			<div class="notice__detail">
				<div class="notice__txt">
					<table class="legal__table">
						<tbody>
							<tr>
								<td>
									<p class="legal-s-font2 font--kr  legal-txt--bold">수집 및 이용 목적</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr  legal-txt--bold">수집하는 개인정보의 항목</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr  legal-txt--bold">이용 기간</p>
								</td>
							</tr>
						</tbody>
						<!-- 비회원 구매 -->
						<tbody>
							<tr>
								<td>
									<p class="legal-s-font2 font--kr ">재화 또는 서비스 제공</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr ">주문자 정보(이름, 전화번호, 이메일) 수령자 정보(이름, 전화번호, 배송지 주소), 주문번호, 본인확인기관에서 제공하는 본인인증결과값 (CI)</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr ">5년</p>
								</td>
							</tr>
							<tr>
								<td>
									<p class="legal-s-font2 font--kr ">서비스 이용 또는 업무처리과정에서 자동으로 생성되어 수집되는 정보</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr ">접속 IP 정보, 쿠키(Cookie), 서비스 이용 기록, 접속 로그, 결제기록, 이용정지기록</p>
								</td>
								<td>
									<p class="legal-s-font2 font--kr ">3개월(인터넷 접속 기록) 또는 5년(결제기록)</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<p class="notice__txt text-left">
					<!-- * 위 동의를 거부할 수 있으며, 동의 거부시 서비스 이용이 제한됩니다. -->
					GENTLE MONSTER(주식회사 아이아이컴바인드)는 다음과 같이 고객 정보를 수집 및 이용합니다. <br> 고객님은 수집 및 이용을 거부할 수 있으며, 거부시 서비스 이용이 제한됩니다.
				</p>
			</div>
		</div>
	</div>
</div>