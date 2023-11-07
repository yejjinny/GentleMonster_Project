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
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/bootstrap/bootstrap.min.css" > 			

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/register/pwdFind.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>		
<script type="text/javascript" src="<%= ctxPath%>/js/bootstrap.bundle.min.js" ></script>  


<script type="text/javascript">
  $(document).ready(function(){
	  
	  const method = "${requestScope.method}";
		
	  if(method == "POST") { // 포스트방식으로 왔을 때
		  const isUserExist = "${requestScope.isUserExist}"
		  
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
 		
 		  
 		 /* 발급한 인증코드가 일치하는지 확인 */
 		$.ajax({
 			url: `<%= ctxPath%>/register/verifyCertification.gm`,
 			data: { "userCertificationCode": $("input[name='input_confirmCode']").val()},
 			type: "post",
 			async: true,
 			dataType: "json",
 			success: function(text) {
 				if (text.isSame) {
 					// true일 경우 = 인증코드가 일치할 경우
 						
 					window.parent.closeModal();
 					window.parent.goToPwdChange(); 
 				} else {
 				 // false일 경우 = 인증코드가 일치하지 않았을 경우

 					alert("인증 실패! 인증코드를 재발급 받아주세요.");
 				}
 			},
			error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
			}
 		});
 		  
 	  });
 	  
 	  
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



<form name="pwdFindFrm" autocomplete="off">
	<div class="modal-box__wrapper">
		<div class="modal-box__contents">
			<div class="find-pwd-kr">
				<p class="font--kr font--13 font--rg">계정에 연결된 이메일을 입력하시면 비밀번호를 재설정하실 수 있습니다.</p><br>
				<div class="flex flex-row font--kr font--13 font--rg margin_b32">
					<input type="text" class="input-box-style input-find-pwd padding_10" name="email" id="" placeholder="이메일을 입력해주세요.">
					<input type="text" style="display: none;">
					<button type="button" id="btnRequestLink" class="btn-black button-auth-number font--kr font--13 font--rg" >링크 받기</button>
				</div>
			</div>
		</div>
	</div>
	<div class=" modal-box__dim" data-close=""></div>
	<div class=" modal-box__dim" data-close=""></div>
</form>


<div class="my-3 text-center" id="div_findResult">
    <c:if test="${requestScope.isUserExist == false}">
       <span style="color: red;">존재하는 회원이 없습니다.</span>
    </c:if>
    
    <c:if test="${requestScope.isUserExist == true && requestScope.sendMailSuccess == true}">
       <span style="font-size: 10pt;">
           인증코드가 ${requestScope.email}로 발송되었습니다.<br>
           인증코드를 입력해주세요
       </span>
       <br>
       <input type="text" name="input_confirmCode" var="input_confirmCode"/>
       <br><br> 
       <button type="button" class="btn btn-info">인증하기</button>
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





