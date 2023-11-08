<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/search/searchResult.css">
<script type="text/javascript">
   
   $(document).ready(function(){
       
   });// end of $(document).ready(function(){})--------------
   
   
   function goAdd(productDetailId) {

         const pathname = "/" + window.location.pathname.split("/")[1] + "/";
         const origin = window.location.origin;
         const contextPath = origin + pathname;

         /* 선택한 카트 상품을 삭제한다 */
         $.ajax({
            url: contextPath + "wish/addWishItem.gm",
            data: { "productDetailId": productDetailId },
            type: "post",
            async: true,
            dataType: "json",
            success: function(text) {
               if (text.isAdd) {
                  // true일 경우 = 추가가 완료되었을경우
                  $(location).attr("href", history.go(0));
               } else {
                  // false일 경우 = 추가되지 않았을 경우
                  alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
                  $(location).attr("href", history.go(0));
               }
            },
            error: function(request, status, error) {
               alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
            }
         });
      };


      /* 삭제하기 버튼 눌렀을 경우 */
      function goDelete(productDetailId) {

         const pathname = "/" + window.location.pathname.split("/")[1] + "/";
         const origin = window.location.origin;
         const contextPath = origin + pathname;

         /* 선택한 카트 상품을 삭제한다 */
         $.ajax({
            url: contextPath + "wish/deleteWishItem.gm",
            data: { "productDetailId": productDetailId },
            type: "post",
            async: true,
            dataType: "json",
            success: function(text) {
               if (text.isDelete) {
                  // true일 경우 = 삭제가 완료되었을경우
                  $(location).attr("href", history.go(0));
               } else {
                  // false일 경우 = 삭제되지 않았을 경우
                  alert("삭제 실패! 정상적으로 작동되지 않았습니다. 원래 화면으로 돌아갑니다");
                  $(location).attr("href", history.go(0));
               }
            },
            error: function(request, status, error) {
               alert("code: " + request.status + "\n" + "message: " + request.responseText + "\n" + "error: " + error);
            }
         });
      }; // end of function goDelete(cartId) --------------------------------------------------------------------------------------------
   
</script>
<title>GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />






<div class="container_sq type2" style="margin-bottom: 0;">
	<div class="search">

		<div class="search__product search__product--result">
			<div class="content-top-dummy relative jsContDummy">
				<div class="content-top jsContTop">
					<div class="page-title font--kr font--16 font--bd">
						"${requestScope.searchKeyword}"
						<span id="list-total-count">(${fn:length(requestScope.productList)})</span>
					</div>
				</div>
			</div>
			<div id="product-list">
				<c:if test="${not empty requestScope.productList}">
					<ul class="product-list__wrapper inline">
						<c:forEach var="productVo" items="${requestScope.productList}">


							<li data-id="14E4P7JEU08QV">
								<div class="product">
									<div class="product__image-wrapper">
										<a class="product__link" href="<%=ctxPath%>/product/productDetail.gm?productDetailId=${productVo.productDetailId}">
											<img data-src="" alt="" src="<%=ctxPath%>${productVo.mainImageFile}">
										</a>
									</div>
									<div class="product__info relative">
										<div class="clearfix">
											<div class="product__spec float-left">
												<a class="product__link" href="<%= ctxPath %>/product/productDetail.gm?productDetailId=${cartVo.productDetailId}">
													<c:if test="${productVo.isBlueLight eq 1}">
														<div class="blue-glasses font--11 font--rg">Blue Light Protection</div>
													</c:if>
													<p class="product__name font--kr font--13 font--bd">${productVo.productName}</p>
													<p class="product__price font--kr font--12 font--rg">
														<fmt:formatNumber type="number" maxFractionDigits="3" value="${productVo.price}" />
														원
													</p>
												</a>
											</div>

											<c:if test="${not empty sessionScope.loginUser}">
												<c:if test="${productVo.isWish eq 1}">
													<button class="product__wish float-right jsBtnWish on" onclick="goDelete(${productVo.productDetailId});">
												</c:if>

												<c:if test="${productVo.isWish eq 0}">
													<button class="product__wish float-right jsBtnWish" onclick="goAdd(${productVo.productDetailId});">
												</c:if>
											</c:if>
											<svg version="1.1" baseProfile="basic" id="레이어_3" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px" viewBox="0 0 30 30" xml:space="preserve">
							                        <path fill="none" stroke-miterlimit="10" d="M27.4,9.4c-0.4-3.3-3.2-5.9-6.6-5.9c-2.5,0-4.6,1.3-5.8,3.3
							                            c-1.2-2-3.3-3.3-5.8-3.3C5.8,3.5,3,6.1,2.6,9.4c-0.1,0.2-0.1,0.5-0.1,0.8C2.5,18,15,25.6,15,25.6S27.5,18,27.5,10.2
							                            C27.5,9.9,27.4,9.6,27.4,9.4z"></path>
		                    					</svg>
											</button>
										</div>
									</div>
								</div>
							</li>

						</c:forEach>
					</ul>
				</c:if>

				<c:if test="${empty requestScope.productList}">
					<div class="noItem">"${requestScope.searchKeyword}"에서 정확히 일치하는 정보를 찾지 못했습니다.단어의 철자나 띄어쓰기가 정확한지 확인해주시기 바랍니다.</div>
				</c:if>
			</div>
		</div>
	</div>
</div>


<jsp:include page="../common/footer.jsp" />