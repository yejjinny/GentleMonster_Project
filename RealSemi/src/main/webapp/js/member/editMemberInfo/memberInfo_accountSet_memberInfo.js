/**
 * 
 */

  $(document).ready(function(){ 
	  
	  
	  $("button#btnDefault").click(function(){
		  const addrDefault=$("input#addrDefaultCheck").val();
		  //alert(addrDefault);
		  if(addrDefault =="0"  ){
			  $("button#btnDefault").css({ "background-color":"black", "color":"black" });
				  
			  //('background-color','black');
			  //$("button#btnDefault").css('color','white');
			  $("input#addrDefaultCheck").val("1");
		  }
		  if(addrDefault =="1"  ){
			  $("button#btnDefault").css({ "background-color":"white", "color":"white" });
			  //$("button#btnDefault").css('background-color','white');
			  $("input#addrDefaultCheck").val("0");
		  }
		   
		});
		
		
		
		
		
		 $("button#talCheck").click(function(){
			 
			 const addrDefault=$("input#addrDefaultCheck").val();
			 if(addrDefault =="0"  ){
				 
				 alert("동의 버튼을 눌러주세요.");
				 
			 }
			 else{
				 location.href='memberInfoDelete.gm'
			 } // end else ---
			 
		}); // end of $("button#talCheck").click(function()
	/*  
	 const frm= document.EditToFrm;
		frm.action= "memberInfoEdit.gm";
		frm.method="post";
		frm.submit();
	  */
	  //-----------------------------------------
	 /*$("button#btnEdit").click(function(){
		goMemberInfo();
		 
	 });*/
	 /*
	 $("input#loginPwd").bind("keydown",function( e){
		 
		 if(e.keyCode == 13 ){ //암호입력란에 엔터를 했을 경우
			goLogin(); //로그인시도한다
			 
		 }
	 });
	 */
}); //end of $(document).ready(function()



function goMemberInfo(ctxPath){
	
	//alert(ctxPath);
	
	   const frm= document.EditToFrm;
		frm.action= "memberInfoEditToPwd.gm";
		frm.method="post";
		frm.submit();
	   
	//location.href=`${ctxPath}/member/memberInfoEditToPwd.gm`;
	

	
} // end of goMemberInfo()--------------------