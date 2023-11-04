$(document).ready(function() {
	
	
	$("button.action").click(function(){
		
		const frm = document.orderDetailFrm;
		frm.action = "orderDetail.gm";
		frm.method = "post"
		frm.submit();
		
	})

});