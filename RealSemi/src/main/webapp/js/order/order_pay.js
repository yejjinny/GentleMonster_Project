$(document).ready(function() {
	/* totalAmount 처리하기 */
	const totalAmount = $("span#product_total_price");
	totalAmount.html(" " + addComma(calculateAmount()) + "원 ");

	/* 배송비를 포함한 총 주문금액 설정하기 */
	const summaryPrice = $("span.totalAmountIncludeShip");
	summaryPrice.html(" " + addComma(calculateAmount()) + "원 ");

	/* 다음 단계로 버튼 눌렀을 경우 */
	$("button#go_to_payment").click(function() {

		/* 필수 체크사항 체크 확인 */
		if (!$("input[name='privacy_policy']").is(':checked')) {
			// 필수 체크사항 체크 안 되어있을 경우 에러 관련 클래스 생성
			$("input[name='privacy_policy']").parent().parent().addClass(" has-error");

		} else {
			// 필수 체크사항 체크 되어있을 경우 에러 관련 클래스 삭제 및 결제 팝업창 로딩
			$("input[name='privacy_policy']").parent().parent().removeClass(" has-error");
			
			const pathname = "/" + window.location.pathname.split("/")[1] + "/";
			const origin = window.location.origin;
			const contextPath = origin + pathname;

			//결제창 보여주기용
			// 포트원(구 아임포트) 결제 팝업창 띄우기 
			const url = contextPath + `order/orderPaymentGateway.gm`;

			// 너비 1000, 높이 600 인 팝업창을 화면 가운데 위치시키기
			const width = 1000;
			const height = 600;

			const left = Math.ceil((window.screen.width - width) / 2);  // 정수로 만듬 
			const top = Math.ceil((window.screen.height - height) / 2); // 정수로 만듬
			window.open(url, "orderPaymentGateway",
				`left=${left}, top=${top}, width=${width}, height=${height}`);
		}
	}) // end of $("button#go_to_payment").click(function() {} ----------------------------------------------------
});


/* 총 금액 계산하는 거 */
function calculateAmount() {
	
	let amount = 0;

	$("input[name='sell_price_total']").each(function() {
		amount += parseInt($(this).val());
	});

	return amount;
} // end of function calculateAmount() -------------------------------------------------


/* 3자리마다 콤마찍기 */
function addComma(value) {
	
	value = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	return value;
} // end of function addComma(value) ---------------------------------------------------


/* 결제완료 후 DB인서트 용 */
function goOrder_DB_Update() {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	const frm = document.orderCompleteFrm;
	frm.action = contextPath + "order/orderEndAction.gm";
	frm.method = "post";
	frm.submit();
} // end of function goOrder_DB_Update() ----------------------------------------------


