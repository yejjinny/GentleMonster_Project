
$(document).ready(function() {
	/* 국가 카테고리 눌렸을 때 테두리 생기는 거 안 됨... */
	/*
	<span class="category__thumbnail" style="outline: rgb(255, 0, 0) dashed 1px;">
	<img src="https://inhouse-resource.gentlemonster.com/store/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img" id="category_img_src_kr" style="">
	</span>
	*/
	
	/*
	$("button:button[class='category__link']").click(function(e){
		
		$(e.target).find("span").css({"outline":"rgb(255, 0, 0) dashed 1px"});
		
		$(e.target).parent().find("span.thumbnail").css("border", "solid 1px #000000");
		$(e.target).parent().find("span").addClass("category__thumbnail");
		
		//$("span.category__thumbnail").css({"outline":"rgb(255, 0, 0) dashed 1px"});
	});
	*/
	
	/*
	<button type="button" class="category__link" id="kr" value="12345">
	*/
	$("button:button[id='kr']").click(function(){
		
	});
	
});