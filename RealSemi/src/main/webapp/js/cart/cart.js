$(document).ready(function() {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* totalAmount 처리하기 */
	const totalAmount = $("span.totalAmount");
	totalAmount.html(" " + addComma(calculateAmount()) + "원 ");

	/* 배송비를 포함한 총 주문금액 설정하기 -> 배송비 관련 확인하고 수정하기 */
	const summaryPrice = $("span.checkout-summary-price");
	summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");



	/* 결제하기 버튼 클릭시 */
	$("button.cartOrderBtn").click(function() {
		// 결제하기 버튼이 눌렸을 때 주문관련 컨트롤로 연결

		if ($("div.stockCheck").html() == '품절') {
			alert("재고가 없는 상품을 삭제하고 주문해주십시오")
		} else {
			/* 재고가 0인 상품이 없을 경우 */
			
			/* redirect */
			$(location).attr("href", contextPath + "order/orderAddress.gm");
		}
	}); // end of $("button.cartOrderBtn").click(function(){}) -----------------------


});// end of $(document).ready(function(){})------------------



/* 삭제하기 버튼 눌렀을 경우 */
function goDelete(cartId) {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* 선택한 카트 상품을 삭제한다 */
	$.ajax({
		url: contextPath + "cart/deleteCartItem.gm",
		data: { "cartId": cartId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isDelete) {
				// true일 경우 = 삭제처리가 완료되었을경우

				$(location).attr("href", contextPath + "cart/cart.gm");
			} else {
				// false일 경우 = 삭제되지 않았을 경우

				alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
			}
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
}; // end of function goDelete(cartId) --------------------------------------------------------------------------------------------


/* 쇼핑백 아이템 수량 수정 액션 */
function goUpdate(cartId, action) {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	let qty = $('input#cartQuantity' + cartId).val();

	/* 현재의 수량이 1인데 빼려고 했을 경우 */
	if (qty == 1 && action == "subtract") {
		alert("수량이 1보다 작을 수 없습니다.\n삭제는 삭제하기 버튼을 눌러주세요.")
		return;
	}

	/* 선택한 카트 상품의 수량을 업데이트한다 */
	$.ajax({
		url: contextPath + "cart/updateCartQty.gm",
		data: { "cartId": cartId, "action": action },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isUpdate) {
				// true일 경우 = 업데이트 처리가 완료되었을경우

				// 유저가 업데이트한 상품의 수량
				$('input#cartQuantity' + text.cartId).val(text.quantity);

				// 유저의 카트 안에 있는 상품들의 총 수량
				let quantity = 0;
				$("td.sod_name input.input_qty").each(function() {
					quantity += parseInt($(this).val());
				});
				$("span.cart-count").html(quantity);


				// 수량 변화시 수량에 따른 가격도 변경되어야한다
				let price = $('input#cartPrice' + text.cartId).val();
				$('input#cartTotalPrice' + text.cartId).val(price * text.quantity);
				$('span#cartTotalPriceSpan' + text.cartId).html(addComma($('input#cartTotalPrice' + text.cartId).val()) + "원");


				/* totalAmount 처리하기 */
				const totalAmount = $("span.totalAmount");
				totalAmount.html(" " + addComma(calculateAmount()) + "원 ");

				/* 배송비를 포함한 총 주문금액 설정하기 -> 배송비 관련 확인하고 수정하기 */
				const summaryPrice = $("span.checkout-summary-price");
				summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");
				
				$("input.input_qty").trigger("change");
				
				
				
			} else {
				// false일 경우 = 삭제되지 않았을 경우
				alert("수량 변경 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
			}
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
	
	
}; // end of function goUpdate(cartId, qty, action) -------------------------------------------------------------------------------------------------------


/* 총 금액 계산하는 거 */
function calculateAmount() {
	let amount = 0;

	$("input[name='sell_price_total']").each(function() {
		amount += parseInt($(this).val());
	});
	return amount;
} // end of function calculateAmount() --------------------------------------------------


/* 3자리마다 콤마찍기 */
function addComma(value) {
	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
} // end of function addComma(value) ----------------------------------------------------