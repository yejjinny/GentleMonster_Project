<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/style/style.css">
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />






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
				스타일 / <span id="looks-sub-category">All</span> <span id="looks-total-count">(121)</span>
			</div>
			<div class="looks-category" data-role="selectBox" style="display: none;">
				<select name="" id="" class="looks-category__select font--kr font--13 font--md" dir="rtl" onchange="looksAjax(this.value)">
					<option value="all">All</option>
					<option value="women">Women</option>
					<option value="men">Men</option>
				</select>
				<ul class="looks-category__list flex relative">
					<li id="cateAll" class="looks-category__item font--kr font--14 font--rg active">
						<button type="button" class="looks-category__button" value="all">All</button>
					</li>
					<li id="cateWomen" class="looks-category__item font--kr font--14 font--rg">
						<button type="button" class="looks-category__button" value="women">Women</button>
					</li>
					<li id="cateMen" class="looks-category__item font--kr font--14 font--rg">
						<button type="button" class="looks-category__button" value="men">Men</button>
					</li>
				</ul>
			</div>
		</div>
	</div>











	<div class="looks-list">
		<ul id="looks-list-wrapper" class="looks-list__wrapper inline">
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item0" class="looks-list__link" onclick="showPopup(0)">
						<img src="https://web-resource.gentlemonster.com/event/1695706203.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item1" class="looks-list__link" onclick="showPopup(1)">
						<img src="https://web-resource.gentlemonster.com/event/1695706139.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item2" class="looks-list__link" onclick="showPopup(2)">
						<img src="https://web-resource.gentlemonster.com/event/1695705446.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item3" class="looks-list__link" onclick="showPopup(3)">
						<img src="https://web-resource.gentlemonster.com/event/1695705698.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item4" class="looks-list__link" onclick="showPopup(4)">
						<img src="https://web-resource.gentlemonster.com/event/1695705612.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item5" class="looks-list__link" onclick="showPopup(5)">
						<img src="https://web-resource.gentlemonster.com/event/1695705532.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item6" class="looks-list__link" onclick="showPopup(6)">
						<img src="https://web-resource.gentlemonster.com/event/1695705817.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item7" class="looks-list__link" onclick="showPopup(7)">
						<img src="https://web-resource.gentlemonster.com/event/1695706245.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item8" class="looks-list__link" onclick="showPopup(8)">
						<img src="https://web-resource.gentlemonster.com/event/1695705760.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item9" class="looks-list__link" onclick="showPopup(9)">
						<img src="https://web-resource.gentlemonster.com/event/1691975365.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item10" class="looks-list__link" onclick="showPopup(10)">
						<img src="https://web-resource.gentlemonster.com/event/1691972304.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item11" class="looks-list__link" onclick="showPopup(11)">
						<img src="https://web-resource.gentlemonster.com/event/1691730858.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item12" class="looks-list__link" onclick="showPopup(12)">
						<img src="https://web-resource.gentlemonster.com/event/1688087756.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item13" class="looks-list__link" onclick="showPopup(13)">
						<img src="https://web-resource.gentlemonster.com/event/1691730534.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item14" class="looks-list__link" onclick="showPopup(14)">
						<img src="https://web-resource.gentlemonster.com/event/1661999823-1661999822.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item15" class="looks-list__link" onclick="showPopup(15)">
						<img src="https://web-resource.gentlemonster.com/event/1662528880-1662528880.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item16" class="looks-list__link" onclick="showPopup(16)">
						<img src="https://web-resource.gentlemonster.com/event/1687331399_new.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item17" class="looks-list__link" onclick="showPopup(17)">
						<img src="https://web-resource.gentlemonster.com/event/1690333557.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item18" class="looks-list__link" onclick="showPopup(18)">
						<img src="https://web-resource.gentlemonster.com/event/1691972098.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item19" class="looks-list__link" onclick="showPopup(19)">
						<img src="https://web-resource.gentlemonster.com/event/1649296106-1649296106.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item20" class="looks-list__link" onclick="showPopup(20)">
						<img src="https://web-resource.gentlemonster.com/event/1691975126.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item21" class="looks-list__link" onclick="showPopup(21)">
						<img src="https://web-resource.gentlemonster.com/event/1690273694.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item22" class="looks-list__link" onclick="showPopup(22)">
						<img src="https://web-resource.gentlemonster.com/event/1685952120.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item23" class="looks-list__link" onclick="showPopup(23)">
						<img src="https://web-resource.gentlemonster.com/event/1688087039.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item24" class="looks-list__link" onclick="showPopup(24)">
						<img src="https://web-resource.gentlemonster.com/event/1687331001.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item25" class="looks-list__link" onclick="showPopup(25)">
						<img src="https://web-resource.gentlemonster.com/event/1690275044.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item26" class="looks-list__link" onclick="showPopup(26)">
						<img src="https://web-resource.gentlemonster.com/event/1687913754.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item27" class="looks-list__link" onclick="showPopup(27)">
						<img src="https://web-resource.gentlemonster.com/event/1664933066-1664933066.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item28" class="looks-list__link" onclick="showPopup(28)">
						<img src="https://web-resource.gentlemonster.com/event/1690273524.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item29" class="looks-list__link" onclick="showPopup(29)">
						<img src="https://web-resource.gentlemonster.com/event/1688021706.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item30" class="looks-list__link" onclick="showPopup(30)">
						<img src="https://web-resource.gentlemonster.com/event/1687914252.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item31" class="looks-list__link" onclick="showPopup(31)">
						<img src="https://web-resource.gentlemonster.com/event/1690272559.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item32" class="looks-list__link" onclick="showPopup(32)">
						<img src="https://web-resource.gentlemonster.com/event/1666240783.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item33" class="looks-list__link" onclick="showPopup(33)">
						<img src="https://web-resource.gentlemonster.com/event/1670201341.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item34" class="looks-list__link" onclick="showPopup(34)">
						<img src="https://web-resource.gentlemonster.com/event/1690273902.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
			<li class="looks-list__item">
				<div class="looks-list__image">
					<a href="#looks-popup-item35" class="looks-list__link" onclick="showPopup(35)">
						<img src="https://web-resource.gentlemonster.com/event/1662529126-1662529126.jpg" class="looks-list__src" alt="">
					</a>
				</div>
			</li>
		</ul>
	</div>



</div>






<jsp:include page="../common/footer.jsp" />