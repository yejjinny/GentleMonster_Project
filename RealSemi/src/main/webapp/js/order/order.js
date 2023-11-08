$(document).ready(function() {

	/* span.alert 태그 가리기 */
	$(document).find("span.alert").hide();

	/* 유저가 값을 수정했는지에 대해 체크하는 용도의 변수 */
	let isChanged = false;


	/* totalAmount 처리하기 */
	const totalAmount = $("span.totalAmount");
	totalAmount.html(" " + addComma(calculateAmount()) + "원 ");

	/* 배송비를 포함한 총 주문금액 설정하기 -> 배송비 관련 확인하고 수정하기 */
	const summaryPrice = $("span.checkout-summary-price");
	summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");

	/* 전화번호 숫자만 입력할 수 있도록한다 */
	$("input[type=tel]").keyup(function() {
		var replace_text = $(this).val().replace(/[^-0-9]/g, '');
		$(this).val(replace_text);
	});
	
	/* 유저가 인풋태그 값을 수정했을 경우 ----------------------------------------------*/
	$("input[type=text]").change(function() {

		// 수정했다는 의미로 true를 준다
		isChanged = true;

		// 새롭게 값이 변경되었기 때문에 addressBookId의 값을 ""로 바꾼다
		$("input[name='addressBookId']").val("");
	});

	$("input[type=tel]").change(function() {
		isChanged = true;
		$("input[name='addressBookId']").val("");
	});
	/* end of 유저가 인풋태그 값을 수정했을 경우 ----------------------------------------------*/

	/* 셀렉트리스트가 열려있는지 체크하는 용의 변수 / 열려있을 경우 = true, 닫혀있을 경우 = false */
	let openSelectList = false;

	/* 유저가 셀렉트리스트를 눌렀을 경우 */
	$("div.select").click(function() {

		if (openSelectList) {
			// 셀렉트리스트가 열려있다면

			// 다시 닫기
			openSelectList = false;
			$("ul.list").css("display", "none");
			$("div#target_select_address").addClass(" on");

		} else {
			// 셀렉트리스트가 닫혀있다면

			// 다시 열기
			openSelectList = true;
			$("ul.list").css("display", "block");
			$("div#target_select_address").removeClass(" on");
		}
	})


	/* 배송지 내용 삭제 버튼을 누를 경우 */
	$("button.delete_button").click(function() {

		// 배송주소, 우편번호 값 지우기 및 버튼 변경
		$("input[name='mb_address']").val("");
		$("input[name='mb_address_sub']").val("");
		$("input[name='mb_zipcode']").val("");
		$("button.search_button").css("display", "block");
		$("button.delete_button").css("display", "none");
	})


	/* 배송지 검색 버튼 누를 경우 */
	$("button.search_button").click(function() {

		// 배송주소, 우편번호에 대해서 읽기 전용 해제함
		$("input[name='mb_address']").removeAttr("readonly");
		$("input[name='mb_zipcode']").removeAttr("readonly");

		/* 카카오에서 제공한 우편번호로 주소 찾는 소스코드 --------------------------------------------------------------------*/
		new daum.Postcode({
			oncomplete: function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				let addr = ''; // 주소 변수
				let extraAddr = ''; // 참고항목 변수

				// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				$("input[name='mb_zipcode']").val(data.zonecode);
				$("input[name='mb_address']").val(addr + extraAddr);

				// 커서를 상세주소 필드로 이동한다.
				$("input[name='mb_address_sub']").focus();

				// 주소를 읽기전용(readonly) 로 만들기
				$("input[name='mb_zipcode']").attr("readonly", true);

				// 참고항목을 읽기전용(readonly) 로 만들기
				$("input[name='mb_address']").attr("readonly", true);

				// 버튼을 수정한다
				$("button.search_button").css("display", "none");
				$("button.delete_button").css("display", "block");


			}
		}).open();
		/* end of 카카오에서 제공한 우편번호로 주소 찾는 소스코드 ----------------------------------------------------------------*/
	})


	/* 다음 단계로 버튼 눌렀을 경우 */
	$("button#go_to_payment").click(function() {

		// 필수 사항 입력 체크용 / true = 입력에 문제가 없다, false = 입력에 문제가 있다
		let check = true;


		$("form#shipping-form").find("input[type=text]").each(function(index, item) {

			// 아무값없이 띄어쓰기만 있을 때도 빈 값으로 체크되도록 trim() 함수 호출
			if ($(this).val().trim() == '') {
				// 빈 값일 경우

				if ($(this).attr('id') == 'mb_addr-1') {
					// 태그가 배송주소일 경우 에러 내용 표시
					$(this).parent().parent().parent().find("span.alert").show();
				} else {
					// 그 외의 태그에 대한 에러 내용 표시
					$(this).parent().find("span.alert").show();
				}

				check = false;

			} else {
				// 값이 입력되어 있을 경우

				if ($(this).attr('id') == 'mb_addr-1') {
					// 태그가 배송주소일 경우 에러 내용 숨기기
					$(this).parent().parent().parent().find("span.alert").hide();

				} else {
					// 그 외의 태그에 대한 에러 내용 숨기기
					$(this).parent().find("span.alert").hide();
				}
			}
		}); // end of $("form#shipping-form").find("input[type=text]").each(function(index, item) --------------------


		/* 전화번호가 빈 값인지 확인 _ type = tel */
		if ($("input[name='mb_hp']").val().trim() == '') {
			// 전화번호가 빈 값일 경우 에러 내용 보이기
			$("input[name='mb_hp']").parent().find("span.alert").show();
			check = false;
		} else {
			// 전화번호가 입력되어 있을 경우 에러 내용 숨기기
			$("input[name='mb_hp']").parent().find("span.alert").hide();
		}

		/* 필수 체크사항 체크 확인 */
		if (!$("input[name='privacy_policy']").is(':checked')) {
			// 필수 체크사항 체크 안 되어있을 경우 에러용 클래스를 생성한다
			$("input[name='privacy_policy']").parent().parent().addClass(" has-error");
			check = false;
		} else {
			// 필수 체크사항 체크 되어있을 경우 에러용 클래스를 삭제한다
			$("input[name='privacy_policy']").parent().parent().removeClass(" has-error");
		}

		/* 유저가 인풋 태그 값을 변경했는지 확인 */
		if (isChanged) {
			// 변경 했을 경우
			$("input[name='change_address']").val(1);
		} else {
			// 변경 하지 않았을 경우
			$("input[name='change_address']").val(0);
		}


		/* 필수 입력 사항이 다 통과되었는지 확인 */
		if (check) {
			// 문제 없는 경우 form을 submit한다

			const frm = document.shippingFrm;
			frm.action = "orderPayment.gm";
			frm.method = "post"
			frm.submit();
		}

	}) // end of $("button#go_to_payment").click(function(){}) ----------------------------------------------------------------------------------------


})

/* 유저가 셀렉트리스트에서 주소를 선택했을 경우 */
function clickAddress(addressBookId) {

	// 셀렉트리스트에서 선택한 주소의 주소정보를 가져온다
	$.ajax({
		url: "orderAddress.gm",
		data: { "addressBookId": addressBookId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(addressOne) {

			// 유저가 선택한 주소의 주소정보로 변경한다
			$("input[name='addressBookId']").val(addressOne.addressbookId);
			$("input[name='mb_lname']").val(addressOne.familyName);
			$("input[name='mb_fname']").val(addressOne.lastName);
			$("input[name='mb_hp']").val(addressOne.tel);
			$("input[name='mb_zipcode']").val(addressOne.postCode);
			$("input[name='mb_address']").val(addressOne.address);
			$("input[name='mb_address_sub']").val(addressOne.detailAddress);
			$("div.select").html(addressOne.address);

			// 버튼 변경
			$("button.search_button").css("display", "none");
			$("button.delete_button").css("display", "block");

			// 클릭 이벤트 발생시켜 셀렉트리스트 접히도록 만들기
			$("div.select").trigger("click");
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});

}; // end of function clickAddress(addressBookId) --------------------------------------------------------------------------------------



/* 총 금액 계산하는 거 */
function calculateAmount() {
	let amount = 0;
	$("input[name='sell_price_total']").each(function() {
		amount += parseInt($(this).val());
	});
	return amount;
} // end of function calculateAmount() -----------------------------------------------------


/* 3자리마다 콤마찍기 */
function addComma(value) {
	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
} // end of function addComma(value) -------------------------------------------------------