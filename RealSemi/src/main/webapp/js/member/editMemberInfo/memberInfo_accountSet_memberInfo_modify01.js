/**
 * 
 */

  $(document).ready(function(){ 
	  
	  
	 
	  
	  
	  //-----------------------------------------
	 $("button#button_reset_password").click(function(){
		 		
		const ps= $("input[type='password']").val();
		const memberId= $("input#memberId").val();
		/*const frm= document.loginFrm;
		frm.submit();*/
		//alert("dkdk: "+memberId);
		//-----------------------------------
		
		
				////email  중복확인을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
				b_emailcheck_click =true;
				
				
				
                $.ajax({
					url:"memberInfoPwdCheck.gm",
					//data 속성은  http://localhost:9090/MyMVC/member/memberRegister.up 로 전송해야할 데이터를 말한다
					data:{"pwd": $("input#check_password_pw").val() , "memberId":$("input#memberId").val() },  //data ->속성명....{} ->value값
					type: "post", //기본이 get ..설정안하면 기본 get방식이다
					
					  //false 동기  .. true 비동기
					async:true,      // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
                               // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다. 
                        
                       dataType:"json",   //const json= JSON.parse(text); 을 수행하지 않아도 됨
                       // Javascript Standard Object Notation.  dataType은 /MyMVC/member/idDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다.
                                 // 만약에 dataType:"xml" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
                                 // 만약에 dataType:"json" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 json 형식이어야 한다.   
                           
					success:function(json){
						 console.log("json  :",json)
						  console.log("~~~json의 데이터타입 ; ",typeof json);
						  //~~~json의 데이터타입 ;  object
						  
						  if( json.isExists ){
							 //입력한 email가 이미 사용중이라면
							 //$("span#emailcheckResult").html( $("input#email").val() + "은 이미 사용중이므로 다른 이메일를 입력하세요" ).css( {"color":"red"});
							 //$("input#email").val("");
							 alert(json.isExists);
							 const frm= document.EditToCheckFrm;
							 frm.action = "memberInfoEditToPwdCheck.gm";
							 frm.method="post";
							 frm.submit();
						 }
						 else{
							 //입력한 userid가 존재하지 않는 경우라면
							 
							 // $("span#emailcheckResult").html( $("input#email").val() + "은 사용가능합니다" ).css( {"color":"navy"});
							alert("비밀번호를 확인해 주세요.");
						 }
						 
					 
					},
					error: function(request, status, error){
               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
             }
					
				});
				
		
		
	 }); //end of $("button#button_reset_password").click(function()--------
	 
	 
/*
	 $("input#loginPwd").bind("keydown",function( e){
		 
		 if(e.keyCode == 13 ){ //암호입력란에 엔터를 했을 경우
			goLogin(); //로그인시도한다
			 
		 }
	 });
	 */
	 
}); //end of $(document).ready(function()----------------------


/*
function goMemberInfo(ctxPath){
	
	//alert(ctxPath);
	location.href=`${ctxPath}/member/memberInfoEdit.gm`;
	
} // end of goMemberInfo()-------------------- 


*/