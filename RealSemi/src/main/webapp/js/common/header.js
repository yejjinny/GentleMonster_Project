
$(document).ready(function() {
	
	
	
	/* 쇼핑백 모달 화면 위한 처리 ------------------------------------------------------*/

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* totalAmount 처리하기 */
	const totalAmount = $("span.cart_amount");
	totalAmount.html(" " + addComma(calculaterAmount()) + "원 ");




	/* 검색어 입력시 */
	$("input[name='search']").keydown(function(e) {
		// 검색어 입력란에 엔터를 했을 경우 
		if (e.keyCode == 13) {
			$("button.searchBtn").trigger("click");
		}
	});


	/* 결제하기 버튼 클릭시 */
	$("button.cartOrderBtnHeader").click(function() {
		// 결제하기 버튼이 눌렸을 때 주문관련 컨트롤로 연결

		$(location).attr("href", contextPath + "order/orderAddress.gm");

	});



	$(document).on("change", "input.input_qty", function() {
		//수량 변화시 값도 변경되어야한다 
		$("span.cartItemTotalPrice").each(function() {
			let id = $(this).attr("id")
			let cartId = Number(id.substr("mini_cart_item_total_price".length, id.length));
			let price = Number($("input#primeCost" + cartId).val());
			let quantity = $("input#cartQuantity" + cartId).val();

			$(this).html(addComma(price * quantity) + "원");

			$("input#price" + cartId).val(price * quantity);


		})

		//totalAmount 처리하기 
		const cartAmount = $("span.cart_amount");
		cartAmount.html(" " + addComma(calculaterAmount()) + "원 ");

	})
	/* end of 쇼핑백 모달 화면 위한 처리 -----------------------------------------------*/


	/* 검색창 모달 화면 위한 처리 ------------------------------------------------------*/
	
	// 최근 검색어 값을 가져온다
	let html = ``;
	let searchKeywordList = JSON.parse(localStorage.getItem("searchKeywordList"));
		
	if (typeof searchKeywordList != 'undefined' && searchKeywordList != null && searchKeywordList.length != 0){
		// 최근 검색어 값이 존재할 경우
		
		for(let i = 0 ; i < searchKeywordList.length ; i++){
			html += `<li class="keywordHistory_item">
				<a href="` + contextPath + `common/searchKeyword.gm?search=` + searchKeywordList[i] + `" class="font--kr font--14 font--md">` + searchKeywordList[i] + `</a>
			</li>`;
		}
		
		$("ul#keywordHistory__list").html(html);
	}
	

	$("button.searchBtn").click(function() {
		let searchWord = $("input#search").val().trim();
		let isCheck = true;
		let searchKeywordList = JSON.parse(localStorage.getItem("searchKeywordList"));
		
		
		if (typeof searchKeywordList == 'undefined' || searchKeywordList == null || searchKeywordList.length == 0){
			// 최근 검색값이 없을 경우
			
			isCheck = false;
			
			searchKeywordList = [];
			searchKeywordList.push(searchWord);
			
		}else{
			// 최근 검색값이 있을 경우
			for(let i = 0 ; i < searchKeywordList.length ; i++){
				if(searchKeywordList[i] == searchWord){
					// 이미 같은 검색어 값이 저장되어 있을 경우
					isCheck = false;
					break;
				}
			}
			
		}
		
		if(isCheck) {
			// 검색 모달창에서 보여줄 최근 검색어를 저장한다 
			if (searchKeywordList.length >= 8) {
				// 최대 기록할 수 있는 검색량은 9개까지라 맨 처음에 검색했던 값을 지운다
				searchKeywordList.shift();
			}
			// 검색어를 저장한다
			searchKeywordList.push(searchWord);
			
		}
		// localStorage에 최근 검색어를 저장한다.
		localStorage.setItem("searchKeywordList", JSON.stringify(searchKeywordList));
		
		
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		const contextPath = origin + pathname;
		const frm = document.searchFrm;

		frm.action = contextPath + `common/searchKeyword.gm`;
		frm.method = "get";
		frm.submit();

	})
	/* end of 검색창 모달 화면 위한 처리 -----------------------------------------------*/




});// end of $(document).ready(function(){})------------------





/* 쇼핑백 모달 화면 관련 -----------------------------------------------------------------------------------------------------------*/

/* 쇼핑백 모달에서 삭제하기 버튼을 눌렀을 경우 */
function goDeleteModal(cartId) {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	$.ajax({
		url: contextPath + "cart/deleteCartItem.gm",
		data: { "cartId": cartId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isDelete) {
				// true일 경우 = 삭제처리가 완료되었을경우
				alert("삭제 성공! 원래 화면으로 돌아갑니다");
				location.reload();
			} else {
				// false일 경우 = 삭제되지 않았을 경우
				alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
			}
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
};


/* 쇼핑백 모달에서 아이템 수량을 수정하였을 경우 */
function goUpdateModal(cartId, action) {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	let qty = $('input#cartQuantity' + cartId).val();

	// 현재의 수량이 1인데 빼려고 했을 경우
	if (qty == 1 && action == "subtract") {
		alert("수량이 1보다 작을 수 없습니다.\n삭제는 삭제하기 버튼을 눌러주세요.")
		return;
	}

	// 선택한 카트 상품의 수량을 수정한다
	$.ajax({
		url: contextPath + "cart/updateCartQty.gm",
		data: { "cartId": cartId, "action": action },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isUpdate) {
				// true일 경우 = 업데이트 처리가 완료되었을경우

				/* 수량 변화 시킴 */
				$('input#cartQuantity' + text.cartId).val(text.quantity);

				/* 수량 변화시 값도 변경되어야한다 */
				$('input#price' + text.cartId).val(text.price * text.quantity);
				$('span#mini_cart_item_total_price' + text.cartId).html(addComma(text.price * text.quantity) + "원");


				/* totalAmount 처리하기 */
				const cartAmount = $("span.cart_amount");
				cartAmount.html(" " + addComma(calculaterAmount()) + "원 ");




				/* 총 수량 구하기 */
				let totalQty = 0;
				$($('input.input_qty')).each(function() {
					totalQty += Number($(this).val());
				})
				$("span.cart-count").html(totalQty)



				/* cart.jsp 수정*/
				if ($("input#cartTotalPrice" + cartId).length != 0) {
					$("input#cartTotalPrice" + cartId).val(text.price * text.quantity);
					$("span#cartTotalPriceSpan" + cartId).html(addComma(text.price * text.quantity) + "원");

					/* totalAmount 처리하기 */
					const totalAmount = $("span.totalAmount");
					totalAmount.html(" " + addComma(calculateAmount()) + "원 ");

					/* 배송비를 포함한 총 주문금액 설정하기 -> 배송비 관련 확인하고 수정하기 */
					const summaryPrice = $("span.checkout-summary-price");
					summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");

				}


			} else {
				//false일 경우 = 삭제되지 않았을 경우

				alert("수량 변경 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
			}
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
};



function calculaterAmount() {
	/* 총 금액 계산하는 거 */

	let amount = 0;
	$("input[name='price_total']").each(function() {
		amount += parseInt($(this).val());
	});
	return amount;
}


function addComma(value) {
	/* 3자리마다 콤마찍기 */

	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
}

/* 총 금액 계산하는 거 */
function calculateAmount() {
	let amount = 0;

	$("input[name='sell_price_total']").each(function() {
		amount += parseInt($(this).val());
	});
	return amount;
} // end of function calculateAmount() --------------------------------------------------

/* end of 쇼핑백 모달 화면 관련 ----------------------------------------------------------------------------------------------------------*/