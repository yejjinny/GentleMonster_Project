/**
 * 
 */

   $(document).ready(function(){ 
	   
	   
	   
	  
	 
	
	$("button#button_reset_password").click(function(){
		 
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
		 
		   
		     alert("비밀번호 형식에 맞게 입력하세요.");
	   	}	   		 
		else if( password !=confirm_mb_password ){ //새로운 비밀번호와 새로운비밀번호확인이 맞지 않을때
		 
			 
			 alert("새로운 비밀번호가 일치하지 않습니다.");
			 
		 }
		 else{
			 
			
			
			    $.ajax({
					url:"memberChangePwd.gm",
					 
					data:{"reg_mb_password_old": reg_mb_password_old , "password": password   },   
					type: "post",  
					
					   
					async:true,      
			           dataType:"json",    
					success:function(json){
						  
						  
						  if( json.isExists ){
							  
							 location.href=`memberInfoEdit.gm`;
							 
							  
							 
						 }
						 else{
							 
							 
							  
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