/**
 * 
 */

  $(document).ready(function(){ 
	  
	  const gender=$("input#gender_select").val();
	  
	  if (gender=='남성'){
		   
		   $("#mb_gender").val("1").prop("selected",true);
	  }
	  else{
		  
		   $("#mb_gender").val("2").prop("selected",true);
	  }
	   
	  
	  $("input#reg_mb_email").blur(  (e)=> {
		  
		  
		  const email= $(e.target).val().trim();
		  
		  if( email ==""){
			 alert("이메일을 입력하세요.");
		 }
		 
		 
		 const regExp_email =new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
		 //숫자/문자/특수문자 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성
		 
		 const bool =regExp_email.test( $(e.target).val() ); 
		 if( !bool ){
			 alert("올바른 이메일을 입력하세요.");
		 }
		 
	  }); //end of $("input#reg_mb_email").blur(  (e)---
	  //--------------
	 
	  
		
		
		$("button#MemberEditBtn").click(function(){
			
			 
			//-----------------------------
			const genderEdit= $("#mb_gender").val();
			 
			
			
			
		 
		
		
	    $.ajax({
			url:"memberInfoEditEnd.gm",
			 
			data:{"email": $("input#reg_mb_email").val() , "gender":genderEdit },   
			type: "post",  
			
			   
			async:true,       
	           dataType:"json",    
			success:function(json){
				 
				  
				  if( json.isExists ){
					 
					 location.href="memberInfoView.gm";
					 
					  
					 
				 }
				 else{
					 
					 
					 
					alert("회원정보 수정 실패");
				 }
				 
			 
			},
			error: function(request, status, error){
	   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	 }
			
		}); // end ajax-------------------------
		
		
		
		
			
		 }); //end of $("button#MemberEditBtn").click(function()--------
 
	 
}); //end of $(document).ready(function()----------------------

