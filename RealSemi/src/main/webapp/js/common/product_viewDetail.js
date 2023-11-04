$(document).ready(function() {
	// 제품 세부정보가 클릭되어져 있는지를 확인한다 _ 초기상태 열려있어서 true로 설정
	let detailInfoTop_clickCheck = true;

	// 배송 & 반품이 클릭되어져 있는지를 확인한다 _ 초기상태 닫혀있어서 false로 설정
	let ShipInfoTop_clickCheck = false;

	/* 제품 세부정보를 클릭하였을 경우 */
	$("div.productDetailInfoTop").click(function() {
		if (detailInfoTop_clickCheck == true) {
			// 이미 열려져 있었을 경우 닫아준다

			$("div.productDetailInfoTop").addClass(" on");
			$("div.productDetailInfo").css("display", "none");
			$("div.productDetailArrow").removeClass("n-arrow--up");
			$("div.productDetailArrow").addClass("n-arrow--down");

			detailInfoTop_clickCheck = false;
		} else {
			// 이미 닫혀져 있을 경우 열어준다

			$("div.productDetailInfoTop").removeClass(" on");
			$("div.productDetailInfo").css("display", "block");
			$("div.productDetailArrow").removeClass("n-arrow--down");
			$("div.productDetailArrow").addClass("n-arrow--up");
			detailInfoTop_clickCheck = true;

		}

	});




	/* 배송 & 반품을 클릭하였을 경우 */
	$("div.shipInfoTop").click(function() {
		if (ShipInfoTop_clickCheck == true) {
			// 이미 열려져 있었을 경우 닫아준다

			$("div.shipInfoTop").addClass(" on");
			$("div.shipInfo").css("display", "none");
			$("div.shipInfoArrow").removeClass("n-arrow--up");
			$("div.shipInfoArrow").addClass("n-arrow--down");

			ShipInfoTop_clickCheck = false;
		} else {
			// 이미 닫혀져 있을 경우 열어준다

			$("div.shipInfoTop").removeClass(" on");
			$("div.shipInfo").css("display", "block");
			$("div.shipInfoArrow").removeClass("n-arrow--down");
			$("div.shipInfoArrow").addClass("n-arrow--up");
			ShipInfoTop_clickCheck = true;

		}
	});

	/*$("input.input_qty").change(function() {
		console.log("hello")
		 수량 변화시 값도 변경되어야한다 
		$('input#price' + text.cartId).val(text.price * text.quantity);
		$('span#mini_cart_item_total_price' + text.cartId).html(addComma(text.price * text.quantity) + "원");


		 totalAmount 처리하기 
		const cartAmount = $("span.cart_amount");
		cartAmount.html(" " + addComma(calculaterAmount()) + "원 ");

	})*/

	/* 쇼핑백 추가 버튼을 눌렀을 경우 */
	$("button.addCart").click(function() {
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		const contextPath = origin + pathname;


		const frm = document.addCartItemFrm;
		frm.action = contextPath + "cart/addCartItem.gm";
		frm.method = "post"
		frm.submit();

		/*$("span.cart-count").html(Number($("span.cart-count").html()) + 1);
		$("input.input_qty").val(Number($("span.cart-count").html()))*/

		//goUpdateModal($("input[name='cartId']").val(),"add");

	})




});// end of $(document).ready(function(){})------------------

/*function reloadShoppigBag(){  
	  $("#searchModal").load(location.href + "#searchModal");
	  $("#cartIcon").load(location.href + "#cartIcon");
}
*/
/*function addCart(productDetailId) {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	$.ajax({
		url: contextPath + "cart/deleteCartItem.gm",
		data: { "productDetailId": productDetailId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isAdd) {
				// true일 경우 = 추가처리가 완료되었을경우
				let result = confirm('상품이 정상적으로 쇼핑백에 추가되었습니다.\n쇼핑백으로 이동하시겠습니까?');

				if (result) {
					//yes
					location.replace(contextPath + 'cart/cart.gm');
				}
			} else {
				alert('로그인 후 이용해주세요')
			}
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});

};*/