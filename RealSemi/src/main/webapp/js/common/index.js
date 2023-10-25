$(document).ready(function() {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	fnChangeImage();
	/* index 화면에 보여질 상품관련 처리 ----------------------------------------------------------- */



	/*setInterval(function() {
		$("a.productDetail").forEach(function(item, index) {
			item.css("display", "none");
		});
		imageLoop(productDetailId, mainImageFile);
	}, 5000);*/



	/*$.ajax({
		url: contextPath + "index.gm",
		type: "post",
		async: true,
		dataType: "json",
		success: function(text) {
			alert("하이루")
			for (var i = 0; i < text.length; i++) {
				let productDetailId = text[i]['productDetailId'];
				let mainImageFile = text[i]['mainImageFile'];
				mainImageFile = mainImageFile.substr(1, mainImageFile.length);
				
				
			}



		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});*/
	/* end of index 화면에 보여질 상품관련 처리 ----------------------------------------------------------- */
});



function imageLoop(productDetailId, mainImageFile) {


	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	$("a#productDetail").attr("href", contextPath + "sunglassDetail?productDetailId=" + productDetailId);
	$("img.main-image").attr("src", contextPath + mainImageFile);
};

function fnChangeImage() {
	/*let imgLoop = 1;
	
	console.log("길이",$("a.productDetail").length);
	
	let i = imgLoop % $("a.productDetail").length;

	if (i == 0) imgLoop = 1;
	else imgLoop++;*/



	/*$("a.productDetail").each(function(index, e) {
		if ($(this).css("display") == "inline") {
			$(this).css("display","none");
			$(this).next().css("display","inline");
			return;
		}
	});*/

	/*$("a.productDetail").css("display", "none");


	document.imgSrc01.src = arrImage[i];

	setTimeout(fnChangeImage(), 3000);*/

}
