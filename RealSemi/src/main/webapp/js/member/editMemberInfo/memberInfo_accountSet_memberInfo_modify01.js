/**
 * 
 */

  $(document).ready(function(){ 
	  
	  
	 
	  
	  
	  //-----------------------------------------
	 $("button#button_reset_password").click(function(){
		 		
		const ps= $("input[type='password']").val();
		const memberId= $("input#memberId").val();
		 
		
				////email  중복확인을 클릭했는지 클릭을 안했는지 여부를 알아오기 위한 용도
				b_emailcheck_click =true;
				
				
				
                $.ajax({
					url:"memberInfoPwdCheck.gm",
					 
					data:{"pwd": $("input#check_password_pw").val() , "memberId":$("input#memberId").val() },   
					type: "post",  
					
					  
					async:true,       
                       dataType:"json",   
					success:function(json){
						 
						  
						  
						  if( json.isExists ){
							  
							 const frm= document.EditToCheckFrm;
							 frm.action = "memberInfoEditToPwdCheck.gm";
							 frm.method="post";
							 frm.submit();
						 }
						 else{
							 //입력한 userid가 존재하지 않는 경우라면
							 
							 
							alert("비밀번호를 확인해 주세요.");
						 }
						 
					 
					},
					error: function(request, status, error){
               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
             }
					
				});
				
		
		
	 }); //end of $("button#button_reset_password").click(function()--------
	 
	 
 
	 
}); //end of $(document).ready(function()----------------------


 