$(document).ready(function() {
	// 검색가기 전 필수입력 체크용 변수
	let check = true;


	$("input[name='searchMemberInput']").keydown(function(e) {
		// 검색어 입력란에 엔터를 했을 경우 
		if (e.keyCode == 13) {
			$("button.searchMemberBtn").trigger("click");
		}
	})


	$("select[name='searchCategory']").change(function() {
		// 유저가 선택한 셀렉트값이 변경된다면
		
		if ($("select[name='searchCategory']").val() == "gender") {
			// 유저가 선택한 셀렉트값이 성별이라면
			$("input[name='searchMemberInput']").attr("placeholder", "남성, 여성, 선택 안함 중 입력해주세요");
		}

		if ($("select[name='searchCategory']").val() == "isDeleted") {
			// 유저가 선택한 셀렉트값이 성별이라면
			$("input[name='searchMemberInput']").attr("placeholder", "정상, 탈퇴 중 입력해주세요");
		}

	})


	/* 검색하기 아이콘이 눌렸을 경우 */
	$("button.searchMemberBtn").click(function() {

		if ($("select[name='searchCategory']").val() == "") {
			// 셀렉트 박스에서 전체를 클릭하였을 경우

			alert("검색하실 컬럼명을 선택하십시오.")
			check = false;
			return;
		}


		if ($("select[name='searchCategory']").val() == "gender") {
			// 유저가 선택한 셀렉트값이 성별이라면

			let value = $("input[name='searchMemberInput']").val();

			if (value != "남성" && value != "여성" && value != "선택 안함") {

				alert("남성, 여성, 선택 안함 중에서 입력하여 주세요")
				check = false;
			}
		} else if ($("select[name='searchCategory']").val() == "isDeleted") {
			// 유저가 선택한 셀렉트값이 탈퇴여부라면

			let value = $("input[name='searchMemberInput']").val();

			if (value != "정상" && value != "탈퇴") {

				alert("정상, 탈퇴 중에서 입력하여 주세요")
				check = false;
			}
		}


		if ($("input[name='searchMemberInput']").val().trim() == "") {
			// 검색어를 입력하지 않았다면

			alert("검색어를 입력해주십시오.")
			check = false;
		}

		if (check) {
			const pathname = "/" + window.location.pathname.split("/")[1] + "/";
			const origin = window.location.origin;
			const contextPath = origin + pathname;

			const frm = document.searchMemberFrm;
			frm.action = contextPath + `admin/memberList.gm`;
			frm.method = "get";
			frm.submit();
		}

	})

});