/**
 * 
 */

  $(document).ready(function(){ 
	 
		
		
		
		 $("button#talCheck").click(function(){
			 
			 
			 location.href='memberInfoDelete.gm';
			 
			 
		}); // end of $("button#talCheck").click(function()
	 
	 
}); //end of $(document).ready(function()



function goMemberInfo(ctxPath){
 
	
	   const frm= document.EditToFrm;
		frm.action= "memberInfoEditToPwd.gm";
		frm.method="post";
		frm.submit();
	   
	 
	

	
} // end of goMemberInfo()--------------------