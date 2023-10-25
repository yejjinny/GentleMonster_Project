
$(document).ready(function() {
	/* 쇼핑백 모달 화면 위한 처리 ------------------------------------------------------*/

	getCartList();

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* totalAmount 처리하기 */
	const totalAmount = $("span.cart_amount");
	totalAmount.html(" " + addComma(calculateAmount()) + "원 ");




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
	/* end of 쇼핑백 모달 화면 위한 처리 -----------------------------------------------*/


	/* 검색창 모달 화면 위한 처리 ------------------------------------------------------*/

	$("button.searchBtn").click(function() {
		const frm = document.searchFrm;
		frm.action = contextPath + `common/searchKeyword.gm`;
		frm.method = "get";
		frm.submit();

	})
	/* end of 검색창 모달 화면 위한 처리 -----------------------------------------------*/




});// end of $(document).ready(function(){})------------------





/* 쇼핑백 모달 화면 관련 -----------------------------------------------------------------------------------------------------------*/


/* 쇼핑백 정보를 가져오는 함수*/
function getCartList() {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* 쇼핑백 상품정보를 가져온다 */
	$.ajax({
		url: contextPath + "cart/cart.gm",
		type: "post",
		async: true,
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});

}


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
function goUpdateModal(cartId, qty, action) {

	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

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

				$('input#cartQuantity' + text.cartId).val(text.quantity);

				/* 유저의 카트 안에 있는 상품들의 총 수량 */
				let quantity = 0;
				$("div.headerCart input.input_qty").each(function() {
					quantity += parseInt($(this).val());
				});
				$("span.cart-count").html(quantity);

				/* 수량 변화시 값도 변경되어야한다 */
				let price = $('input#cartPrice' + text.cartId).val();
				$('input#cartTotalPrice' + text.cartId).val(price * text.quantity);
				$('span#cartTotalPriceSpan' + text.cartId).html(addComma($('input#cartTotalPrice' + text.cartId).val()) + "원");

				/* totalAmount 처리하기 */
				const totalAmount1 = $("span.cart_amount");
				const totalAmount2 = $("span.totalAmount");
				totalAmount1.html(" " + addComma(calculateAmount()) + "원 ");
				totalAmount2.html(" " + addComma(calculateAmount()) + "원 ");

				/* 배송비를 포함한 총 주문금액 설정하기 -> 배송비 관련 확인하고 수정하기 */
				const summaryPrice = $("span.checkout-summary-price");
				summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");

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



function calculateAmount() {
	/* 총 금액 계산하는 거 */

	let amount = 0;
	$("input[name='sell_price_total']").each(function() {
		amount += parseInt($(this).val());
	});
	return amount;
}


function addComma(value) {
	/* 3자리마다 콤마찍기 */

	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
}

/* end of 쇼핑백 모달 화면 관련 ----------------------------------------------------------------------------------------------------------*/