$(document).ready(function(){
	
	
	
	
});

function clickStyleImage(instaId, imageFile, mainImageFile, productDetailId, productName, price){
	console.log("들어왔찌러어어ㅓㅇ엉")
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	$("h5.modal-title").html(instaId);
	$("p.product__name").html(productName);
	$("p.product__price").html(addComma(price) + "원");
	$("img.looks-popup__src").attr('src', contextPath + imageFile);
	$("img.product__img").attr('src', contextPath + mainImageFile);
	$("a.product__buy").prop('href', contextPath + `product/productDetail.gm?productDetailId=`+productDetailId);
	//$("#styleModal").css("display", "block")
}