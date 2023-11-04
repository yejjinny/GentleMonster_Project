<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%
String ctxPath = request.getContextPath();
%>


<jsp:include page="../common/header_meta.jsp" />

<!-- 새로 만든 것 -->
<link rel="stylesheet" href="<%=ctxPath%>/css/register/login.css">

<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../common/header.jsp" />



<div class="contentswrap center_wrap" style="padding-top: 0 !important;">
	<div class="login-container clearfix">
		<!-- login -->
		<div class="login-wrap">
			<h2 class="login-title font--kr font--15 font--bd">로그인</h2>
			<form name="flogin" id="flogin">
				<input type="hidden" name="url" value="">
				<!-- ID -->
				<div class="field-area input-box font--kr">
					<label for="login_id" class="field-name display_b font--kr font--13 font--rg line-height18"> 이메일 </label>
					<input type="text" name="mb_id" id="login_id" class="input-box-style padding_10" maxlength="100" required="">
				</div>
				<!-- PWD -->
				<div class="input-box col-sm-margin-t-50fa text_left margin_b16 font--kr">
					<label for="mb_password" class="field-name password display_b margin_b4 font--kr font--13 font--rg line-height18"> 비밀번호 </label>
					<input type="password" name="mb_password" id="mb_password" size="20" class="input-box-style input-pwd padding_10" maxlength="20" required="">
					<button type="button" class="show-pwd" onclick="clickPasswordEye(this, $('#mb_password'))">
						<span class="viewpass eye-slash"></span>
					</button>
				</div>
				<!-- find PWD -->
				<div class="find-pw margin_b35 text-left">

					<a id="_find_memberInfo" class="checkout-atag-line cursor_p font--kr font--13 font--rg line-height18" data-category="account" data-action="find_password_click" data-label="find_password">비밀번호 찾기</a>
				</div>

				<div class="flex flex-col">
					<!-- button login -->
					<button type="submit" class="btn btn-black margin_b12 font--kr font--13 font--rg gm-component__spinner-container" data-category="account" data-action="login_click" data-label="normal_login">
						<div class="gm-component__spinner-wrapper">
							<div class="gm-component__spinner dark"></div>
						</div>
						<span>로그인</span>
					</button>


					<!-- kakao login -->
					<div class="action_kakao margin_t12">
						<a class="btn btn-kakao font--kr font--13 font--rg" data-category="account" data-action="login_click" data-label="kakao_login" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')"> 카카오 로그인 </a>
					</div>

				</div>
			</form>
		</div>
		<!-- sign up -->
		<div class="sign-up-wrap margin_b80">
			<h2 class="login-title font--kr font--15 font--bd">회원가입</h2>
			<div class="contents-default-text margin_b36 font--kr font--13 font--rg">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</div>
			<div class="section-col">
				<button type="button" class="btn btn-black margin_b12 font--kr font--13 font--rg" onclick="location.href='https://www.gentlemonster.com/kr/customer/account_register'" data-category="account" data-action="sign_up_click" data-label="normal_signup">신규가입</button>
				<!-- 한국이면 카카오 -->
				<div class="action_kakao margin_t12">
					<a class="btn btn-kakao font--kr font--13 font--rg" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')" data-category="account" data-action="sign_up_click" data-label="kakao_sign_up"> 카카오 아이디 가입 </a>
				</div>

			</div>
		</div>

	</div>


	<!-- pop up find ID/PWD (KR)  -->
	<div class="find-pwd-kr-modal modal-box" role="dialog" aria-modal="false" aria-hidden="true" id="adcfa321-6848-4090-a383-07efb8b30c89" tabindex="-1">
		<div class="modal-box__wrapper">
			<div class="modal-box__contents">
				<div class="find-pwd-kr">
					<h2 class="font--kr font--15 font--bd">비밀번호 찾기</h2>
					<p class="font--kr font--13 font--rg">계정에 연결된 이메일을 입력하시면 비밀번호를 재설정하실 수 있습니다.</p>
					<div class="flex flex-row font--kr font--13 font--rg margin_b32">
						<input type="text" class="input-box-style input-find-pwd padding_10" name="mb_id" id="reset_request_email_kr" placeholder="이메일을 입력해주세요.">
						<button type="button" class="btn-black button-auth-number font--kr font--13 font--rg" onclick="requestPwEmail('kr')">링크 받기</button>
					</div>
					<a href="https://www.gentlemonster.com/kr/customer/account_register" class="link font--kr font--13 font--rg" data-category="account" data-action="sign_up_click" data-label="normal_signup">회원가입</a>
					<p class="font--kr font--13 font--rg social-desc">카카오 로그인을 연동하시면 아이디, 비밀번호를 찾을 필요 없이 젠틀몬스터 웹사이트를 이용하실 수 있습니다.</p>
					<div class="action-kakao font--kr font--12">
						<a class="btn btn-kakao font--kr font--13 font--rg" data-category="account" data-action="login_click" data-label="kakao_login" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')"> 카카오 계정 로그인 </a>
					</div>

					<button type="button" class="modal-box__close model-close-find-pwd" data-close=""></button>
				</div>
			</div>
		</div>
		<div class=" modal-box__dim" data-close=""></div>
	</div>



	<!-- popup find request complete -->
	<div class="find-pwd-confirm-modal modal-box" role="dialog" aria-modal="false" aria-hidden="true">
		<div class="modal-box__wrapper">
			<div class="modal-box__contents">
				<div class="find-pwd-confirm">
					<h2 class="font--kr font--15 font--bd">요청 접수 완료</h2>
					<p class="font--kr font--13 font--bd">
						<b>메일로 발송된 링크를 눌러 비밀번호를 재설정하세요</b>
					</p>
					<p class="font--kr font--13 font--rg">
						이메일 주소를 제출해주셔서 감사합니다.<br>비밀번호 재설정에 필요한 정보를 이메일로 발송하였습니다.<br>이메일 수신 확인을 위해 스팸 메일함을 체크해주시기 바랍니다.
					</p>
					<button type="button" class="modal-box__close model-close-find-pwd" data-close=""></button>
				</div>
			</div>
		</div>
		<div class=" modal-box__dim" data-close=""></div>
	</div>




	<!-- popup reset PWD -->
	<div class="reset-pwd-modal modal-box" role="dialog" aria-modal="false" aria-hidden="true">
		<div class="modal-box__wrapper">
			<div class="modal-box__contents">
				<div class="reset-pwd">
					<p class="font--kr font--13 font--bd word-break word-break--kr">가입된 회원 아이디가 아니거나 비밀번호가 틀립니다.</p>
					<br>
					<p class="font--kr font--13 font--rg word-break word-break--kr">2021.11.15일 이전에 가입된 회원의 경우 비밀번호 찾기를 통해 재설정하시기를 바랍니다.</p>
					<button type="button" class="modal-box__close" data-close=""></button>
				</div>
			</div>
		</div>
		<div class=" modal-box__dim" data-close=""></div>
	</div>


</div>

<!-- <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>




<script>
	window.Kakao.init('30cc6941967f07e5394d81ede9690dcc');

	document.addEventListener('DOMContentLoaded', () => {
		
		var check_kakao = 'Other';
		if (check_kakao === "KAKAOTALK") {
			Kakao.Auth.authorize({
				redirectUri: "https://www.gentlemonster.com/kr/customer/oauth",
			});
		}
		else {
			return false;
		}
	});

	function kakaoLogin() {
		console.log('sssss');
		window.Kakao.Auth.login({
			//scope: 'account_email, gender, birthday', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
			success: function (response) {
				console.log(response); // 로그인 성공하면 받아오는 데이터
				window.Kakao.API.request({ // 사용자 정보 가져오기
					url: '/v2/user/me',

					success: (res) => {
						const kakao_id = res['id'];
						var kakao_email = res.kakao_account["email"];
						const kakao_b_day	= res.kakao_account["birthday"];
						const kakao_b_year	= res.kakao_account["birthyear"];
						const kakao_gender	= res.kakao_account["gender"];
						const kakao_name	= res.kakao_account.profile.nickname;
						var kakao_pnumber	= res.kakao_account["phone_number"];

						if (kakao_email === 'undefined') kakao_email = '';
						if (kakao_pnumber === 'undefined') kakao_pnumber = '';

						if( kakao_pnumber ){ 
							kakao_pnumber = kakao_pnumber.replace('+82 ', '0'); 
							document.cookie = "kakao_pnumber="+ kakao_pnumber+"; path=/;";
						}

						$.ajax({
							type: "POST",
							url: "https://www.gentlemonster.com/kr/customer/api/social_login",
							data: {id: kakao_id, type: 'kakao', website_id: 1}
						}).done(function (data) {
							if (data.success === false) {
                                let isBeginCheckout = '';
 								window.location.href = `https://www.gentlemonster.com/kr/customer/account_register_social?is_begin_checkout=${isBeginCheckout}&social_email=${kakao_email}&social_type=kakao&social_id=${kakao_id}&social_day=${kakao_b_day}&social_year=${kakao_b_year}&social_gender=${kakao_gender}&social_name=${kakao_name}`;
							} else { // 로그인 성공
								dataLayer.push({
								'event': 'account',
								'data-action': 'login_complete',
								'data-category': 'account',
								'data-label': data.type,
								});
                                								window.location.href = 'https://www.gentlemonster.com/kr/';
                                							}
						}).error(function (error) {
							console.log(error);
						});
					}
				});
			},
			fail: function (error) {
				console.log(error);
			}
		});
	}

</script> -->
<div id="fb-root"></div>
<!-- <script>startApp();</script>

<script>

document.addEventListener( function () {
	
	alert("dd");

});

</script>
<script>
	document.addEventListener('DOMContentLoaded', function () {
		 
		var form = document.querySelector('#flogin');
		if (form) {
			var validationManager = new ValidationManager(form, {}, 'KR');
			$('#flogin').on('submit', function (e) {
				e.preventDefault();
				var isValid = validationManager.validate();
				if (isValid) {
					var id = $("input[name='mb_id']").val();
					var pw = $("input[name='mb_password']").val();
					var $this = $(this)
					$this.find('button[type="submit"] .gm-component__spinner-wrapper').addClass('active');
					axios.post("https://www.gentlemonster.com/kr/customer/api/post_login",{
						mb_id: id
						, mb_password: pw
						, p_sku: ''
					}).then(function (msg) {
						const {data} = msg
						if (data.flag === "OK") {
							dataLayer.push({
								'event': 'account',
								'data-action': 'login_complete',
								'data-category': 'account',
								'data-label': data.type,
							});
														document.location.href = "https://www.gentlemonster.com/kr/";
													} else {
							$this.find('button[type="submit"] .gm-component__spinner-wrapper').removeClass('active');
							alert("이메일 또는 비밀번호를 확인해주세요.");
						}
					}).catch((e) => {
						console.log('e:',e);
						$this.find('button[type="submit"] .gm-component__spinner-wrapper').removeClass('active');
						alert("이메일 또는 비밀번호를 확인해주세요.");
					});
				}
			});
		}

		var findPwd = '';
				findPwd = new GMComponents.Modal(document.querySelector('.find-pwd-kr-modal'));
				$('#_find_memberInfo').on('click', function(){
					alert("이메일 또는 비밀번호를 확인해주세요.");
			findPwd.open();
		})

		const country = "KR";
		if (country !== 'KR') {
			if (document.getElementById('fb_login')) {
				document.getElementById('fb_login').addEventListener('click', function() {
					checkLoginState();
				}, false);
			}
			if (document.getElementById('fb_login2')) {
				document.getElementById('fb_login2').addEventListener('click', function() {
					checkLoginState();
				}, false);
			}
		}
	});


	function requestPwEmail(country) {
		var email = $("#reset_request_email_"+country).val();
		$.ajax({
			type: "POST",
			url: "https://www.gentlemonster.com/kr/customer/api/sendResetPwEmail",
			data: {mb_id: email, country: 'KR'},
			dataType: 'json'
		}).done(function (msg) {
			if (msg.success === true) {
				$('.find-pwd-'+country).children()[6].click();
				new GMComponents.Modal(document.querySelector('.find-pwd-confirm-modal')).open();
			} else {
				alert("이메일 발송에 실패했습니다.");
			}
		}).error(function (error) {
			console.log(error);
		});
	}
</script>

<script src="https://www.gentlemonster.com/kr/assets/js/gm-components/modal.js?ver=230915_3" defer=""></script> -->






<jsp:include page="../common/footer.jsp" />