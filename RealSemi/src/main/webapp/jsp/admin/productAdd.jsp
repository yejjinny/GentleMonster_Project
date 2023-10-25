<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>

<jsp:include page="../common/header_meta.jsp" />
<link rel="stylesheet" href="<%=ctxPath%>/css/admin/productAdd.css">
<!-- JavaScript -->

<title>Stores | GENTLE MONSTER Official Site</title>
<jsp:include page="../common/header.jsp" />




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
						<form name="productAddFrm">						
							<table name="productAddTbl" class="table">
								<thead>
									
	
								</thead>
	
								<tbody>
									<tr>	
										<th class="table-active" >상품종류</th>
										<td >											
											<input type="radio" id="option1"	name="option" value="sunglasses">
											<label for="option1">안경</label>  													 
												 
											<input type="radio" id="option2"	name="option" value="glasses">
											<label for="option2">선글라스</label> 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상품명</th>
										<td>											
											<select name="productName">
												<option value="" hidden>상품명</option>
												<option value="product">헬릭스</option>
												<option value="product">알리오</option>													
											</select>											
										</td>	
									</tr>									
									<tr>	
										<th class="table-active">프레임컬러</th>
										<td>										
											<select name="frameColor">
												<option value="product" hidden>프레임컬러</option>
												<option value="product">화이트</option>
												<option value="product">블랙</option>
												<option value="product">핑크</option>
												<option value="product">그레이</option>
												<option value="product">레드</option>
												<option value="product">브라운</option>
												<option value="product">클리어</option>
												<option value="product">그린</option>
												<option value="product">골드</option>
												<option value="product">블루</option>
												<option value="product">실버</option>
												<option value="product">옐로우</option>
												<option value="product">기타</option>												
											</select>											
										</td>	
									</tr>									
									<tr>	
										<th class="table-active">렌즈컬러</th>
										<td>																				
											<select name="lensColor">
												<option value="product" hidden>렌즈컬러</option>
												<option value="product">블랙</option>
												<option value="product">핑크</option>
												<option value="product">그레이</option>
												<option value="product">레드</option>
												<option value="product">브라운</option>
												<option value="product">베이지</option>
												<option value="product">그린</option>
												<option value="product">클리어</option>
												<option value="product">블루</option>
												<option value="product">실버</option>
												<option value="product">옐로우</option>
												<option value="product">변색</option>
												<option value="product">기타</option>												
											</select>										
										</td>	
									</tr>									
									<tr>	
										<th class="table-active">소재</th>
										<td>																													
											<input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">아세테이트</label>  													 
											 
											<input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">메탈</label> 
											 
											 <input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">콤비</label> 											
										</td>	
									</tr>									
									<tr>
										<th class="table-active">가격</th>
										<td>										
											<input type="text" id="option1"	name="option" size="20" value="">										
										</td>	
									</tr>									
									<tr>	
										<th class="table-active">프레임</th>
										<td>																							 
											<input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">사각</label>  													 
											 
											<input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">캣아이</label> 
											 
											 <input type="radio" id="option1"	name="option" value="1">
											 <label for="option1">원형</label> 											
										</td>	
									</tr>									
									<tr>	
										<th class="table-active">실루엣</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value="">										
										</td>
									</tr>								
									<tr>	
										<th class="table-active">디테일</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value="">									
										</td>	
									</tr>																										
									<tr>
										<th class="table-active">템플길이</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value=""> mm										
										</td>	
									</tr>																										
									<tr>	
										<th class="table-active">렌즈 가로 사이즈</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value=""> mm									
										</td>
									</tr>																		
									<tr>	
										<th class="table-active">렌즈 높이 사이즈</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value=""> mm										
										</td>	
									</tr>
									<tr>	
										<th class="table-active">프레임 사이즈</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value=""> mm									
										</td>	
									</tr>																											
									<tr>	
										<th class="table-active">브릿지</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value=""> mm										
										</td>	
									</tr>
									<tr>	
										<th class="table-active">젠더</th>
										<td>																							 
											<input type="radio" id="gender"	name="gender" value="1">
											 <label for="gender">남자</label>  													 
											 
											<input type="radio" id="gender"	name="gender" value="2">
											 <label for="gender">여자</label> 
											  											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">미러여부</th>
										<td>																							 
											<input type="radio" id="mirror"	name="mirror" value="1">
											 <label for="mirror">유</label>  													 
											 
											<input type="radio" id="mirror"	name="mirror" value="2">
											 <label for="mirror">무</label> 
											  											
										</td>	
									</tr>
									
									<tr>	
										<th class="table-active">틴트여부</th>
										<td>																							 
											<input type="radio" id="tint"	name="tint" value="1">
											  <label for="tint">유</label>  													 
											 
											<input type="radio" id="tint"	name="tint" value="2">
											 <label for="tint">무</label>  
											  											
										</td>	
									</tr>
									
									<tr>	
										<th class="table-active">블루라이트차단 여부</th>
										<td>																							 
											<input type="radio" id="blueLight"	name="blueLight" value="1">
											  <label for="blueLight">유</label> 													 
											 
											<input type="radio" id="blueLight"	name="blueLight" value="2">
											 <label for="blueLight">무</label> 
											  											
										</td>	
									</tr>
									
									<tr>	
										<th class="table-active">인덱스 상품여부</th>
										<td>																							 
											<input type="radio" id="index"	name="index" value="1">
											<label for="index">유</label>   													 
											 
											<input type="radio" id="index"	name="index" value="2">
											<label for="index">무</label>  
											  											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">소개</th>
										<td>											
											<input type="text" id="option1"	name="option" size="20" value="">										
										</td>	
									</tr>
									<tr>	
										<th class="table-active">재고</th>
										<td>																							 
											<input type="number" id="option1"	name="option" value="">
																							 											 																						
										</td>	
									</tr>
									<tr>	
										<th class="table-active">대표사진</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진1</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진2</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진3</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진4</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진5</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
									<tr>	
										<th class="table-active">상세사진5</th>
										<td>																							 
											<input type="file" id="option1"	name="option" value="1">
											 											
										</td>	
									</tr>
								</tbody>			
							</table>
							
							<div style="text-align: center; padding: 3%;">
							
								<button type="button" class="btn btn-secondary" style="width: 200px; height: 40px; font-weight: bold; font-size: 15pt;">리셋</button>&nbsp;&nbsp;
								<button type="button" class="btn btn-primary" style="width: 200px; height: 40px;  font-weight: bold; font-size: 15pt;">등록</button>
							</div>
						</form>
					</div>



				</div>
			</div>
		</div>
	</div>


































</div>









<jsp:include page="../common/footer.jsp" />