$(document).ready(function() {
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;

	//fnChangeImage();
	/* index 화면에 보여질 상품관련 처리 ----------------------------------------------------------- */



	/*setInterval(function() {
		$("a.productDetail").forEach(function(item, index) {
			item.css("display", "none");
		});
		imageLoop(productDetailId, mainImageFile);
	}, 5000);*/




	$.ajax({
		url: contextPath + "index.gm",
		type: "post",
		async: true,
		dataType: "json",
		success: function(json) {
			let ranHistory = 0;

			function imageLoop() {
				const pathname = "/" + window.location.pathname.split("/")[1] + "/";
				const origin = window.location.origin;
				const contextPath = origin + pathname;
				
				
				let imgRandomNum = Math.round(Math.random() * (json.length - 1));
				
				while(imgRandomNum == ranHistory){
					imgRandomNum = Math.round(Math.random() * (json.length - 1));
				}
			
				let productDetailId = json[imgRandomNum]['productDetailId'];
				let mainImageFile = json[imgRandomNum]['mainImageFile'];

				$("a.productDetail").attr("href", contextPath + "product/productDetail.gm?productDetailId=" + productDetailId);
				$("img.main-image").attr("src", contextPath + mainImageFile.substr(1, mainImageFile.length));
				
				ranHistory = imgRandomNum;
				setTimeout(imageLoop, 1500);
				
			}
			imageLoop(json);
		},
		error: function(request, status, error) {
			alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
		}
	});
	/* end of index 화면에 보여질 상품관련 처리 ----------------------------------------------------------- */
});





