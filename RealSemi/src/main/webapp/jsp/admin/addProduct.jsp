<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/admin/addProduct.css">
<!-- JavaScript -->

<title>상품등록 | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />
<script src="<%=ctxPath%>/js/admin/addProduct.js"></script>



<!-- Contents -->
<div id="storePage" class="store store--fs content-container">
	<div class="store_page">
		<!-- Store Title -->
		<div class="content-top-dummy relative jsContDummy" id="store_title--wrap" style="display: block;">
			<div class="content-top jsContTop">
				<div class="content-container">
					<h1 class="page-title font--kr font--16 font--bd float-left" id="store_title">상품등록</h1>
				</div>
			</div>
		</div>
		<!--// Store Title -->
	</div>




	<div id="flagship_list">

		<div class="store__item">
			<!-- 이미지 수정하기 -->
			<div class="flagship_list">
				<div class="store__content store__content--fs clearfix">
					<div>
						<form name="addProductFrm" enctype="multipart/form-data">
							<table name="productAddTbl" class="table">
								<thead>
								</thead>

								<tbody>
									<tr>
										<th class="table-active">상품종류</th>
										<td>
											<c:forEach var="categoryVo" items="${requestScope.categoryList}">
												<input type="radio" id="category${categoryVo.categoryId}" name="category" value="${categoryVo.categoryId}">
												<label for="category${categoryVo.categoryId}">${categoryVo.categoryName}</label>
											</c:forEach>
											<span class="alert">상품 종류를 선택하세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">상품명</th>
										<td id="productSelector">
											<select name="productName" id="productName">
												<option value="" selected>상품명</option>
											</select>
											<button type="button" class="addProductNameBtn btn btn-secondary">상품명 추가</button>
										</td>
									</tr>
									<tr>
										<th class="table-active">프레임컬러</th>
										<td>
											<select name="frameColor" id="frameColor">
												<option value="" selected>프레임컬러</option>
												<c:forEach var="frameColorVo" items="${requestScope.frameColorList}">
													<option value="${frameColorVo.frameColorId}">${frameColorVo.frameColorKor}</option>
												</c:forEach>
											</select>
											<span class="alert">프레임 컬러를 선택하세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">렌즈컬러</th>
										<td>
											<select name="lenseColor" id="lenseColor">
												<option value="" selected>렌즈컬러</option>
												<c:forEach var="lenseColorVo" items="${requestScope.lenseColorList}">
													<option value="${lenseColorVo.lenseColorId}">${lenseColorVo.lenseColorKor}</option>
												</c:forEach>
											</select>
											<span class="alert">렌즈 컬러를 선택하세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">소재</th>
										<td>
											<c:forEach var="materialVo" items="${requestScope.materialList}">
												<input type="radio" id="${materialVo.materialId}" name="material" value="${materialVo.materialId}">
												<label for="${materialVo.materialId}">${materialVo.materialName}</label>
											</c:forEach>
											<span class="alert">소재를 선택해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">가격</th>
										<td>
											<input type="text" id="price" name="price" autocomplete="off" size="20" value="" placeholder="콤마(,)없이 숫자만 입력하세요">
											원
											<span class="alert">콤마(,)를 제외한 숫자만 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">프레임</th>
										<td>
											<c:forEach var="frameVo" items="${requestScope.frameList}">
												<input type="radio" id="frame${frameVo.frameId}" name="frame" value="${frameVo.frameId}">
												<label for="frame${frameVo.frameId}">${frameVo.frameName}</label>
											</c:forEach>
											<span class="alert">프레임을 선택해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">실루엣</th>
										<td>
											<input type="text" id="silhouette" name="silhouette" value="" placeholder="실루엣을 입력하세요" autocomplete="off">
											<span class="alert">실루엣을 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">디테일</th>
										<td>
											<input type="text" id="detail" name="detail" value="" placeholder="디테일을 입력하세요" autocomplete="off">
											<span class="alert">디테일을 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">템플길이</th>
										<td>
											<input type="text" class="size" id="templeLength" name="templeLength" size="20" value="" autocomplete="off">
											mm
											<span class="alert">템플길이를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">렌즈 가로 사이즈</th>
										<td>
											<input type="text" class="size" id="lenseWidthSize" name="lenseWidthSize" size="20" value="" autocomplete="off">
											mm
											<span class="alert">렌즈 가로 사이즈를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">렌즈 높이 사이즈</th>
										<td>
											<input type="text" class="size" id="lenseHeightSize" name="lenseHeightSize" size="20" value="" autocomplete="off">
											mm
											<span class="alert">렌즈 높이 사이즈를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">프레임 사이즈</th>
										<td>
											<input type="text" class="size" id="frameSize" name="frameSize" size="20" value="" autocomplete="off">
											mm
											<span class="alert">프레임 사이즈를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">브릿지</th>
										<td>
											<input type="text" class="size" id="bridge" name="bridge" size="20" value="" autocomplete="off">
											mm
											<span class="alert">브릿지를 입력해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">젠더</th>
										<td>
											<input type="radio" id="gender1" name="gender" value="1">
											<label for="gender1">남성</label>
											<input type="radio" id="gender2" name="gender" value="2">
											<label for="gender2">여성</label>
											<input type="radio" id="gender3" name="gender" value="3">
											<label for="gender3">관계 없음</label>
											<span class="alert">젠더를 선택해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">미러 여부</th>
										<td>
											<input type="radio" id="isMirror1" name="isMirror" value="1">
											<label for="isMirror1">유</label>
											<input type="radio" id="isMirror2" name="isMirror" value="0">
											<label for="isMirror2">무</label>
											<span class="alert">미러여부를 선택해주세요</span>
										</td>
									</tr>

									<tr>
										<th class="table-active">틴트 여부</th>
										<td>
											<input type="radio" id="isTint1" name="isTint" value="1">
											<label for="isTint1">유</label>
											<input type="radio" id="isTint2" name="isTint" value="0">
											<label for="isTint2">무</label>
											<span class="alert">틴트여부를 선택해주세요</span>
										</td>
									</tr>

									<tr>
										<th class="table-active">블루라이트 차단 여부</th>
										<td>
											<input type="radio" id="isBlueLight1" name="isBlueLight" value="1">
											<label for="isBlueLight1">유</label>
											<input type="radio" id="isBlueLight2" name="isBlueLight" value="0">
											<label for="isBlueLight2">무</label>
											<span class="alert">블루라이트 차단 여부를 선택해주세요</span>
										</td>
									</tr>

									<tr>
										<th class="table-active">인덱스 상품 여부</th>
										<td>
											<input type="radio" id="isIndex1" name="isIndex" value="1" />
											<label for="isIndex1">유</label>
											<input type="radio" id="isIndex2" name="isIndex" value="0">
											<label for="isIndex2">무</label>
											<span class="alert">인덱스 상품 여부를 선택해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">선물 추천 여부</th>
										<td>
											<input type="radio" id="isGift1" name="isGift" value="1" />
											<label for="isGift1">유</label>
											<input type="radio" id="isGift2" name="isGift" value="0">
											<label for="isGift2">무</label>
											<span class="alert">선물 추천 여부를 선택해주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">소개</th>
										<td>
											<!-- 텍스트박스로 수정할지말지 한번 봐보기 -->
											<textarea id="description" name="description" cols="105" rows="8" autocomplete="off"></textarea>
											<span class="alert">소개를 입력하여주세요</span>
											<!-- <input type="text" id="description" name="description" size="100" value=""> -->
										</td>
									</tr>
									<tr>
										<th class="table-active">재고</th>
										<td>
											<input type="number" id="stock" name="stock" value="" min="1" autocomplete="off" />
											개
											<span class="alert">재고를 입력하여주세요</span>
										</td>
									</tr>
									<tr>
										<th class="table-active">대표사진</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="mainImageFile" name="mainImageFile" />
											<span class="alert">대표사진을 첨부하여주세요</span>
											<img class="previewImg" src="" />
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진1<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile1" name="imageFile1" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진2<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile2" name="imageFile2" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진3<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile3" name="imageFile3" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진4<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile4" name="imageFile4" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진5<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile5" name="imageFile5" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
									<tr>
										<th class="table-active">
											상세사진6<br>(상세화면에서 보여질 순서대로 첨부해주세요)
										</th>
										<td>
											<input type="file" accept="image/*" class="imageFile" id="imageFile6" name="imageFile6" />
											<img class="previewImg" src="" />
											<video id="" class="previewImg" autoplay="" loop="" muted="" playsinline="" poster="" style="display:none">
												<source src="" type="video/mp4">
											</video>
										</td>
									</tr>
								</tbody>
							</table>

							<div style="text-align: center; padding: 3%;">

								<button type="reset" class="resetBtn btn btn-secondary" style="width: 200px; height: 40px; font-weight: bold; font-size: 15pt;">리셋</button>
								&nbsp;&nbsp;
								<button type="button" class="addProductBtn btn btn-primary" style="width: 200px; height: 40px; font-weight: bold; font-size: 15pt;">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>









	<!-- 검색용 Modal -->
	<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
	<div class="modal fade" id="addProductModal">
		<div class="modal-dialog" style="max-width: 800px;">
			<div class="modal-content">

				<!-- Modal header -->
				<div class="modal-header">
					<h5 class="modal-title font--kr">등록</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body"></div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
























</div>









<jsp:include page="../common/footer.jsp" />