<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="indexHeader.jsp" />
<script src="<%=ctxPath%>/js/common/index.js"></script>
<article id="home" class="container_sq">
	<section class="main collection-campaign font--kr" data-header-group="white">
		<article class="main-wrapper">
			<picture>
			
			<a class = "productDetail" href="">
					<img class="main-image hide-tabletLte" src="" alt="">
				</a> 
			<div class="margiela__text text-area">
				<h1 class="text-area__title">
					<em class="text-area__title gm-c font--kr font--29 font--22-m"> 2023 <span class="main-title font--kr font--26 font--19-m font--md">신상품</span>
					</em>
				</h1>
				<div class="mm-title-area text-area__link-area text-area__link-flex">
					<button type="button" onclick="location=href='<%=ctxPath%>/product/product.gm?categoryId=1'" class="mm-common__style mm_link font--kr text-area__link font--13 font--13-m">구매하기</button>
				</div>
			</div>
		</article>
	</section>
</article>
<script>
const WindowPhpLang = window._php.lang

var setDeviceRatio = function () {
    var init = function () {
        var windowHeight = window.innerHeight;
        var windowWidth = window.innerWidth;
        var vh = window.innerHeight * 0.01;
        document.documentElement.style.setProperty('--deviceRatioHeightToWidth', windowHeight / windowWidth);
        document.documentElement.style.setProperty('--deviceRatioWidthToHeight', windowWidth / windowHeight);
        document.documentElement.style.setProperty('--vh', vh +'px');
    }
    var resizeFunc = function () {
        var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        var resizeTimer = null
        var resizeHandler = function() {
            if (resizeTimer) clearTimeout(resizeTimer)
            resizeTimer = setTimeout(function() {
                init()
            }, 300)
        }
        if (!isMobile) {
            window.addEventListener('resize', resizeHandler)
        } else {
            window.addEventListener('orientationchange', resizeHandler)
        }
    }

    document.addEventListener('readystatechange', function (e) {
        if (e.target.readyState === 'interactive') {
            init()
        } else if (e.target.readyState === 'complete') {
            init()
        }
    })
    resizeFunc();
}

var aspectRatioResize = function () {
	const pcDevice = () => window.matchMedia("(min-width: 1081px)").matches;
    var getWrapperHeight = function () {
        var headerHeight = document.querySelector('.n-header-wrap').clientHeight
        var noticeHeight = 0
        if (document.querySelector('.n-header-wrap').classList.contains('has-noti')) {
            noticeHeight = document.querySelector('.has-noti').offsetTop
        }
        return window.innerHeight - headerHeight - noticeHeight
    }
    var setAspectRatio = function (wrapper, target) {
		const videoRatio = pcDevice() ? 1920 / 1080 : 1080 / 1584
        if (wrapper.clientWidth / wrapper.clientHeight >= videoRatio) {
            target.style.width = '100%';
            target.style.height = 'auto'; //note : 원래 'auto' 였으나 비디오tag 이슈로 100% 처리
        } else {
            target.style.width = 'auto'; //note : 원래 'auto' 였으나 비디오tag 이슈로 100% 처리
            target.style.height = '100%'
        }
    }
    var init = function () {
        var wrapperEl = document.querySelectorAll('.main-wrapper');
        Array.from(wrapperEl).forEach(function (el) {
            var videoEl = el.querySelector('.main-video');
            if (videoEl) setAspectRatio(el, videoEl);
        })
    }
    var resizeFunc = function () {
        var isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
        var resizeTimer = null
        var resizeHandler = function() {
            if (resizeTimer) clearTimeout(resizeTimer)
            resizeTimer = setTimeout(init, 300)
        }
        if (!isMobile) {
            window.addEventListener('resize', resizeHandler)
        } else {
            window.addEventListener('orientationchange', resizeHandler)
        }
    }

    document.addEventListener('readystatechange', function (e) {
        if (e.target.readyState === 'interactive') {
            init()
        } else if (e.target.readyState === 'complete') {
            init()
        }
    })
    resizeFunc()
}


setDeviceRatio();
aspectRatioResize();

</script>
<jsp:include page="footer.jsp" />