<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/store/store.css">
<!-- JavaScript -->

<title>Stores | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />






<!-- 이미지 수정필요함 -->
<div class="row mx-auto my-auto">
	<div id="recipeCarousel" class="carousel slide w-100">
		<div class="carousel-inner1" role="listbox">
			<div class="carousel-item1 active1">
				<!-- <img src="https://inhouse-resource.gentlemonster.com/store/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block col-3 img-fluid" id="category_img_src_kr">
		 -->
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">1</span>
				</button>

			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">2</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">3</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">4</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">5</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">6</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">7</span>
				</button>
			</div>
			<div class="carousel-item1">
				<button type="button" class="category__link">
					<span> <img src="<%=ctxPath%>/image/store/category/166754976340490_hongdae_menu_2021-01-07_15_59_35.jpeg" alt="대한민국" class="category__img d-block img-fluid" id="category_img_src_kr">
					</span> <span class="category__name font--kr font--11 font--md">8</span>
				</button>
				<!-- <img src="https://inhouse-resource.gentlemonster.com/store/166754983387369_taiwan_2021-01-08_19_26_04.jpeg" alt="대만 지역, 중국" class="category__img d-block col-3 img-fluid" id="category_img_src_tw">
			 -->
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






















<!-- Contents -->
<div id="storePage" class="store store--fs content-container">
	<!-- Store Title & Filter -->
	<div class="content-top-dummy relative jsContDummy" id="city_selector" style="display: flex;">
		<div class="city-selector list-btn content-top__right inline" id="city_input_div" style="display: block;">
			<div class="list-filter relative">
				<!-- db로 가져와야해서 영문 필요할듯 -->
				<select name="" id="city_input" class="list-filter__select font--kr font--13 font--bd city-select" dir="rtl" aria-label="Choose City">
					<option value="">도시</option>
					<option value="Seoul">서울</option>
					<option value="Gyeonggi">경기</option>
					<option value="Busan">부산</option>
					<option value="Daegu">대구</option>
					<option value="Incheon">인천</option>
					<option value="Gwangju">광주</option>
					<option value="Daejeon">대전</option>
					<option value="Ulsan">울산</option>
					<option value="Sejong">세종</option>
					<option value="Gangwon">강원</option>
					<option value="Chungbuk">충북</option>
					<option value="Chungnam">충남</option>
					<option value="Jeonbuk">전북</option>
					<option value="Jeonnam">전남</option>
					<option value="Gyeongbuk">경북</option>
					<option value="Gyeongnam">경남</option>
					<option value="Jeju">제주</option>
				</select>
			</div>
		</div>
	</div>
	<!--// Store Title & Filter -->

	<div class="store_page">
		<!-- Store Title -->
		<div class="content-top-dummy relative jsContDummy" id="store_title--wrap" style="display: block;">
			<div class="content-top jsContTop">
				<div class="content-container">
					<h1 class="page-title font--kr font--16 font--bd float-left" id="store_title">
						스토어<span class="item-count" id="flagship_cnt"> (6)</span>
					</h1>
				</div>
			</div>
		</div>
		<!--// Store Title -->
	</div>











	<div id="flagship_list">

		<div class="store__item">
			<!-- 이미지 수정하기 -->
			<div class="flagship_list">
				<div id="carouselExampleIndicators" class="carousel slide">
					<!-- <ol class="carousel-indicators">
						<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="4"></li>
						<li data-target="#carouselExampleIndicators" data-slide-to="5"></li>
					</ol> -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<video id="storeVideo_0-0" class="d-block w-100 store__video" poster="<%=ctxPath%>/image/store/poster/Hannam_GM_image_01.jpg" preload="none" playsinline="" autoplay="" muted="" loop="" data-keepplaying="">
								<source src="<%=ctxPath%>/image/store/video/hanam_store_video_full_final_web.mp4" type="video/mp4">
							</video>
							<!-- <div class="video-control-wrap">
								<button type="button" class="video-control__button" aria-controls="storeVideo_0-0" aria-pressed="false" aria-label="pause button"></button>
							</div> -->


							<!-- <img src="../images/Koala.jpg" class="d-block w-100" alt="..."> -->
							<!-- d-block 은 display: block; 이고  w-100 은 width 의 크기는 <div class="carousel-item active">의 width 100% 로 잡으라는 것이다. -->
							<div class="carousel-caption d-none d-md-block">
								<!-- d-none 은 display : none; 이므로 화면에 보이지 않다가, d-md-block 이므로 d-md-block 은 width 가 768px이상인 것에서만 display: block; 으로 보여라는 말이다.  -->
							</div>
						</div>
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

					</div>
					<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="sr-only">Previous</span>
					</a>
					<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="sr-only">Next</span>
					</a>
				</div>
				<div class="store__content store__content--fs clearfix">
					<div class="store__info float-left">
						<div id="storeName_0" class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 스타필드 하남</div>
						<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
							<a href="javascript:void(window.open('https://goo.gl/maps/nRhvsRb3zPgEANhE8', '','_blank'))">경기 하남시 미사대로 750 스타필드 하남 1F</a>
							<br> +82 031 8072 8236
						</div>
						<div class="store__discover">
							<div id="discoverContents_0" class="store__discover-contents jsDiscoverContents">
								<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_0" aria-describedby="storeName_0">영업 시간</button>
								<div id="moreCont_0" class="store__more-content jsMoreCont" aria-hidden="true">
									<div class="store__desc font--kr font--14 font--rg word-break word-break--kr">스타필드 하남 스토어는 '자기 유사성' (Self Similarity) 이라는 테마로 수학적 개념에서 영감을 받아 공간적으로 재해석한 프로젝트입니다. 수학에서 자기유사성이란, 부분을 확대할 때 자기를 포함한 전체와 유사한 모습을 보여주는 성질입니다. 이러한 현상과 특징에 흥미를 가지고 프랙탈구조, 만델브로집합, 줄리아 집합같은 이론들로 부터 영감을 받아 표현된 스토어 안의 다양한 조각, 이미지, 설치물은 각자의 방식으로 '확장' 이라는 가능성을 시각적으로 제시합니다. 스토어 입구에 위치한 수축과 팽창을 반복하는 키네틱 설치물을 비롯하여 무한한 증식을 표현한 아트워크 영상, 로봇 설치물은 자기 유사성이라는 개념이 전달하고자하는 완전한 일치가 아닌 고도의 유사성을 젠틀몬스터의 시각으로 표현한 작업입니다.</div>
									<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일–일요일 10:00am–10:00pm</div>
								</div>
							</div>
							<button type="button" class="store__discover-more n-underline font--kr font--14 font--rg word-break word-break--kr jsDiscoverMore" data-default-txt="자세히 보기" data-close-txt="닫기" aria-controls="discoverContents_0"></button>
						</div>
					</div>
					<div class="store__desc store__desc--right float-right font--kr font--14 font--rg word-break word-break--kr">스타필드 하남 스토어는 '자기 유사성' (Self Similarity) 이라는 테마로 수학적 개념에서 영감을 받아 공간적으로 재해석한 프로젝트입니다. 수학에서 자기유사성이란, 부분을 확대할 때 자기를 포함한 전체와 유사한 모습을 보여주는 성질입니다. 이러한 현상과 특징에 흥미를 가지고 프랙탈구조, 만델브로집합, 줄리아 집합같은 이론들로 부터 영감을 받아 표현된 스토어 안의 다양한 조각, 이미지, 설치물은 각자의 방식으로 '확장' 이라는 가능성을 시각적으로 제시합니다. 스토어 입구에 위치한 수축과 팽창을 반복하는 키네틱 설치물을 비롯하여 무한한 증식을 표현한 아트워크 영상, 로봇 설치물은 자기 유사성이라는 개념이 전달하고자하는 완전한 일치가 아닌 고도의 유사성을 젠틀몬스터의 시각으로 표현한 작업입니다.</div>
				</div>
			</div>
		</div>
	</div>














	<!-- Store Title & Filter -->
	<div class="content-top-dummy relative jsContDummy" id="city_selector" style="display: flex;">
		<div class="city-selector list-btn content-top__right inline" id="city_input_div" style="display: block;">
			<div class="list-filter relative">
				<select name="" id="city_input" class="list-filter__select font--kr font--13 font--bd city-select" dir="rtl" aria-label="Choose City">
					<option value="">도시</option>
					<option value="Seoul">서울</option>
					<option value="Gyeonggi">경기</option>
					<option value="Busan">부산</option>
					<option value="Daegu">대구</option>
					<option value="Incheon">인천</option>
					<option value="Gwangju">광주</option>
					<option value="Daejeon">대전</option>
					<option value="Ulsan">울산</option>
					<option value="Sejong">세종</option>
					<option value="Gangwon">강원</option>
					<option value="Chungbuk">충북</option>
					<option value="Chungnam">충남</option>
					<option value="Jeonbuk">전북</option>
					<option value="Jeonnam">전남</option>
					<option value="Gyeongbuk">경북</option>
					<option value="Gyeongnam">경남</option>
					<option value="Jeju">제주</option>
				</select>
			</div>
		</div>
	</div>
	<!--// Store Title & Filter -->

	<div class="store_page">
		<!-- Department store Title -->
		<div class="content-top-dummy relative jsContDummy" id="department_name_div" style="display: block;">
			<div class="content-top jsContTop">
				<div class="page-title font--kr font--16 font--bd float-left">
					백화점 / 면세점<span class="item-count" id="department_cnt"> (28)</span>
				</div>
			</div>
		</div>
		<!--// Department store Title -->
	</div>




	<div class="os" id="department_main_div">
		<!-- 더보기 관련 쌤 지시있을예정 -->

		<div class="content-container content-container--os inline">
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 더현대 서울</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_0" aria-describedby="storeName_0">영업 시간</button>
					<div id="moreCont_0" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–8:00pm<br>금요일–일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 강남점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_1" aria-describedby="storeName_1">영업 시간</button>
					<div id="moreCont_1" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 대전점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_2" aria-describedby="storeName_2">영업 시간</button>
					<div id="moreCont_2" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 천안아산점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_3" aria-describedby="storeName_3">영업 시간</button>
					<div id="moreCont_3" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–08:00pm<br>금요일-일요일 10:30am-08:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 압구정점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_4" aria-describedby="storeName_4">영업 시간</button>
					<div id="moreCont_4" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm <br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 무역센터점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_5" aria-describedby="storeName_5">영업 시간</button>
					<div id="moreCont_5" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 목동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_6" aria-describedby="storeName_6">영업 시간</button>
					<div id="moreCont_6" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 10:30am-9:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 명동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_7" aria-describedby="storeName_7">영업 시간</button>
					<div id="moreCont_7" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 명동 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_8" aria-describedby="storeName_8">영업 시간</button>
					<div id="moreCont_8" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 잠실점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_9" aria-describedby="storeName_9">영업 시간</button>
					<div id="moreCont_9" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 월드타워 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_10" aria-describedby="storeName_10">영업 시간</button>
					<div id="moreCont_10" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일–일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 명동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_11" aria-describedby="storeName_11">영업 시간</button>
					<div id="moreCont_11" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 명동 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_12" aria-describedby="storeName_12">영업 시간</button>
					<div id="moreCont_12" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am–8:00pm<br>금요일-일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 압구정점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_13" aria-describedby="storeName_13">영업 시간</button>
					<div id="moreCont_13" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신라 서울 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_14" aria-describedby="storeName_14">영업 시간</button>
					<div id="moreCont_14" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 판교점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_15" aria-describedby="storeName_15">영업 시간</button>
					<div id="moreCont_15" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 의정부점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_16" aria-describedby="storeName_16">영업 시간</button>
					<div id="moreCont_16" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 경기점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_17" aria-describedby="storeName_17">영업 시간</button>
					<div id="moreCont_17" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 광교</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_18" aria-describedby="storeName_18">영업 시간</button>
					<div id="moreCont_18" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–8:00pm<br>금요일–일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 타임월드점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_19" aria-describedby="storeName_19">영업 시간</button>
					<div id="moreCont_19" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 센텀시티점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_20" aria-describedby="storeName_20">영업 시간</button>
					<div id="moreCont_20" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 인천국제공항 면세 T1</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_21" aria-describedby="storeName_21">영업 시간</button>
					<div id="moreCont_21" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일–일요일 6:30am–9:30pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 부산점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_22" aria-describedby="storeName_22">영업 시간</button>
					<div id="moreCont_22" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 대구점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_23" aria-describedby="storeName_23">영업 시간</button>
					<div id="moreCont_23" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 대구점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_24" aria-describedby="storeName_24">영업 시간</button>
					<div id="moreCont_24" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신라 제주 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_25" aria-describedby="storeName_25">영업 시간</button>
					<div id="moreCont_25" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 10:00am–6:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 제주 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_26" aria-describedby="storeName_26">영업 시간</button>
					<div id="moreCont_26" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">일시 운영중지</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 인천국제공항 면세 T2</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_27" aria-describedby="storeName_27">영업 시간</button>
					<div id="moreCont_27" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 6:30am–9:30pm</div>
					</div>
				</div>
			</div>
			<div class="store__item" id="get_department_cnt" style="display: none">28</div>
		</div>
		<div class="view-more text-center inline" id="show_more_department">
			<button type="button" class="deprtment_view-more__btn n-underline font--kr font--16 font--bd word-break word-break--kr jsViewMore">더보기</button>
		</div>
	</div>
















	<!-- Store Title & Filter -->
	<div class="content-top-dummy relative jsContDummy" id="city_selector" style="display: flex;">
		<div class="city-selector list-btn content-top__right inline" id="city_input_div" style="display: block;">
			<div class="list-filter relative">
				<select name="" id="city_input" class="list-filter__select font--kr font--13 font--bd city-select" dir="rtl" aria-label="Choose City">
					<option value="">도시</option>
					<option value="Seoul">서울</option>
					<option value="Gyeonggi">경기</option>
					<option value="Busan">부산</option>
					<option value="Daegu">대구</option>
					<option value="Incheon">인천</option>
					<option value="Gwangju">광주</option>
					<option value="Daejeon">대전</option>
					<option value="Ulsan">울산</option>
					<option value="Sejong">세종</option>
					<option value="Gangwon">강원</option>
					<option value="Chungbuk">충북</option>
					<option value="Chungnam">충남</option>
					<option value="Jeonbuk">전북</option>
					<option value="Jeonnam">전남</option>
					<option value="Gyeongbuk">경북</option>
					<option value="Gyeongnam">경남</option>
					<option value="Jeju">제주</option>
				</select>
			</div>
		</div>
	</div>
	<!--// Store Title & Filter -->

	<div class="store_page">
		<!-- Department store Title -->
		<div class="content-top-dummy relative jsContDummy" id="stockist_name_div" style="display: block;">
			<div class="content-top jsContTop">
				<h3 class="page-title font--kr font--16 font--bd float-left">
					스톡키스트<span class="item-count" id="stockist_cnt"> (141)</span>
				</h3>
			</div>
		</div>
		<!--// Department store Title -->
	</div>


	<div class="os" id="stockist_main_div">
		<!-- 더보기 관련 쌤 지시있을예정 -->

		<div class="content-container content-container--os inline">
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 더현대 서울</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_0" aria-describedby="storeName_0">영업 시간</button>
					<div id="moreCont_0" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–8:00pm<br>금요일–일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 강남점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_1" aria-describedby="storeName_1">영업 시간</button>
					<div id="moreCont_1" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 대전점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_2" aria-describedby="storeName_2">영업 시간</button>
					<div id="moreCont_2" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 천안아산점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_3" aria-describedby="storeName_3">영업 시간</button>
					<div id="moreCont_3" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–08:00pm<br>금요일-일요일 10:30am-08:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 압구정점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_4" aria-describedby="storeName_4">영업 시간</button>
					<div id="moreCont_4" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm <br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os ">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 무역센터점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_5" aria-describedby="storeName_5">영업 시간</button>
					<div id="moreCont_5" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 목동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_6" aria-describedby="storeName_6">영업 시간</button>
					<div id="moreCont_6" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 10:30am-9:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 명동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_7" aria-describedby="storeName_7">영업 시간</button>
					<div id="moreCont_7" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 명동 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_8" aria-describedby="storeName_8">영업 시간</button>
					<div id="moreCont_8" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 잠실점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_9" aria-describedby="storeName_9">영업 시간</button>
					<div id="moreCont_9" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 월드타워 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_10" aria-describedby="storeName_10">영업 시간</button>
					<div id="moreCont_10" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일–일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 명동점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_11" aria-describedby="storeName_11">영업 시간</button>
					<div id="moreCont_11" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 명동 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_12" aria-describedby="storeName_12">영업 시간</button>
					<div id="moreCont_12" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am–8:00pm<br>금요일-일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 압구정점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_13" aria-describedby="storeName_13">영업 시간</button>
					<div id="moreCont_13" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신라 서울 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_14" aria-describedby="storeName_14">영업 시간</button>
					<div id="moreCont_14" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 9:30am–8:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 판교점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_15" aria-describedby="storeName_15">영업 시간</button>
					<div id="moreCont_15" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 의정부점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_16" aria-describedby="storeName_16">영업 시간</button>
					<div id="moreCont_16" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 경기점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_17" aria-describedby="storeName_17">영업 시간</button>
					<div id="moreCont_17" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 광교</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_18" aria-describedby="storeName_18">영업 시간</button>
					<div id="moreCont_18" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일–목요일 10:30am–8:00pm<br>금요일–일요일 10:30am–8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 갤러리아 타임월드점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_19" aria-describedby="storeName_19">영업 시간</button>
					<div id="moreCont_19" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 센텀시티점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_20" aria-describedby="storeName_20">영업 시간</button>
					<div id="moreCont_20" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 인천국제공항 면세 T1</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_21" aria-describedby="storeName_21">영업 시간</button>
					<div id="moreCont_21" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일–일요일 6:30am–9:30pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 부산점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_22" aria-describedby="storeName_22">영업 시간</button>
					<div id="moreCont_22" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신세계 대구점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_23" aria-describedby="storeName_23">영업 시간</button>
					<div id="moreCont_23" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 대구점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_24" aria-describedby="storeName_24">영업 시간</button>
					<div id="moreCont_24" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">
							월요일-목요일 10:30am-8:00pm<br>금요일-일요일 10:30am-8:30pm
						</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 신라 제주 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_25" aria-describedby="storeName_25">영업 시간</button>
					<div id="moreCont_25" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 10:00am–6:00pm</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 롯데 제주 면세점</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_26" aria-describedby="storeName_26">영업 시간</button>
					<div id="moreCont_26" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">일시 운영중지</div>
					</div>
				</div>
			</div>
			<div class="store__item store__item--os dt_view_more" style="display: none;">
				<div class="store__content">
					<div class="store__name font--kr font--16 font--bd word-break word-break--kr">젠틀몬스터 현대 인천국제공항 면세 T2</div>
					<div class="store__address font--kr font--14 font--rg word-break word-break--kr">
						서울특별시 영등포구 여의대로 108, 더현대서울 1F <br> +82 02 3277 0182
					</div>
					<button type="button" class="store__toggle-btn relative font--kr font--14 font--rg word-break word-break--kr jsTimeToggle" aria-expanded="false" aria-controls="moreCont_27" aria-describedby="storeName_27">영업 시간</button>
					<div id="moreCont_27" class="store__more-content jsMoreCont" aria-hidden="true">
						<div class="store__time font--kr font--14 font--rg word-break word-break--kr jsOpeningHour">월요일-일요일 6:30am–9:30pm</div>
					</div>
				</div>
			</div>
			<div class="store__item" id="get_department_cnt" style="display: none">28</div>
		</div>
		<div class="view-more text-center inline" id="show_more_department">
			<button type="button" class="deprtment_view-more__btn n-underline font--kr font--16 font--bd word-break word-break--kr jsViewMore">더보기</button>
		</div>
	</div>


</div>

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