  $(document).ready(function(){ 
	  
	  $('input#is_set_default').click(function(){
	 
	 	if( $('input#is_set_default').is(':checked') ){ //체크박스에 체크되었다면
			 
			 $("input#addrDefaultCheck").val("1");
		 }
		 else{
			 
			 $("input#addrDefaultCheck").val("0");
		 }
	 
	  
	 }); 	// end of $('input#is_set_default').click(function()
	 
	 
	  	
	 $("button#btnAddrSearch").click(function(){
		  
		  $("input#btnAddVal").val("push");
		  
		  
      
      new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                let addr = ''; // 주소 변수
                let extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    $("input#edit_detailAddress").val(extraAddr);
                     
                
                } else {
					$("input#edit_detailAddress").val('');
                     
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                 
                $("input#edit_pcode").val(data.zonecode);
                 
                
                $("input#edit_address").val(addr);
                
               
                
            }
        }).open();
        
        // 주소를 읽기전용(readonly) 로 만들기
        $("input#edit_address").attr("readonly", true);
        
        
        
		  
		  
	  }); 	
	  
	  
}); //end of $(document).ready(function()


function goEdit(){
	
	 
	const btn= $("input#btnAddVal").val();
	 
	if(btn=="push"){
		
		
		
		if($("input#familyname").val().trim() =="" ){
			
			alert("성을 입력하세요.");
		}
		else if($("input#lastname").val().trim() =="" ){
			alert("이름을 입력하세요.");
		}
		else if($("input#mb_tel").val().trim() =="" ){
			alert("전화번호를 입력하세요.");
		}
		else if($("input#edit_address").val() =="" ){
			alert("주소를 입력하세요.");
		}
		else{
			const frm= document.addressForm;
			frm.action= "addressBookAddEnd.gm";
			frm.method="post";
			frm.submit();
		}
		
		
	}
	else{
		alert("검색버튼을 통해 주소를 입력하세요.");
	}
	
}	