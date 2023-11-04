

$(document).ready(function() {
/*	
	 결제하기 버튼 클릭시 
	$("button.product__wish__btn").click(function() {
		// 결제하기 버튼이 눌렸을 때 주문관련 컨트롤로 연결

		goDelete($(wishVo.wishId));

	}); // end of $("button.cartOrderBtn").click(function(){}) -----------------------

	*/

	


	

	


});// end of $(document).ready(function(){})------------------



/* 삭제하기 버튼 눌렀을 경우 */
function goDelete(wishId) {
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	/* 선택한 카트 상품을 삭제한다 */
	$.ajax({
		url: contextPath + "wish/deleteWishItem.gm",			
		data: { "wishId": wishId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if (text.isDelete) {
				// true일 경우 = 삭제처리가 완료되었을경우
				
				$(location).attr("href", contextPath + "wish/wish.gm");
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



/* 화폐 세 자리마다 콤마 표시 (#,###) */
function addComma(value) {
	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
} // end of function addComma(value) ----------------------------------------------------