/**
 * 
 */

  $(document).ready(function(){ 
	  
	   
	  $("button#delBtn").click(function(){
		  if(confirm("삭제하시겠습니까?")){
				alert($("input#btnDelAddrId3").val());
				 
						 
				 
				
				 
			} // end of if
	  }) // end of $("button#delBtn").click
			
	  
}); // end of $(document).ready(function()


   function deleteAddress_confirmm(index){
			 
			if(confirm("삭제하시겠습니까?")){
				
				const aid="input#btnDelAddrId"+index;
				const addressbookid= $(aid).val();
				 
				 
				  
				 
			    $.ajax({
					url:"addressBookDelete.gm",
					 
					data:{"addressbookid": addressbookid  },  
					type: "post",  
					
					 
					async:true,       
			           dataType:"json",    
					success:function(json){
						 
						  if( json.isExists ){
							  
							 location.href=`addressBook.gm`;
							 
							 
						 }
						 else{
							 //입력한 userid가 존재하지 않는 경우라면
							 
							 
							alert("삭제 실패");
						 }
						 
					 
					},
							error: function(request, status, error){
					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 }
							
					}); // end ajax-------------------------
					
				 
			} // end of if
			
} // end of deleteAddress_confirmm(index)
