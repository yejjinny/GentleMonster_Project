
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



/* 추가하기 버튼 눌렀을 경우 */
function goAdd(productDetailId) {

   const pathname = "/" + window.location.pathname.split("/")[1] + "/";
   const origin = window.location.origin;
   const contextPath = origin + pathname;

   /* 선택한 카트 상품을 삭제한다 */
   $.ajax({
      url: contextPath + "wish/addWishItem.gm",
      data: { "productDetailId": productDetailId },
      type: "post",
      async: true,
      dataType: "json",
      success: function(text) {
         if (text.isAdd) {
            // true일 경우 = 추가가 완료되었을경우
            $(location).attr("href", history.go(0));
         } else {
            // false일 경우 = 추가되지 않았을 경우
            alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
            $(location).attr("href", history.go(0));
         }
      },
      error: function(request, status, error) {
         alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
      }
   });
};


/* 삭제하기 버튼 눌렀을 경우 */
function goDelete(productDetailId) {

   const pathname = "/" + window.location.pathname.split("/")[1] + "/";
   const origin = window.location.origin;
   const contextPath = origin + pathname;

   /* 선택한 카트 상품을 삭제한다 */
   $.ajax({
      url: contextPath + "wish/deleteWishItem.gm",
      data: { "productDetailId": productDetailId },
      type: "post",
      async: true,
      dataType: "json",
      success: function(text) {
         if (text.isDelete) {
            // true일 경우 = 삭제가 완료되었을경우
            $(location).attr("href", history.go(0));
         } else {
            // false일 경우 = 삭제되지 않았을 경우
            alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
            $(location).attr("href", history.go(0));
         }
      },
      error: function(request, status, error) {
         alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
      }
   });
}; // end of function goDelete(cartId) --------------------------------------------------------------------------------------------