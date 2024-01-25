
function clickStyleImage(instaId, imageFile, mainImageFile, productDetailId, productName, price){
	
	const pathname = "/" + window.location.pathname.split("/")[1] + "/";
	const origin = window.location.origin;
	const contextPath = origin + pathname;
	
	$("h5.modal-title").html(instaId);
	$("p.product__name").html(productName);
	$("p.product__price").html(addComma(price) + "원");
	$("img.looks-popup__src").attr('src', contextPath + imageFile);
	$("img.product__img").attr('src', contextPath + mainImageFile);
	$("a.product__image-wrapper").prop('href', contextPath + `product/productDetail.gm?productDetailId=`+productDetailId);
	$("a.product__buy").prop('href', contextPath + `product/productDetail.gm?productDetailId=`+productDetailId);
}