
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



// Function Declaration
// === 로그인 처리 함수 === //
function goLogin() {
	
	const login_id = $("input#login_id").val().trim();
	const mb_password = $("input#mb_password").val().trim();
	
	if(login_id == "") {
		$("input#login_id").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	if(mb_password == "") {
		$("input#mb_password").val("").focus();
		return; // goLogin() 함수 종료
	}
	
	const frm = document.flogin;
	frm.submit();
	
}// end of function goLogin()-------------



