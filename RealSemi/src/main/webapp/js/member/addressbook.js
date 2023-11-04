/**
 * 
 */

  $(document).ready(function(){ 
	  
	   
	  $("button#delBtn").click(function(){
		  if(confirm("삭제하시겠습니ds까ds?")){
				alert($("input#btnDelAddrId3").val());
				/*
				 location.href=`addressBook.gm`;
				 
				 $("input#addressbookid").val();
				 
			    $.ajax({
					url:"addressBookDelete.gm",
					//data 속성은  http://localhost:9090/MyMVC/member/memberRegister.up 로 전송해야할 데이터를 말한다
					data:{"email": $("input#reg_mb_email").val() , "gender":genderEdit },  //data ->속성명....{} ->value값
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
							  alert("회원정보 수정 성공");
							 //입력한 email가 이미 사용중이라면
							 //$("span#emailcheckResult").html( $("input#email").val() + "은 이미 사용중이므로 다른 이메일를 입력하세요" ).css( {"color":"red"});
							 //$("input#email").val("");
							 
							  
							 //alert(json.isExists);
							 const frm= document.fmemberconfirm;
							 frm.action = "memberInfoViewAll.gm";
							 frm.method="post";
							 frm.submit();
							 
							 //alert("확인용 업데이트 됨222");
							  
							 
						 }
						 else{
							 //입력한 userid가 존재하지 않는 경우라면
							 
							 // $("span#emailcheckResult").html( $("input#email").val() + "은 사용가능합니다" ).css( {"color":"navy"});
							alert("회원정보 수정 실패");
						 }
						 
					 
					},
							error: function(request, status, error){
					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 }
							
					}); // end ajax-------------------------
					
					*/
						 
				 
				
				 
			} // end of if
	  }) // end of $("button#delBtn").click
			
	  
}); // end of $(document).ready(function()


   function deleteAddress_confirmm(index){
			 
			if(confirm("삭제하시겠습니까?")){
				
				const aid="input#btnDelAddrId"+index;
				const addressbookid= $(aid).val();
				/*const frm= document.deleteFrm1;
				frm.action= "addressBookDelete.gm";
				frm.method="post";
				frm.submit();*/
				//alert("dsdssdd");
				
				
				//location.href=`addressBook.gm`;
				 
				  
				 
			    $.ajax({
					url:"addressBookDelete.gm",
					//data 속성은  http://localhost:9090/MyMVC/member/memberRegister.up 로 전송해야할 데이터를 말한다
					data:{"addressbookid": addressbookid  },  //data ->속성명....{} ->value값
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
							  //alert("제이슨 에딧 성공");
							 //입력한 email가 이미 사용중이라면
							 //$("span#emailcheckResult").html( $("input#email").val() + "은 이미 사용중이므로 다른 이메일를 입력하세요" ).css( {"color":"red"});
							 //$("input#email").val("");
							 location.href=`addressBook.gm`;
							  
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
							alert("삭제 실패");
						 }
						 
					 
					},
							error: function(request, status, error){
					   alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					 }
							
					}); // end ajax-------------------------
					
				 
			} // end of if
			
} // end of deleteAddress_confirmm(index)
