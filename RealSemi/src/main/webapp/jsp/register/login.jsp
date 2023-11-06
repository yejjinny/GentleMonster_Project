<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%-- 
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
 --%>
<%
	String ctxPath = request.getContextPath();
	//	/tempSemi
%>

<jsp:include page="../common/header_meta.jsp" />


<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/bootstrap/bootstrap.min.css" > 
<!-- Font Awesome 6 Icons -->
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"> -->
<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/register/login.css">

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/js/register/login.js"></script>

<script type="text/javascript">
	
	$(document).ready(function(){
		  
		
	
	});// end of $(document).ready(function(){})--------------
	
	
	window.closeModal = function() {
	    $( '#findPwdModal' ).modal( 'hide' );
	}
	
</script>
  
  
<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../common/header.jsp" />


<%-- === 로그인을 하기 위한 폼을 생성 === --%>

<div class="contentswrap center_wrap" style="padding-top: 0 !important;">
	<div class="login-container clearfix">
	
		<!-- 로그인 -->
		<div class="login-wrap">
			<h2 class="login-title font--kr font--15 font--bd">로그인</h2>
			<form name="flogin" id="flogin" action="<%= ctxPath%>/register/login.gm" method="post">
				<input type="hidden" name="url" value="">
				
				<!-- 이메일 -->
				<div class="field-area input-box font--kr">
					<label for="login_id" class="field-name display_b font--kr font--13 font--rg line-height18"> 이메일 </label>
					<input type="text" name="email" id="login_id" class="input-box-style padding_10" maxlength="100" required>
				</div>
				<!-- 비밀번호 -->
				<div class="input-box col-sm-margin-t-50fa text_left margin_b16 font--kr">
					<label for="mb_password" class="field-name password display_b margin_b4 font--kr font--13 font--rg line-height18"> 비밀번호 </label>
					<input type="password" name="pwd" id="mb_password" size="20" class="input-box-style input-pwd padding_10" maxlength="20" required>
					<!--  
					<button type="button" class="show-pwd" onclick="clickPasswordEye(this, $('#mb_password'))">
						<span class="viewpass eye-slash"></span>
					</button>
					-->
				</div>
				
				<!-- 비밀번호 찾기 -->
				<div class="find-pw margin_b35 text-left">
					<a data-toggle="modal" data-target="#findPwdModal" id="_find_memberInfo" class="checkout-atag-line cursor_p font--kr font--13 font--rg line-height18" data-category="account" data-action="find_password_click" data-label="find_password">비밀번호 찾기</a>
				</div>

				<div class="flex flex-col">
					<!-- 로그인 -->
					<button type="submit" id="btnSubmit" class="btn btn-black margin_b12 font--kr font--13 font--rg gm-component__spinner-container" data-category="account" data-action="login_click" data-label="normal_login">
						<div class="gm-component__spinner-wrapper">
							<div class="gm-component__spinner dark"></div>
						</div>
						<span>로그인</span>
					</button>

					<!-- 카카오 로그인 -->
				 	<!-- 
					<div class="action_kakao margin_t12">
						<a class="btn btn-kakao font--kr font--13 font--rg" data-category="account" data-action="login_click" data-label="kakao_login" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')"> 카카오 로그인 </a>
					</div>
					 -->
				</div>
				
			</form>
		</div>

	
		<!-- 회원가입 -->
		<div class="sign-up-wrap margin_b80">
			<h2 class="login-title font--kr font--15 font--bd">회원가입</h2>
			<div class="contents-default-text margin_b36 font--kr font--13 font--rg">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</div>
			<div class="section-col">
				<button type="button" class="btn btn-black margin_b12 font--kr font--13 font--rg" onclick="location.href='<%= ctxPath%>/register/memberRegister.gm'" data-category="account" data-action="sign_up_click" data-label="normal_signup">신규가입</button>
				
				<!-- 카카오 아이디 가입 -->
				<!-- 
				<div class="action_kakao margin_t12">
					<a class="btn btn-kakao font--kr font--13 font--rg" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')" data-category="account" data-action="sign_up_click" data-label="kakao_sign_up"> 카카오 아이디 가입 </a>
				</div>
				-->
			</div>
		</div>

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




	
</div>

	
	
	
<!-- /////////////////////// 모달 //////////////////////////// -->	
	
	<!-- 비밀번호 찾기 Modal 시작 -->
	<div class="modal fade" id="findPwdModal">
		<div class="modal-dialog">
			<div class="modal-content">
	
				<!-- Modal header -->
				<div class="modal-header">
					<h2 class="modal-title font--kr font--15 font--bd">비밀번호 찾기</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					
				</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					<div id="pop">
						<iframe style="border: none; width: 100%; height: 350px;" src="<%= ctxPath%>/register/pwdFind.gm">
						</iframe>
					</div>
				</div>
			
				<!-- Modal footer -->
				<!-- 
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
				 -->
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾기 Modal 끝 -->









<jsp:include page="../common/footer.jsp" />