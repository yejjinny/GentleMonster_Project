
$(document).ready(function() {



	// 필터모달창 전송하기 -----------------------------------------------*/

	$("button#filterSubmitBtn").click(function() {

		const pathname = "/" + window.location.pathname.split("/")[1] + "/";
		const origin = window.location.origin;
		const contextPath = origin + pathname;

		const frm = document.filterFrm;
		frm.action = contextPath + "product/product.gm";
		frm.method = "post";
		frm.submit();
		/*alert("확인 !!");*/
	})
	/* end of 필터모달창 전송하기 -----------------------------------------------*/

});// end of $(document).ready(function(){})------------------	