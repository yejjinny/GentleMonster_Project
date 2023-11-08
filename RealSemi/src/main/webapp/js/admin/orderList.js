$(document).ready(function() {



	$("button.goUpdate").click(function() {
		// 주문현황 수정하기 버튼을 눌렀을 경우

		let orderStatus = $("span.realOrderStatus").html();
		let updateOrderStatus = $("input[name='orderStatus']:checked").next().html();

		if ($("input[name='orderStatus']").is(':checked')) {
			const frm = document.updateOrderStatusFrm;
			frm.action = contextPath + `/order/updateOrderStatus.gm`;
			frm.method = "post";
			frm.submit();
		} else {
			alert("업데이트할 주문현황을 선택하세요")
		}


	})

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
			$("input[name='searchOrderInput']").attr("placeholder", "ex) yyyy/mm/dd");
		}


	})


	/* 검색하기 아이콘이 눌렸을 경우 */
	$("button.searchOrderBtn").click(function() {
		// 검색가기 전 필수입력 체크용 변수
		let check = true;
		
		if ($("select[name='searchCategory']").val() == "") {
			// 셀렉트 박스에서 전체를 클릭하였을 경우

			alert("검색하실 컬럼명을 선택하십시오.")
			check = false;
		}

		if ($("select[name='searchCategory']").val() == "orderDay") {
			// 유저가 선택한 셀렉트값이 성별이라면

			let value = $("input[name='searchOrderInput']").val();

			const regExp = new RegExp(/^\d{4}\/(0[1-9]|1[012])\/(0[1-9]|[12][0-9]|3[01])$/);

			if (!regExp.test(value)) {
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
		} else {
			//$(location).prop("href", location.href);
			//location.href = contextPath + "admin/orderList.gm";
		}

	})









	/* contextPath 생성용 */
	const pathname = "/" + window.location.pathname.split("/")[1];
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	/* end of contextPath 생성용 */

	const tbodyHtml = $("div.order_product tbody").html();

	/* 주문 상세보기용 */
	$("tbody tr").each(function() {

		$(this).click(function() {

			$.ajax({
				url: contextPath + "/admin/orderDetail.gm",
				data: { "orderId": $(this).find("td").html() },
				type: "post",
				async: true,
				dataType: "json",
				success: function(text) {

					$("div.id_order p").html("주문번호 #" + text.orderId);
					$("input[name='orderId']").val(text.orderId);
					$("div.email p.value").html(text.email);

					if (text.orderStatus == "주문취소") {
						$("div.inputRadioOrderStatus").hide();
					} else {
						$("div.inputRadioOrderStatus").show();
					}
					$("div.currentOrderStatus").html("현재 : <span class='realOrderStatus'>" + text.orderStatus + "</span>");
					$("div.address p.value").html(text.name + `<br>` + text.address + ` ` + text.detailAddress + `<br>` + ` ` + text.postCode);
					$("div.phonenumber p.value").html(text.tel);

					let html = tbodyHtml;
					for (let i = 0; i < text.orderDetailList.length; i++) {
						html +=
							`<tr class="font--kr font--13 font--md order_line_height" style="vertical-align: top;">
								<td class="item">
									<img src="` + contextPath + text.orderDetailList[i]['mainImageFile'] + `" alt="">
								</td>
								<td class="item product font--kr font--13 font--bd order_line_height">` + text.orderDetailList[i]['productName'] + `</td>
								<td class="item price font--kr font--13 font--md order_line_height" style="padding-left: 4px;">
									` + addComma(Number(text.orderDetailList[i]['price'])) + ` 원
								</td>
								<td class="item qty font--kr font--13 font--md order_line_height" style="padding-left: 10px;">` + text.orderDetailList[i]['quantity'] + `</td>
								<td class="item subtotal font--kr font--13 font--md order_line_height">
									` + addComma(Number(text.orderDetailList[i]['price']) * Number(text.orderDetailList[i]['quantity'])) + ` 원
								</td>
							</tr>`


					}
					$("div.order_product tbody").html(html);

					$("li.field_summary:first-child span.value").html(addComma(Number(text.amount)) + ` 원`);
					$("li.field_summary:last-child span.value").html(addComma(Number(text.amount)) + ` 원`);


				},
				error: function(request, status, error) {
					alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
				}
			});


		})





	})

});