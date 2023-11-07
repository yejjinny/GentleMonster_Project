<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<footer class="footer w_o_w_footer">
	<div class="footer_nav">
		<div class="footer_section">
			<div class="footer_section_title footer_section_mobile_title">
				<button class="font--kr font--13 font--bd" type="button">
					법적 고지
					<span>+</span>
				</button>
			</div>
			<div class="footer_group">
				<ul class="footer_items">
					<li class="footer_item ">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="inform" data-label="legal-area" href="https://www.gentlemonster.com/kr/legal/inform"> 공지사항 </a>
					</li>
					<li class="footer_item ">
						<button type="button" class="footer_item_link font--kr font--13 font--rg" data-toggle="modal" data-target="#legalModal"> 이용약관 </button>
						<!-- <a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="terms-conditions" data-label="legal-area" href="https://www.gentlemonster.com/kr/legal/terms"> 이용약관 </a> -->
					</li>
					<li class="footer_item ">
						<button type="button" class="footer_item_link font--kr font--13 font--rg" data-toggle="modal" data-target="#privacyModal"> 개인정보처리방침 </button>
<!-- 						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="privacy-policy" data-label="legal-area" href="https://www.gentlemonster.com/kr/legal/privacy_policy"> 개인정보처리방침 </a> -->
					</li>
					<li class="footer_item ">
						<button type="button" class="footer_item_link font--kr font--13 font--rg" data-toggle="modal" data-target="#cookieModal"> 쿠키 정책 </button>
<!-- 						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="cookie-policy" data-label="legal-area" href="https://www.gentlemonster.com/kr/legal/cookie_policy"> 쿠키 정책 </a>
 -->					</li>
				</ul>
			</div>

		</div>
		<div class="footer_section">
			<div class="footer_section_title footer_section_mobile_title">
				<button class="font--kr font--13 font--bd" type="button">
					소셜 미디어
					<span>+</span>
				</button>
			</div>
			<div class="footer_group">
				<ul class="footer_items">
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="facebook" data-label="social-media" href="https://www.facebook.com/gentlemonsterofficial" target="_blank"> 페이스북 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="instagram" data-label="social-media" href="http://instagram.com/gentlemonster" target="_blank"> 인스타그램 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="youtube" data-label="social-media" href="https://www.youtube.com/c/gentlemonsterofficial" target="#none"> 유튜브 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="twitter" data-label="social-media" href="https://twitter.com/_gentlemonster_" target="_blank"> 트위터 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="kakaotalk" data-label="social-media" href="http://pf.kakao.com/_Vgxnhu" target="_blank"> 카카오톡 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="pinterest" data-label="social-media" href="https://www.pinterest.com/gentle_monster/" target="#none"> 핀터레스트 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="wechat" data-label="social-media" href="https://www.gentlemonster.com/img/common/wechat_qr.jpg" target="_blank"> 위쳇 </a>
					</li>
					<li class="footer_item">
						<a class="footer_item_link font--kr font--13 font--rg" data-category="footer" data-action="weibo" data-label="social-media" href="http://weibo.com/gentlemonsteraccount" target="_blank"> 웨이보 </a>
					</li>
				</ul>
			</div>

		</div>
	</div>
	<div class="copyright">
		<p class="font_title">
			©
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 166 15.9">
                            <path
					d="M7.3 5.3V4.1c0-1.3-.6-1.9-2.1-1.9-1.6 0-2.2.6-2.2 1.9v7.7c0 1.3.5 1.9 2.1 1.9 1.5 0 2.2-1 2.2-2.5V9.4H4.8V7.2h5.5v8.5H7.7v-1.2c-.5.7-1.4 1.5-3.5 1.5C1.5 16 0 14.9 0 11.3V4.8C0 1.3 2.1 0 5.2 0c3 0 5.1 1.4 5.1 4.1v1.2h-3zm14.9-5v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm13.5 0v15.3H32L28 3.9v11.7h-3V.3h3.7l4 11.6V.3h3zm12.5 0v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm4.9 13.1H59v2.3h-8.9V.3h3v13.1zM69.9.3v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zM91 .3v15.3h-3V3.9l-2.6 11.8H83L80.5 3.8v11.9h-3V.3h4.2L84.2 12 86.7.3H91zM104.1 5v5.9c0 3.7-1.8 5-5.1 5s-5.1-1.2-5.1-5V5c0-3.7 1.8-5 5.1-5s5.1 1.3 5.1 5zm-3-.7c0-1.6-.6-2.1-2.1-2.1-1.6 0-2.1.5-2.1 2.1v7.4c0 1.6.6 2 2.1 2 1.6 0 2.1-.5 2.1-2V4.3zm16.7-4v15.3h-3.7l-4-11.7v11.7h-3V.3h3.7l4 11.6V.3h3zm12.3 3.6v.9h-3V4c0-1.3-.2-1.8-1.7-1.8-1.4 0-1.7.6-1.7 1.6 0 .9.2 1.3 1 1.8l2.9 1.9c1.6 1 2.5 1.6 2.5 4.4 0 2.7-1.8 4-4.7 4-3.5 0-4.9-1.2-4.9-4v-1.3h3v1.1c0 1.6.5 2 1.9 2s1.7-.6 1.7-1.7-.2-1.5-1.2-2.2L123 7.9c-1.8-1.2-2.4-1.8-2.4-4 0-1.9 1.1-3.8 4.7-3.8 3.7-.1 4.8 1.5 4.8 3.8M142.2.3v2.3h-3.8v13.1h-3V2.6h-3.8V.3h10.6zm10.9 0v2.3h-6v3.9h5.4v2.2h-5.4v4.7h6v2.3h-9V.3h9zm12.4 10.2v3.3c0 .8.2 1.5.6 1.9H163c-.3-.4-.5-1.1-.5-1.9v-3.3c0-1.2-.5-1.6-1.6-1.6h-2.1v6.8h-3V.3h5.5c4 0 4.5 2.2 4.5 4.3 0 1.7-.9 2.9-3.1 3.3 1.9.1 2.8 1.1 2.8 2.6zm-4.6-3.9c1.6 0 1.9-.7 1.9-2s-.2-2-1.9-2h-2.1v4h2.1z"
				></path>
                        </svg>
		</p>

		<div>
			<div class="font--kr">
				<sapn class="font--kr">주) 아이아이컴바인드</sapn>
				<span class="between-bar">|</span>
				<sapn class="font--kr">대표자명: 김한국</sapn>
				<span class="between-bar">|</span>
				<sapn class="font--kr">사업자번호</sapn>
				<sapn class="font--en">: 119-86-38589</sapn>
				<span class="between-bar">|</span>
				<span class="font--kr">통신판매신고번호: 제</span>
				<sapn class="font--en">2014-</sapn>
				<sapn class="font--kr">서울마포</sapn>
				<sapn class="font--en">-1050</sapn>
				<sapn class="font--kr">호</sapn>
				<a href="http://www.ftc.go.kr/info/bizinfo/communicationList.jsp" target="_blank" class="font--kr">(사업자 정보 확인)</a>
				<span class="between-bar">|</span>
				<span class="font--kr"> 이메일 문의: </span>
				<a href="mailto:cs@gentlemonster.com">
					<span class="font--kr">cs@gentlemonster.com</span>
				</a>
				<span class="between-bar">|</span>
				<span class="font--kr">개인정보보호책임자: 정태호</span>
				<span class="between-bar">|</span>
				<span class="font--kr">주소: 서울특별시 마포구 어울마당로</span>
				<span class="font--en">5</span>
				길
				<span class="font--en">41</span>
				<span class="between-bar">|</span>
				<span class="font--kr">대표번호:</span>
				1600-2126
			</div>
			<div class="guarantee-text font--kr margin_t2">
				고객님의 안전한 현금자산 거래를 위하여 하나은행과 채무지급보증계약을 체결하여 보장해드리고 있습니다.
				<button type="button" class="guarantee-button " data-toggle="modal" data-target="#guarantee_modal" style="border-bottom: 1px solid #343434;">서비스 가입사실 확인</button>
			</div>
		</div>
	</div>
</footer>







<!-- 지급보증서 관련 모달 화면-->
<div class="modal fade" id="guarantee_modal">
	<div class="modal-dialog" style="max-width: 550px;">
		<div class="modal-content">

			<!-- Modal header -->
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<img src="https://web-resource.gentlemonster.com/assets/img/guarantee/image1.jpg" alt="">
				<img src="https://web-resource.gentlemonster.com/assets/img/guarantee/image2.jpg" alt="">
			</div>

		</div>
	</div>
</div>

<!-- 이용약관 Modal -->
<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
<div class="modal fade" id="legalModal">
	<div class="modal-dialog" style="max-width: 600px;">
		<div class="modal-content">

			<!-- Modal header -->
			<div class="modal-header">
				<h5 class="modal-title font--kr">이용약관</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<iframe style="width: 100%; height: 600px; border:none;" src="<%=ctxPath%>/common/modal.gm?modalName=legalModal"> </iframe>
			</div>


			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 개인정보수집 Modal -->
<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
<div class="modal fade" id="privacyModal">
	<div class="modal-dialog" style="max-width: 1000px;">
		<div class="modal-content">

			<!-- Modal header -->
			<div class="modal-header">
				<h5 class="modal-title font--kr">개인정보수집</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<iframe style="width: 100%; height: 500px; border:none;" src="<%=ctxPath%>/common/modal.gm?modalName=privacyModal"> </iframe>
			</div>


			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>

<!-- 쿠키 Modal -->
<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
<div class="modal fade" id="cookieModal">
	<div class="modal-dialog" style="max-width: 800px;">
		<div class="modal-content">

			<!-- Modal header -->
			<div class="modal-header">
				<h5 class="modal-title font--kr">쿠키</h5>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<iframe style="width: 100%; height: 500px; border:none;" src="<%=ctxPath%>/common/modal.gm?modalName=cookieModal"> </iframe>
			</div>


			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>
		</div>
	</div>
</div>
</body>
</html>