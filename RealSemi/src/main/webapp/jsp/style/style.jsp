<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/style/style.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/style/style.js"></script>





<div class="container_sq">
	<!-- Top Text -->
	<div class="jsCateWrap">
		<div class="looks-text font--kr font--14 font--rg text-center jsCate">
			젠틀몬스터와 함께한 다양한 순간을 만나보세요. <br>인스타그램에 @gentlemonster을 태그하여 당신의 스타일을 공유해보세요.
		</div>
	</div>
	<!--// Top Text -->

	<!-- Title & Category -->
	<div class="looks-top relative jsContDummy">
		<div class="looks-top__container jsContTop">
			<div class="page-title font--kr font--15 font--md">
				스타일 /
				<span id="looks-sub-category">All</span>
				<span id="looks-total-count">(${fn:length(requestScope.styleList)})</span>
			</div>
		</div>
	</div>











	<div class="looks-list">
		<ul id="looks-list-wrapper" class="looks-list__wrapper inline">

			<c:forEach var="styleVo" items="${requestScope.styleList}">
				<li class="looks-list__item">
					<div class="looks-list__image">

						<button data-toggle="modal" data-target="#styleModal" type="button" class="looks-list__link">
							<img src="<%= ctxPath %>${styleVo.imageFile}" onClick="clickStyleImage('${styleVo.instaId}', '${styleVo.imageFile}', '${styleVo.mainImageFile}', '${styleVo.productDetailId}', '${styleVo.productName}', '${styleVo.price}')" class="looks-list__src" alt="">
						</button>

					</div>
				</li>
			</c:forEach>


		</ul>
	</div>









	<!-- 스타일용 Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="styleModal">
		<div class="modal-dialog modal-dialog-centered" style="max-width: 650px;">
			<div class="modal-content">

				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title font--kr"></h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="looks-popup__wrapper swiper-container swiper-container-fade swiper-container-horizontal">
						<div id="looks-popup-contents" class="looks-popup__contents swiper-wrapper">
							<div id="looks-popup-item0" class="looks-popup__item swiper-slide flex swiper-slide-active" data-slider="0" style="width: 629px; opacity: 1; transform: translate3d(0px, 0px, 0px);">
								<div id="looks-popup-left" class="looks-popup__left">
									<!-- <div class="looks-popup__tag font--kr font--13 font--rg">@mayziwang</div> -->
									<div class="looks-popup__image relative">
										<img src="" class="looks-popup__src" alt="">
									</div>
								</div>
								<div id="looks-popup-right" class="looks-popup__right flex">
									<div class="product">
										<a href="" class="product__image-wrapper" >
											<img src="" class="product__img" alt="">
										</a>
										<div class="product__info relative">
											<div class="product__spec">
												<p class="product__name font--kr font--13 font--bd"></p>
												<p class="product__price font--kr font--12 font--rg"></p>
												<p class="product__button">
													<a href="" class="product__buy font--kr font--12 font--md text-center"> 구매하기 </a>
												</p>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
				</div>
			</div>
		</div>
	</div>

</div>






<jsp:include page="../common/footer.jsp" />