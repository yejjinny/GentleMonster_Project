/**
 * 
 */

   $(document).ready(function(){ 
	   
	   
	   
	   /*
	   $("input#mb_password").blur( (e) => {
		   
		   //alert("dks");
		   const password=$("input#mb_password").val();
		   
		   const regExp_pwd = new RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/); 
		     // // 최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상
		      const bool = regExp_pwd.test($(e.target).val());  
		      
		      
		     const regExp_pwd_upper = new RegExp(/^(?=.*?[A-Z]).{1,}$/); 
		     //  영문자 대문자 최소 1개 이상
		      const bool_upper = regExp_pwd_upper.test($(e.target).val());  
		      
		      
		        const regExp_pwd_special = new RegExp(/^(?=.*?[#?!@$ %^&*-]).{1,}$/); 
		     // //  특수문자가  최소 1개 이상
		      const bool_special = regExp_pwd_special.test($(e.target).val());  
		      
		      
		        const regExp_pwd_number = new RegExp(/^(?=.*?[0-9]).{1,}$/); 
		     // //  숫자 최소 1개 이상
		      const bool_number =  regExp_pwd_number.test($(e.target).val());  
       
       
       
       if(bool){
		   $("span#numberSum").css('color','blue');
	   }
	   else{
		   $("span#numberSum").css('color','gray');
	   }
	   
	   if(bool_upper){
		   $("span#upper").css('color','blue');
	   }
	   else{
		   $("span#upper").css('color','gray');
	   }
	   
	   if( bool_special){
		   $("span#special").css('color','blue');
	   }
	   else{
		   $("span#special").css('color','gray');
	   }
	   
	   if( bool_number){
		   $("span#number").css('color','blue');
	   }
	   else{
		   $("span#number").css('color','gray');
	   }
		   
		   
		   
	 	}); // end of $("input#mb_password").blur( (e)----
	 	 
	 	*/
	
	 
	
	$("button#button_reset_password").click(function(){
		
		//alert("누름");
		//모든 칸 검사해서 form제출 할지 안할지 액션
		const reg_mb_password_old=$("input#reg_mb_password_old").val().trim();
		  
		 
		  
		 
		  const password=$("input#mb_password").val();
		   
		   
		   const regExp_pwd = new RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/); 
		     // // 최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상
		      const bool = regExp_pwd.test(password);  
		      
		       
		 const confirm_mb_password=$("input#confirm_mb_password").val();
		 
		      
		 
		 if(  reg_mb_password_old == "" ){ //현재비밀번호를 입력하지 않았을때 
			 
			 alert("현재 비밀번호를 입력하세요.");
			 
		 }
		 else if(!bool){ //새로운 비밀번호가 정교표현식에 맞지 않을 때
		 
		   //$("span#numberSum").css('color','blue');
		    //$("span#pwdCheck").css('color','white');
		     alert("비밀번호 형식에 맞게 입력하세요.");
	   	}	   		 
		else if( password !=confirm_mb_password ){ //새로운 비밀번호와 새로운비밀번호확인이 맞지 않을때
		 
			 //$("span#confirmCheck").css('color','white');
			 alert("새로운 비밀번호가 일치하지 않습니다.");
			 
		 }
		 else{
			// $("span#nowPwdCheck").css('color','white');
			
			
			    $.ajax({
					url:"memberChangePwd.gm",
					//data 속성은  http://localhost:9090/MyMVC/member/memberRegister.up 로 전송해야할 데이터를 말한다
					data:{"reg_mb_password_old": reg_mb_password_old , "password": password   },  //data ->속성명....{} ->value값
					type: "post", //기본이 get ..설정안하면 기본 get방식이다
					
					  //false 동기  .. true 비동기
					async:true,      // async:true 가 비동기 방식을 말한다. async 을 생략하면 기본값이 비동기 방식인 async:true 이다.
			                   // async:false 가 동기 방식이다. 지도를 할때는 반드시 동기방식인 async:false 을 사용해야만 지도가 올바르게 나온다. 
			            
			           dataType:"json",   //const json= JSON.parse(text); 을 수행하지 않아도 됨
			           // Javascript Standard Object Notation.  dataType은 /MyMVC/member/idDuplicateCheck.up 로 부터 실행되어진 결과물을 받아오는 데이터타입을 말한다.
			                     // 만약에 dataType:"xml" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 xml 형식이어야 한다. 
			                     // 만약에 dataType:"json" 으로 해주면 /MyMVC/member/idDuplicateCheck.up 로 부터 받아오는 결과물은 json 형식이어야 한다.   
			               
					success:function(json){
						 //console.log("json  :",json)
						  //console.log("~~~json의 데이터타입 ; ",typeof json);
						  //~~~json의 데이터타입 ;  object
						  
						  if( json.isExists ){
							  //alert("비밀번호 수정 성공");
							 //입력한 email가 이미 사용중이라면
							 //$("span#emailcheckResult").html( $("input#email").val() + "은 이미 사용중이므로 다른 이메일를 입력하세요" ).css( {"color":"red"});
							 //$("input#email").val("");
							 location.href=`memberInfoEdit.gm`;
							  
							 //alert(json.isExists);
							 /*const frm= document.fmemberconfirm;
							 frm.action = "memberInfoViewAll.gm";
							 frm.method="post";
							 frm.submit();*/
							 
							 //alert("확인용 업데이트 됨222");
							  
							 
						 }
						 else{
							 //입력한 userid가 존재하지 않는 경우라면
							 
							 // $("span#emailcheckResult").html( $("input#email").val() + "은 사용가능합니다" ).css( {"color":"navy"});
							alert("기존 비밀번호가 아닙니다. ");
						 }
						 
					 
					},
							error: function(request, status, error){
					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 }
							
					}); // end ajax-------------------------
					
		 } //end of else
		 
		 
		 
		 
		 
	}); // end of $("button#button_reset_password").click(function()
	
	
	
	 
	
	 $("input#reg_mb_password_old").keyup( (e) =>{
		 
		 const reg_mb_password_old=$("input#reg_mb_password_old").val().trim();
		 
		 
		 
		 if( reg_mb_password_old=="" ){
			 
			 $("span#nowPwdCheck").css('color','red'); 
		 }
		 else{
			 $("span#nowPwdCheck").css('color','white');
		 }
	 });//end of $("input#reg_mb_password_old").keyup( (e)--------------
	 	 
	
	 $("input#mb_password").keyup( (e) =>{
		 
		  const password=$("input#mb_password").val();
		   
		   
		   const regExp_pwd = new RegExp(/^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$ %^&*-]).{8,}$/); 
		     // // 최소 8자 이상으로 영문자 대문자, 영문자 소문자, 숫자, 특수문자가 각각 최소 1개 이상
		      const bool = regExp_pwd.test($(e.target).val());  
		      
		      
		     const regExp_pwd_upper = new RegExp(/^(?=.*?[A-Z]).{1,}$/); 
		     //  영문자 대문자 최소 1개 이상
		      const bool_upper = regExp_pwd_upper.test($(e.target).val());  
		      
		      
		        const regExp_pwd_special = new RegExp(/^(?=.*?[#?!@$ %^&*-]).{1,}$/); 
		     // //  특수문자가  최소 1개 이상
		      const bool_special = regExp_pwd_special.test($(e.target).val());  
		      
		      
		        const regExp_pwd_number = new RegExp(/^(?=.*?[0-9]).{1,}$/); 
		     // //  숫자 최소 1개 이상
		      const bool_number =  regExp_pwd_number.test($(e.target).val());  
       
       
       
       if(bool){
		   $("span#numberSum").css('color','blue');
		    $("span#pwdCheck").css('color','white');
	   }
	   else{
		   $("span#numberSum").css('color','gray');
		   
		   
		   $("span#pwdCheck").css('color','red');
	   }
	   
	   if(bool_upper){
		   $("span#upper").css('color','blue');
	   }
	   else{
		   $("span#upper").css('color','gray');
	   }
	   
	   if( bool_special){
		   $("span#special").css('color','blue');
	   }
	   else{
		   $("span#special").css('color','gray');
	   }
	   
	   if( bool_number){
		   $("span#number").css('color','blue');
	   }
	   else{
		   $("span#number").css('color','gray');
	   }
		 
	 });//end of $("input#mb_password").keyup( (e)---------------
	 
	 //-------------------------------------------------------
	 
	 $("input#confirm_mb_password").keyup( (e) =>{
		 const password=$("input#mb_password").val();
		 const confirm_mb_password=$("input#confirm_mb_password").val();
		 
		 
		 if( password ==confirm_mb_password ){
			 $("span#confirmCheck").css('color','white');
			 
		 }
		 else{
			 $("span#confirmCheck").css('color','red');
		 }
		 
		 
		 
	});//end of  $("input#confirm_mb_password").keyup( (e)---------------
	 
	   
   }); // end of   $(document).ready(function(){ 