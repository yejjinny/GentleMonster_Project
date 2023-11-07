function cancelOrder(orderId){
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	
	// 선택한 주문내용을 취소한다
	$.ajax({
		url: contextPath + "order/orderCancel.gm",
		data: { "orderId": orderId },
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			if(text.isUpdate){
				// 주문이 취소되었다면
				
				alert("주문이 취소되었습니다.");
				$("div.order-status").html("상태: 주문취소")
				$("div.items-button").hide();
			}else{
				alert("취소 실패!");
			}
			
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
	
}