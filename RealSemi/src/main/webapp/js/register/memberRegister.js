let b_emailCheck = false;

$(document).ready(function(){
	
	
	
	$("span.error").css({"visibility":"hidden"});
	
	
	$("input#email").keyup(function(){
		$("input#email").parent().find("span.error").css({"visibility":"hidden"});
		$("input#email").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input#email_check").keyup(function(){
		$("input#email_check").parent().find("span.error").css({"visibility":"hidden"});
		$("input#email_check").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input#pwd").keyup(function(){
		$("input#pwd").parent().find("span.error").css({"visibility":"hidden"});
		$("input#pwd").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input#pwd_re").keyup(function(){
		$("input#pwd_re").parent().find("span.error").css({"visibility":"hidden"});
		$("input#pwd_re").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input#familyName").keyup(function(){
		$("input#familyName").parent().find("span.error").css({"visibility":"hidden"});
		$("input#familyName").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input#lastName").keyup(function(){
		$("input#lastName").parent().find("span.error").css({"visibility":"hidden"});
		$("input#lastName").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("select#mb_birth_year").click(function(){
		$("select#mb_birth_year").parent().find("span.error").css({"visibility":"hidden"});
		$("select#mb_birth_year").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("select#mb_birth_month").click(function(){
		$("select#mb_birth_month").parent().find("span.error").css({"visibility":"hidden"});
		$("select#mb_birth_month").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("select#mb_birth_day").click(function(){
		$("select#mb_birth_day").parent().find("span.error").css({"visibility":"hidden"});
		$("select#mb_birth_day").parent().find("input.input-box-style").css("border", "solid 1px #000000");
	});
	
	$("input:checkbox[id='agreement_age']").change(function(){
		// $("input:checkbox[id='agreement_age']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
		$("input:checkbox[id='agreement_age']").parent().find("span").css({"color":"#000000"});
	});
	
	$("input:checkbox[id='agreement_terms']").change(function(){
		// $("input:checkbox[id='agreement_terms']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
		$("input:checkbox[id='agreement_terms']").parent().find("span .atag-line").css({"color":"#000000"});
		// $("input:checkbox[id='agreement_terms']").parent().find(".atag-line").css("border", "solid 1px #000000"); 이것도..
	});
	
	$("input:checkbox[id='agreement_privacy_policy']").change(function(){
		// $("input:checkbox[id='agreement_privacy_policy']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
		$("input:checkbox[id='agreement_privacy_policy']").parent().find("span .atag-line").css({"color":"#000000"});
		// $("input:checkbox[id='agreement_privacy_policy']").parent().find(".atag-line").css("border", "solid 1px #000000"); 이것도..
	});
	
	
	
	// "이메일중복확인" 을 클릭했을 경우
	$("button#emailCheck").click(function(){
		b_emailCheck = true; // "이메일중복확인" 을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도 
		emailCheck();
	});	

	/*if( $("input#email").val().trim() != "" && !b_emailCheck){ // email을 입력했는데 이메일중복확인 클릭을 하지 않았을 경우
		alert("email 중복 확인을 해주세요");	
	}*/

	// 이메일값이 변경되면 가입하기 버튼을 클릭시 "이메일중복확인" 을 클릭했는지 클릭안했는지를 알아보기위한 용도 초기화 시키기 
	$("input#email").bind("change", function(){ 
		b_emailCheck = false;
		$("span#emailCheckResult").html("");
	});	
	
	
	// 약관 모두선택
	$("input[id='check_all']").change(function() {

        //전체 클릭은 value가 00이다. checkbox true 여부 확인하다.
        if($(this).is(':checked', true) && $(this).val() == 'T') {
            $(this).parents('.agreement').find('input').prop('checked', true);

        } else if($(this).val() == 'T'){
            $(this).parents('.agreement').find('input').prop('checked', false);
        }

    });
    /*
	if( $("input#agreement_age").is(':checked', true) &&
		$("input#agreement_terms").is(':checked', true) &&
		$("input#agreement_privacy_policy").is(':checked', true) &&
		$("input#agreement_marketing_check").is(':checked', true) &&
		$("input#agreement_marketing_info").is(':checked', true) ) {
            $("input[id='check_all']").prop('checked', true);
	}
	else{
		$("input[id='check_all']").prop('checked', false);
	}*/
	
	
});// end of $(document).ready(function(){})----------------	



// Function Declaration
function formTest(){
	
	{
		// ***** 이메일 ***** //
		const regExp_email = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
	 	
	 	const bool = regExp_email.test($("input#email").val());
	 																			
	 	if(!bool){	// 이메일이 정규표현식에 위배된 경우			
			 $("input#email").parent().find("span.error").html("이메일 형식에 맞게 입력해주십시오.").css({"color":"#EF480E", "visibility":"visible"});
			 $("input#email").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			 
			 if( $("input#email").val().trim() == "" ){ // 공백인 경우
				 $("input#email").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#email").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			 }
		} 	 	
		else {	// 이메일이 정규표현식에 맞는 경우
			$("input#email").parent().find("span.error").css({"visibility":"hidden"});
			$("input#email").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		}
	}
	
		
	{
		// ***** 이메일 확인 ***** //
		if( $("input#email_check").val().trim() == "" ){ // 공백인 경우
			$("input#email_check").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
			$("input#email_check").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");	
		}
	 	else if( $("input#email").val() != $("input#email_check").val() ) { // email과 email_check가 일치하지 않는 경우
			 $("input#email_check").parent().find("span.error").html("이메일 주소가 일치하지 않습니다.").css({"color":"#EF480E", "visibility":"visible"});
			 $("input#email_check").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		} 	 	
		else { // email과 email_check가 일치하는 경우
			$("input#email_check").parent().find("span.error").css({"visibility":"hidden"});
			$("input#email_check").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		}
	}
	
	
	{
		// ***** 비밀번호 ***** //
		const regExp_pwd = new RegExp(/^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,15}$/g);
	    // 숫자/대문자/특수문자 포함 형태의 8~15자리 이내의 비밀번호 정규표현식 객체 생성 
	    
	    const bool = regExp_pwd.test($("input#pwd").val());	
		
		if(!bool){	// 비밀번호가 정규표현식에 위배된 경우 			
			 $("input#pwd").parent().find("span.error").html("숫자, 대문자, 특수문자를 모두 포함한 형태의 8자 이상 15자 이하의 비밀번호를 입력하세요.").css({"color":"#EF480E", "visibility":"visible"});
			 $("input#pwd").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			 
			 if( $("input#pwd").val().trim() == "" ){ // 공백인 경우  
				 $("input#pwd").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#pwd").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			 } 
		} 	 	
		else {	// 암호가 정규표현식에 맞는 경우
			$("input#pwd").parent().find("span.error").css({"visibility":"hidden"});
			$("input#pwd").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		}
	}
		
		
	{
		// ***** 비밀번호 확인 ***** //
		if( $("input#pwd_re").val().trim() == "" ){ // 공백인 경우
			$("input#pwd_re").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
			$("input#pwd_re").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");	
		}
	 	else if( $("input#pwd").val() != $("input#pwd_re").val() ) { // pwd와 pwd_re가 일치하지 않는 경우
			 $("input#pwd_re").parent().find("span.error").html("일치하는 비밀번호를 입력하세요.").css({"color":"#EF480E", "visibility":"visible"});
			 $("input#pwd_re").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		} 	 	
		else { // pwd와 pwd_re가 일치하는 경우
			$("input#pwd_re").parent().find("span.error").css({"visibility":"hidden"});
			$("input#pwd_re").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		}
	}	
	
	
	{
		// ***** 이름 (familyName, lastName) ***** //
		const regExp_name = new RegExp(/[0-9]|[!@#$%^&*()\-_=+\\\|\[\]\{};:\'",.<>\/?]/);
	    
	   	/* familyName */
	    const bool_familyName = regExp_name.test($("input#familyName").val());	// 숫자나 특수문자가 입력되어 정규표현식에 위배될 경우에 true
		
		if( $("input#familyName").val().trim() == "" ){ // 공백인 경우  
				 $("input#familyName").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#familyName").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		} 
		else{	 
			if(bool_familyName){ // 정규표현식에 맞지 않는 familyName이 입력된 경우 			
				 $("input#familyName").parent().find("span.error").html("이름에 숫자나 특수문자가 들어갈 수 없습니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#familyName").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			} 	 	
			else { // 정규표현식에 맞는 familyName이 입력된 경우
				$("input#familyName").parent().find("span.error").css({"visibility":"hidden"});
				$("input#familyName").parent().find("input.input-box-style").css("border", "solid 1px #000000");
			}
		}
		
		/* lastName */
		const bool_lastName = regExp_name.test($("input#lastName").val());	// 숫자나 특수문자가 입력되어 정규표현식에 위배될 경우에 true
		
		if( $("input#lastName").val().trim() == "" ){ // 공백인 경우  
				 $("input#lastName").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#lastName").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		} 
		else{	 
			if(bool_lastName){ // 정규표현식에 맞지 않는 lastName이 입력된 경우 			
				 $("input#lastName").parent().find("span.error").html("이름에 숫자나 특수문자가 들어갈 수 없습니다.").css({"color":"#EF480E", "visibility":"visible"});
				 $("input#lastName").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
			} 	 	
			else { // 정규표현식에 맞는 lastName이 입력된 경우
				$("input#lastName").parent().find("span.error").css({"visibility":"hidden"});
				$("input#lastName").parent().find("input.input-box-style").css("border", "solid 1px #000000");
			}
		}
	}
	
	
	{
		// ***** 생년월일 ***** //
		/* 년 */
		if( $("select#mb_birth_year").val().trim() == "" ){ // 선택하지 않은 경우 
			$("select#mb_birth_year").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
			$("select#mb_birth_year").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		}
		else{ // 선택한 경우
			$("select#mb_birth_year").parent().find("span.error").css({"visibility":"hidden"});
			$("select#mb_birth_year").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		} 
		
		/* 월 */
		if( $("select#mb_birth_month").val().trim() == "" ){ // 선택하지 않은 경우 
			$("select#mb_birth_month").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
			$("select#mb_birth_month").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		}
		else{ // 선택한 경우
			$("select#mb_birth_month").parent().find("span.error").css({"visibility":"hidden"});
			$("select#mb_birth_month").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		} 
		
		/* 일 */
		if( $("select#mb_birth_day").val().trim() == "" ){ // 선택하지 않은 경우  
			$("select#mb_birth_day").parent().find("span.error").html("필수 입력란 입니다.").css({"color":"#EF480E", "visibility":"visible"});
			$("select#mb_birth_day").parent().find("input.input-box-style").css("border", "solid 1px #EF480E");
		}
		else{ // 선택한 경우
			$("select#mb_birth_day").parent().find("span.error").css({"visibility":"hidden"});
			$("select#mb_birth_day").parent().find("input.input-box-style").css("border", "solid 1px #000000");
		}
	}
			
		
	{	
	// ***** 약관 ***** //
		/* agreement_age */
		if($("input:checkbox[id='agreement_age']").is(":checked") == false){ // true 이면 체크된 상태, false 이면 체크 안 된 상태.
			// $("input:checkbox[id='agreement_age']").parent().find("input").css("border", "solid 1px #EF480E"); 이거 안 먹네...
			$("input:checkbox[id='agreement_age']").parent().find("span").css({"color":"#EF480E"});
		}
		else{
			// $("input:checkbox[id='agreement_age']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
			$("input:checkbox[id='agreement_age']").parent().find("span").css({"color":"#000000"});
		}
		
		/* agreement_terms */
		if($("input:checkbox[id='agreement_terms']").is(":checked") == false){ // true 이면 체크된 상태, false 이면 체크 안 된 상태.
			// $("input:checkbox[id='agreement_terms']").parent().find("input").css("border", "solid 1px #EF480E"); 이거 안 먹네...
			$("input:checkbox[id='agreement_terms']").parent().find("span .atag-line").css({"color":"#EF480E"});
			// $("input:checkbox[id='agreement_terms']").parent().find(".atag-line").css("border", "solid 1px #EF480E"); 이것도..
		}
		else{
			// $("input:checkbox[id='agreement_terms']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
			$("input:checkbox[id='agreement_terms']").parent().find("span .atag-line").css({"color":"#000000"});
			// $("input:checkbox[id='agreement_terms']").parent().find(".atag-line").css("border", "solid 1px #000000"); 이것도..
		}
		
		/* agreement_privacy_policy */
		if($("input:checkbox[id='agreement_privacy_policy']").is(":checked") == false){ // true 이면 체크된 상태, false 이면 체크 안 된 상태.
			// $("input:checkbox[id='agreement_privacy_policy']").parent().find("input").css("border", "solid 1px #EF480E"); 이거 안 먹네...
			$("input:checkbox[id='agreement_privacy_policy']").parent().find("span .atag-line").css({"color":"#EF480E"});
			// $("input:checkbox[id='agreement_privacy_policy']").parent().find(".atag-line").css("border", "solid 1px #EF480E"); 이것도..
		}
		else{
			// $("input:checkbox[id='agreement_privacy_policy']").parent().find("input").css("border", "solid 1px #000000"); 이거 안 먹네...
			$("input:checkbox[id='agreement_privacy_policy']").parent().find("span .atag-line").css({"color":"#000000"});
			// $("input:checkbox[id='agreement_privacy_policy']").parent().find(".atag-line").css("border", "solid 1px #000000"); 이것도..
		}
	
	}
	
		
}// end of function formTest()--------


// "가입하기" 버튼 클릭시 호출되는 함수
function goRegister() {
	
	formTest();
	
	
	///////////////////////////////////////////////////////// 주석 지워
	
	
	
	// *** 필수입력사항에 모두 입력이 되었는지 검사하기 시작 *** //
	let b_requiredInfo = false;
		
	const requiredInfo_list = document.querySelectorAll(".requiredInfo"); 
    for(let i=0; i<requiredInfo_list.length; i++){
		
		const val = requiredInfo_list[i].value.trim();
		if( val == "" ||
		    $("input:checkbox[id='agreement_age']").is(":checked") == false ||
       		$("input:checkbox[id='agreement_terms']").is(":checked") == false ||
       		$("input:checkbox[id='agreement_privacy_policy']").is(":checked") == false ) {
				   alert("필수입력사항을 모두 입력하고, 필수 약관에 동의하셔야 합니다.");
		    	   b_requiredInfo = true;
		    	   break;  
		    	   
		}
		
	}// end of for-----------------------------
    
	if(b_requiredInfo) {
		return; // goRegister() 함수를 종료한다.
	}
	// *** 필수입력사항에 모두 입력이 되었는지 검사하기 끝 *** //
	
	// *** "이메일중복확인" 을 클릭했는지 검사하기 시작 *** //
	if(!b_emailCheck){ // "이메일중복확인" 을 클릭 안 했을 경우
		alert("이메일 중복확인을 하세요");
		return; // goRegister() 함수를 종료한다.	
	}
	// *** "이메일중복확인" 을 클릭했는지 검사하기 끝 *** //
	
	
	const frm = document.memberRegisterFrm;
	frm.submit();
		
	
}// end of function goRegister()-----------------------
	

function emailCheck(){
	
	$.ajax({
		 url:"emailDuplicateCheck.gm",			
		 data:{"email":$("input#email").val()}, // data 속성은 http://localhost:9090/tempSemi/register/emailDuplicateCheck.gm 로 전송해야할 데이터를 말한다. 
		 type:"post",  //  type 을 생략하면 type:"get" 이다.
		 async:true,   // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
     		           // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다.   
		 dataType:"json", // Javascript Standard Object Notation.  dataType은 /tempSemi/register/emailDuplicateCheck.gm 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다. 
     		              // 만약에 dataType:"xml" 으로 해주면 /tempSemi/register/emailDuplicateCheck.gm 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
     		              // 만약에 dataType:"json" 으로 해주면 /tempSemi/register/emailDuplicateCheck.gm 로 부터 받아오는 결과물은 json 형식이어야 한다. 
		 	
		 success:function(json){
			 
			 if(json.isExists) {
				 // 입력한 email 이 이미 사용중이라면
				 alert("입력하신 email은 이미 사용중입니다."+"\n"+"다른 email을 입력해주세요.");
				 $("input#email").val("");
				 $("input#email_check").val("");
			 }
			 else {
				 if($("input#email").val().trim() == ""){ // 공백일 경우
				 	alert("email을 입력하세요");
				 }
				 else{// 입력한 email 이 기존 회원의 email에 존재하지 않는 경우라면 (사용가능한 경우)
					// b_emailCheck = true; 
					 $("span#emailCheckResult").html("사용가능한 이메일입니다.").css({"color":"navy"});  
				} 
			 }
		 },
		 
		 error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		 }
		 
	 });
	
	
}// end of function emailCheck()-------










