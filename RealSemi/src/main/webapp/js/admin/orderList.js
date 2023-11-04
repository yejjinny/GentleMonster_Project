$(document).ready(function() {
	// 검색가기 전 필수입력 체크용 변수
	let check = true;


	$("input[name='searchOrderInput']").keydown(function(e) {
		// 검색어 입력란에 엔터를 했을 경우 
		if (e.keyCode == 13) {
			$("button.searchOrderBtn").trigger("click");
		}
	})


	$("select[name='searchCategory']").change(function() {
		// 유저가 선택한 셀렉트값이 변경된다면
		
		if ($("select[name='searchCategory']").val() == "orderDay") {
			// 유저가 선택한 셀렉트값이 주문일자라면
			$("input[name='searchOrderInput']").attr("placeholder", "yyyy/mm/dd로 입력하여주십시오");
		}


	})


	/* 검색하기 아이콘이 눌렸을 경우 */
	$("button.searchOrderBtn").click(function() {

		if ($("select[name='searchCategory']").val() == "") {
			// 셀렉트 박스에서 전체를 클릭하였을 경우

			alert("검색하실 컬럼명을 선택하십시오.")
			check = false;
		}


		if ($("select[name='searchCategory']").val() == "orderDay") {
			// 유저가 선택한 셀렉트값이 성별이라면

			let value = $("input[name='searchOrderInput']").val();
			
			const regExp = new RegExp(/^\d{4}\/(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])$/); 
	    
	    	if(!regExp.test(value)){
				// 잘못된 형식으로 입력하였을 경우
				
				alert("날짜 형식은 'yyyy/mm/dd' 형식으로 입력하여주십시오")
				check = false;
			}
			
		}


		if ($("input[name='searchOrderInput']").val().trim() == "") {
			// 검색어를 입력하지 않았다면

			alert("검색어를 입력해주십시오.")
			check = false;
		}

		if (check) {
			const pathname = "/" + window.location.pathname.split("/")[1] + "/";
			const origin = window.location.origin;
			const contextPath = origin + pathname;
			
			const frm = document.searchMemberFrm;
			frm.action = contextPath + `admin/orderList.gm`;
			frm.method = "get";
			frm.submit();
		}

	})

});