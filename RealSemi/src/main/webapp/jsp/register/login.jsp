<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>

<%
	String ctxPath = request.getContextPath();
	//	/tempSemi
%>

<jsp:include page="../common/header_meta.jsp" />


<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/bootstrap/bootstrap.min.css" > 
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
	
	function goToPwdChange(){
		
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		const contextPath = origin + pathname;
		
		window.closeModal();
		window.location.href = contextPath + "member/memberInfoEditToPwd.gm";
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
			<form name="flogin" id="flogin" autocomplete="off" action="<%= ctxPath%>/register/login.gm" method="post">
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
				</div>
				
			</form>
		</div>

	
		<!-- 회원가입 -->
		<div class="sign-up-wrap margin_b80">
			<h2 class="login-title font--kr font--15 font--bd">회원가입</h2>
			<div class="contents-default-text margin_b36 font--kr font--13 font--rg">회원가입을 하시면, 주문 조회와 개인정보 관리 및 위시리스트 확인 등 다양한 혜택을 누리실 수 있습니다.</div>
			<div class="section-col">
				<button type="button" class="btn btn-black margin_b12 font--kr font--13 font--rg" onclick="location.href='<%= ctxPath%>/register/memberRegister.gm'" data-category="account" data-action="sign_up_click" data-label="normal_signup">신규가입</button>
			</div>
		</div>

	</div>
</div>

	
	
<!-- /////////////////////// 모달 //////////////////////////// -->	
	
	<!-- 비밀번호 찾기 Modal 시작 -->
	<div class="modal fade" id="findPwdModal">
		<div class="modal-dialog">
			<div class="modal-content modal-lg">
	
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
				
			</div>
		</div>
	</div>
	<!-- 비밀번호 찾기 Modal 끝 -->



<jsp:include page="../common/footer.jsp" />