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

	/* 쇼핑백 추가 버튼을 눌렀을 경우 */
	$("button.addCart").click(function() {
		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		const contextPath = origin + pathname;


		const frm = document.addCartItemFrm;
		frm.action = contextPath + "cart/addCartItem.gm";
		frm.method = "post"
		frm.submit();


	})


});// end of $(document).ready(function(){})------------------

