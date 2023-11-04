<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/store/store.css">
<!-- JavaScript -->

<title>Stores | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />






<!-- Category 시작 -->
<div class="row mx-auto my-auto">
	<div id="recipeCarousel" class="carousel slide w-100">
		<div class="carousel-inner1" role="listbox">
			
			<div class="carousel-item1 active1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=1'">
					<span> 
						<img src="<%=ctxPath%>/image/store/category/카테고리01_대한민국.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> 
					<span class="category__name font--kr font--11 font--md">대한민국</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link"  onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=2'">
					<span> 
						<img src="<%=ctxPath%>/image/store/category/카테고리02_중국.jpg" alt="중국" class="category__img d-block img-fluid" id="category_img_src_cn">
					</span> 
					<span class="category__name font--kr font--11 font--md">중국</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=3'">  
					<span> <img src="<%=ctxPath%>/image/store/category/카테고리03_일본.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_jp">
					</span> <span class="category__name font--kr font--11 font--md">일본</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=4'">
					<span> <img src="<%=ctxPath%>/image/store/category/카테고리04_미국.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_us">
					</span> <span class="category__name font--kr font--11 font--md">미국</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=5'">
					<span> <img src="<%=ctxPath%>/image/store/category/카테고리05_영국.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_gb">
					</span> <span class="category__name font--kr font--11 font--md">영국</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=6'">
					<span> <img src="<%=ctxPath%>/image/store/category/카테고리06_호주.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_au">
					</span> <span class="category__name font--kr font--11 font--md">호주</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link" onclick="location.href='<%= ctxPath%>/store/store.gm?countryid=7'">
					<span> <img src="<%=ctxPath%>/image/store/category/카테고리07_태국.jpg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_etc">
					</span> <span class="category__name font--kr font--11 font--md">태국</span>
				</button>
			</div>
		</div>
		<a class="carousel-control-prev1" href="#recipeCarousel" role="button" data-slide="prev">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
					<g id="타원_112" data-name="타원 112" transform="translate(24 24) rotate(180)" fill="#fff" stroke="#000" stroke-width="1">
						<circle cx="12" cy="12" r="12" stroke="none"></circle>
						<circle cx="12" cy="12" r="11.5" fill="none"></circle>
					</g>
					<path id="패스_133" data-name="패스 133" d="M5924.868,4162.23l4.9,4.9-4.9,4.9" transform="translate(5939.053 4179.106) rotate(180)" fill="none" stroke="#000" stroke-width="2"></path>
				</svg>
		</a>
		<a class="carousel-control-next1" href="#recipeCarousel" role="button" data-slide="next">
			<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
					<g id="타원_111" data-name="타원 111" fill="#fff" stroke="#000" stroke-width="1">
						<circle cx="12" cy="12" r="12" stroke="none"></circle>
						<circle cx="12" cy="12" r="11.5" fill="none"></circle>
					</g>
					<path id="패스_132" data-name="패스 132" d="M5924.868,4162.23l4.9,4.9-4.9,4.9" transform="translate(-5915.053 -4155.106)" fill="none" stroke="#000" stroke-width="2"></path>
			</svg>
		</a>
	</div>
</div>
<!-- Category 끝 -->








<!-- Contents 시작 -->
<div id="storePage" class="store store--fs content-container">
	<!-- Store Title & Filter -->
	<div class="content-top-dummy relative jsContDummy" id="city_selector" style="display: flex;">
		<div class="city-selector list-btn content-top__right inline" id="city_input_div" style="display: block;">
			
		</div>
	</div>
	<!--// Store Title & Filter -->
	
	
	
	<!-- ######################### 스토어(스토어) 시작 ######################### -->
	<div class="store_page">
		<!-- Store Title -->
		<div class="content-top-dummy relative jsContDummy" id="store_title--wrap" style="display: block;">
			<div class="content-top jsContTop">
				<div class="content-container">
					<h1 class="page-title font--kr font--16 font--bd float-left" id="store_title">
						스토어<span class="item-count" id="flagship_cnt"> (${requestScope.totalStoreCount})</span>
					</h1>
				</div>
			</div>
		</div>
		<!--// Store Title -->
	</div>


	<div id="flagship_list">
	
		<!-- 스토어 존재하지 않을 경우 --> 
		<c:if test="${empty requestScope.storeList}">
			<div class="font--kr font--14 font--rg word-break word-break--kr">
				스토어가 존재하지 않습니다.
			</div>
			<br><br><br><br><br>
		</c:if>
		
		<!-- 스토어 존재하는 경우 -->
		<c:if test="${not empty requestScope.storeList}">
			<div class="store__item">
				<div class="flagship_list">
 					
 					<!-- ~~~~~ 하나의 스토어 시작 ~~~~~ -->
					<c:forEach var="storeVO" items="${requestScope.storeList}" varStatus="status">
						
						<div name="storeid" value="${storeVO.storeId}"> 	
							
							<!-- store__thumbnail 시작 -->
							<div id="carouselExampleIndicators" class="carousel slide">
								<div class="carousel-inner">
						
									<div class="carousel-item active">		
	
										<video id="storeVideo_0-0" class="d-block w-100 store__video" poster="<%=ctxPath%>${storeVO.mainImageFile}" preload="none" playsinline="" autoplay="" muted="" loop="" data-keepplaying="">
											<source src="<%=ctxPath%>${storeVO.mainImageFile}" type="video/mp4">
										</video>
										
										<div class="carousel-caption d-none d-md-block">
											<!-- d-none 은 display : none; 이므로 화면에 보이지 않다가, d-md-block 이므로 d-md-block 은 width 가 768px이상인 것에서만 display: block; 으로 보여라는 말이다.  -->
										</div>
									</div>
									
									
									<!-- 스토어 사진 보여주기 시작 -->
									<c:forEach var="storeImgVO" items="${requestScope.storeImgList}" varStatus="status">
										
										<!-- 이프조건  -->
										<c:if test="${storeVO.storeId eq storeImgVO.fk_storeId}">
										
											
										 	<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>${storeImgVO.imageFile}" alt="">
												<%-- <img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/image/store_01_Hanam.jpg" alt=""> --%>
												<!-- <img src="../images/Lighthouse.jpg" class="d-block w-100" alt="..."> -->
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
										 	<%-- 
											<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/store/Hannam_GM_image_01.jpg" alt="">
												<!-- <img src="../images/Lighthouse.jpg" class="d-block w-100" alt="..."> -->
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
											<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/store/Hannam_GM_image_02.jpg" alt="">
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
											<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/store/Hannam_GM_image_03.jpg" alt="">
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
					
											<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/store/Hannam_GM_image_04.jpg" alt="">
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
											<div class="carousel-item">
												<img class="store__img d-block w-100" src="<%=ctxPath%>/image/store/store/Hannam_GM_image_05.jpg" alt="">
												<div class="carousel-caption d-none d-md-block"></div>
											</div>
											 --%>
										</c:if>
									</c:forEach> 
									<!-- 스토어 사진 보여주기 끝 -->
										 
							
								</div>
								<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
									<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
								</a>
								<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
									<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
								</a>
							</div>
							<!-- store__thumbnail 끝 -->
							
			
							<!-- store__content 시작 -->
							<div class="store__content store__content--fs clearfix">
								<div class="store__info float-left">
									<div name="STORENAME" id="storeName_0" class="store__name font--kr font--16 font--bd word-break word-break--kr">${storeVO.storeName}</div>
									<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
										<a name="ADDRESS" href="javascript:void(window.open('https://goo.gl/maps/nRhvsRb3zPgEANhE8', '','_blank'))">${storeVO.address}</a>
										<br> 
										<div name="TEL">${storeVO.tel}</div>
									</div>
									<div class="store__discover">
										<div id="discoverContents_0" class="store__discover-contents jsDiscoverContents">
											<button type="button" class=" relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_0" aria-describedby="storeName_0">영업 시간 : ${storeVO.openingHours}</button>
											<div id="moreCont_0" class="store__more-content jsMoreCont" aria-hidden="true">
												<div class="store__desc font--kr font--14 font--rg word-break word-break--kr">${storeVO.description}</div>
												<div name="OPENINGHOURS" class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">${storeVO.openingHours}</div>
											</div>
										</div>
										<button type="button" class="store__discover-more n-underline font--kr font--14 font--rg word-break word-break--kr jsDiscoverMore" data-default-txt="자세히 보기" data-close-txt="닫기" aria-controls="discoverContents_0"></button>
									</div>
								</div>
								<div name="DESCRIPTION" class="store__desc store__desc--right float-right font--kr font--14 font--rg word-break word-break--kr">${storeVO.description}</div>
							</div>
							<!-- store__content 끝 -->
						</div>	
			 		</c:forEach> 
 					<!-- ~~~~~ 하나의 스토어 끝 ~~~~~ -->

				</div>
			</div>
		</c:if>	
		
	</div>
	<!-- ######################### 스토어(스토어) 끝 ######################### -->




	<!-- ######################### 스토어(백화점/면세점) 시작 ######################### -->
	<div class="store_page">
		<!-- Department store Title -->
		<div class="content-top-dummy relative jsContDummy" id="department_name_div" style="display: block;">
			<div class="content-top jsContTop">
				<div class="page-title font--kr font--16 font--bd float-left">
					백화점 / 면세점<span class="item-count" id="department_cnt"> (${requestScope.totalDepStoreCount})</span>
				</div>
			</div>
		</div>
		<!--// Department store Title -->
	</div>


	<div class="os" id="department_main_div">
		<div class="content-container content-container--os inline">
			
			<!-- 스토어(백화점/면세점) 존재하지 않을 경우 --> 
			<c:if test="${empty requestScope.storeDepList}">
				<div class="font--kr font--14 font--rg word-break word-break--kr">
					스토어가 존재하지 않습니다.
				</div>
				<br><br><br><br><br>
			</c:if>
			
			<!-- 스토어(백화점/면세점) 존재하는 경우 -->
			<c:if test="${not empty requestScope.storeDepList}">
				<c:forEach var="storeVO" items="${requestScope.storeDepList}" varStatus="status">
					<div class="store__item store__item--os ">
						<div class="store__content">
							<div class="store__name font--kr font--16 font--bd word-break word-break--kr">${storeVO.storeName}</div>
							<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
								${storeVO.address} <br> ${storeVO.tel}
							</div>
							<button type="button" class=" relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_0" aria-describedby="storeName_0">영업 시간 : ${storeVO.openingHours}</button>
							<div id="moreCont_0" class="store__more-content jsMoreCont" aria-hidden="true">
								<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
									${storeVO.openingHours}
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
        </div>
	</div>
	<!-- ######################### 스토어(백화점/면세점) 끝 ######################### -->
</div>	
<!-- Contents 끝 -->	
	

<script src="<%=ctxPath%>/js/store/store_official.js" type="text/javascript"></script>
<script src="<%=ctxPath%>/js/store/store.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {

		$('#recipeCarousel').carousel({
			interval : false
		});

		$('.carousel .carousel-item1').each(function() {
			var next = $(this).next();
			if (!next.length) {
				next = $(this).siblings(':first');
			}
			next.children(':first-child').clone().appendTo($(this));

			for (var i = 0; i < 4; i++) {
				next = next.next();
				if (!next.length) {
					next = $(this).siblings(':first');
				}

				next.children(':first-child').clone().appendTo($(this));
			}
		});

	});
</script>

<jsp:include page="../common/footer.jsp" />