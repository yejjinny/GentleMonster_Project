
$(document).ready(function(){
	
	$("button#btnSubmit").click(function(){
		  goLogin(); // 로그인 시도한다.
	});
	
	$("input#loginPwd").bind("keydown", function(e){
	    if(e.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
		  goLogin(); // 로그인 시도한다.	
		}	
	});
	
});// end of $(document).ready(function(){})------------------


// === 로그인 처리 함수 === //
function goLogin() {
 //	alert("확인용 로그인 처리 하러 간다.");
	
	const login_id = $("input#login_id").val().trim();
	const mb_password = $("input#mb_password").val().trim();
	
	if(login_id == "") {
	//	alert("아이디를 입력하세요!!");
		$("input#login_id").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	if(mb_password == "") {
	//	alert("암호를 입력하세요!!");
		$("input#mb_password").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	const frm = document.flogin;
	frm.submit();
	
}// end of function goLogin()-------------





