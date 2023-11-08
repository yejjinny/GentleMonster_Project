$(document).ready(function() {

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
			$("input[name='searchMemberInput']").attr("placeholder", "ex) 남성, 여성, 선택 안함");
		}

		if ($("select[name='searchCategory']").val() == "isDeleted") {
			// 유저가 선택한 셀렉트값이 성별이라면
			$("input[name='searchMemberInput']").attr("placeholder", "ex) 정상, 탈퇴");
		}

	})


	/* 검색하기 아이콘이 눌렸을 경우 */
	$("button.searchMemberBtn").click(function() {
		// 검색가기 전 필수입력 체크용 변수
		let check = true;

		if ($("select[name='searchCategory']").val() == "") {
			// 셀렉트 박스에서 전체를 클릭하였을 경우

			alert("검색하실 컬럼명을 선택하십시오.")
			check = false;
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














	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */

	const tbodyHtml = $("div.order_product tbody").html();

	/* 회원 상세보기용 */
	$("tbody tr").each(function() {

		$(this).click(function() {

			$.ajax({
				url: contextPath + "/admin/memberDetail.gm",
				data: { "memberId": $(this).find("td").html() },
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {

					$("div.id_member p").html("회원고유번호 #" + text.memberId);
					$("div.fullName p.value").html(text.name);
					$("div.email p.value").html(text.email);
					$("div.birth p.value").html(text.birth);
					$("div.gender p.value").html(text.gender);
					$("div.registerDay p.value").html(text.registerDay);

				},
				error: function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});


		})


	})

});