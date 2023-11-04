<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String ctxPath = request.getContextPath();
	//	/tempSemi
%>

<%-- Required meta tags --%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/bootstrap/bootstrap.min.css" > 			<!-- OOO -->

<%-- 직접 만든 CSS --%>
<%-- <link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/template/template.css" /> --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/register/pwdFind.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>		<!-- oooo -->
<script type="text/javascript" src="<%= ctxPath%>/js/bootstrap.bundle.min.js" ></script>  <!-- OOOO -->


<script type="text/javascript">
  $(document).ready(function(){
	  
	  const method = "${requestScope.method}";
	  // console.log("확인용 method : ", method);
	  /*
	      확인용 method :  GET
	      확인용 method :  POST
	  */
		
	  if(method == "POST") { // 포스트방식으로 왔을 때
		  const isUserExist = "${requestScope.isUserExist}"
		  // alert("확인용"+isUserExist);
			  
		  if(isUserExist == "true"){ // 유저 존재할 경우
		  		alert("요청 접수 완료\n메일로 발송된 링크를 눌러 비밀번호를 재설정하세요.");	
		  }
		  else{ // 유저 존재하지 않을 경우
			    alert("이메일 발송에 실패했습니다. 유효한 이메일을 입력해주세요!");
		  }
	  }
	  
	  $("button:button[id='btnRequestLink']").click(function(){
		  goFind();
	  });// end of $("button#btnRequestLink").click()---------
	  
	  
	  $("input:text[name='email']").bind("keyup", function(e){
		  if(e.keyCode == 13) {
			  goFind();  
		  }
	  });// end of $("input:text[name='email']").bind("keyup", function(e){})--------  
	  
	  
	  
	  // === 인증하기 버튼 클릭시 이벤트 처리해주기 === //
	  $("button.btn-info").click(function(){
		  
		  const input_confirmCode = $("input:text[name='input_confirmCode']").val().trim(); 
		  
		  if(input_confirmCode == "") {
			  alert("인증코드를 입력하세요!!");
			  return; // 종료
		  }
		  
	 
		  
		
		
		  const frm = document.verifyCertificationFrm;
		  frm.userCertificationCode.value = input_confirmCode;
		  frm.userEmail.value = $("input:text[name='userEmail']").val();
		  
		  frm.action = "<%= ctxPath%>/register/verifyCertification.gm";
		  frm.method = "post";
		  frm.submit();
		  
		  
	  });
 	  
	//  window.parent.closeModal(); // 모달창좀닫아주세요
  });// end of $(document).ready(function(){})-------------
 
  
	
  //Function Declaration
  function goFind(){
		   
	  const email  = $("input:text[name='email']").val().trim(); 
	 
		  if(email=="") { // email 공백으로 입력했을 경우
			  alert("이메일을 입력해주세요.");
			  return; // 종료
		  }
		  
		  else {
			  
			  const frm = document.pwdFindFrm;
			  frm.action = "<%= ctxPath%>/register/pwdFind.gm"; 
			  frm.method = "post";
			  frm.submit();
			  
		  }
	
  }// end of function goFind()-----------------
  
  
</script>








<form name="pwdFindFrm">

	<div class="modal-box__wrapper">
		<div class="modal-box__contents">
			<div class="find-pwd-kr">
				<button type="button" class="close" data-dismiss="modal" onclick="thisclose();" >&times;</button>
				<p class="font--kr font--13 font--rg">계정에 연결된 이메일을 입력하시면 비밀번호를 재설정하실 수 있습니다.</p>
				<div class="flex flex-row font--kr font--13 font--rg margin_b32">
					<input type="text" class="input-box-style input-find-pwd padding_10" name="email" id="" placeholder="이메일을 입력해주세요.">
					<button type="button" id="btnRequestLink" class="btn-black button-auth-number font--kr font--13 font--rg" >링크 받기</button>
				</div>
				<a href="<%= ctxPath%>/register/memberRegister.gm" class="link font--kr font--13 font--rg" data-category="account" data-action="sign_up_click" data-label="normal_signup">회원가입</a>
				
				<!-- 카카오 로그인 -->
				<!--  
				<p class="font--kr font--13 font--rg social-desc">카카오 로그인을 연동하시면 아이디, 비밀번호를 찾을 필요 없이 젠틀몬스터 웹사이트를 이용하실 수 있습니다.</p>
				<div class="action-kakao font--kr font--12">
					<a class="btn btn-kakao font--kr font--13 font--rg" data-category="account" data-action="login_click" data-label="kakao_login" href="javascript:kakaoLogin('https://kauth.kakao.com/oauth/authorize?client_id=30cc6941967f07e5394d81ede9690dcc&amp;&amp;redirect_uri=https://www.gentlemonster.comoauth&amp;&amp;response_type=code')">
						카카오 계정 로그인
					</a>
				</div>
				-->
				<!-- <button type="button" class="modal-box__close model-close-find-pwd" data-close=""></button> -->
			</div>
		</div>
	</div>
	<div class=" modal-box__dim" data-close=""></div>
	<div class=" modal-box__dim" data-close=""></div>
   
</form>


<div class="my-3 text-center" id="div_findResult">
    <c:if test="${requestScope.isUserExist == false}">
       <span style="color: red;">사용자 정보가 없습니다</span>
    </c:if>
    
    <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}">
       <span style="font-size: 10pt;">
           인증코드가 ${requestScope.email}로 발송되었습니다.<br>
           인증코드를 입력해주세요
       </span>
       <br>
       <input type="text" name="input_confirmCode" />
       <br><br> 
       <button type="button" class="btn btn-info" onclick="popClose()">인증하기</button>
    </c:if>
    
    <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == false}">
       <span style="color: red;">메일발송이 실패했습니다</span>
    </c:if>
</div>


<%-- 인증하기 form --%>
<form name="verifyCertificationFrm">
	<input type="hidden" name="userCertificationCode" />
	<input type="hidden" name="userEmail" />
</form>





<!-- 시간 남으면 모달로 구현해봐.. 일단은 alert로 구현했음. -->
<!-- /////////////////////// 모달 //////////////////////////// -->	
	
	<!-- 메일(비밀번호 재설정 링크) 발송 완료 안내 Modal 시작 -->
	

<%-- 
	<div class="modal fade" id="pwdFindConfirmModal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<!-- Modal header -->
				<div class="modal-header">
					<h2 class="font--kr font--15 font--bd">요청 접수 완료</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
	
				<!-- Modal body -->
				<div class="modal-body">
					
					<div class="modal-box__wrapper">
						<div class="modal-box__contents">
							<div class="find-pwd-confirm">
								<p class="font--kr font--13 font--bd">
									<b>메일로 발송된 링크를 눌러 비밀번호를 재설정하세요</b>
								</p>
								<p class="font--kr font--13 font--rg">
									이메일 주소를 제출해주셔서 감사합니다.<br>비밀번호 재설정에 필요한 정보를 이메일로 발송하였습니다.<br>이메일
									수신 확인을 위해 스팸 메일함을 체크해주시기 바랍니다.
								</p>
							</div>
						</div>
					</div>
					
				</div>
			
			</div>
		</div>
	</div>
--%>	
	
	
	<!-- 메일(비밀번호 재설정 링크) 발송 완료 안내 Modal 끝 -->