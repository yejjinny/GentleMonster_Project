<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<%
    String ctxPath = request.getContextPath();
	//	/tempSemi
%>

<jsp:include page="../common/header_meta.jsp" />


<link rel="stylesheet" href="<%=ctxPath%>/css/register/memberRegister.css">

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/js/register/memberRegister.js"></script>

<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../common/header.jsp" />


<div class="container_sq register_page">
	<div>
		<div class="center_wrap account contentswrap register max_width_440" style="min-height: 963">
			<div class="register-wrap">
				
				<form id="memberRegisterFrm" name="memberRegisterFrm" autocomplete="off" action="<%= ctxPath%>/register/memberRegister.gm" method="post">	
				
					<input type="hidden" name="w" value=""> <input type="hidden" name="url" value="register_new.html"> <input type="hidden" name="agree" value=""> <input type="hidden" name="agree2" value=""> <input type="hidden" name="cert_type" value=""> <input type="hidden" name="flag" value=""> <input type="hidden" name="is_begin_checkout" value="">
					<p class="register-title font--kr font--15 font--bd account-font-kr">신규 회원가입</p>
					
					<!-- 이메일 -->
					<div id="mbEmail" class="input-box">
						<p class="input-label font--kr font--13 font--rg">이메일 주소</p>
						<input type="text" name="email" id="email" class="requiredInfo font--kr font--12 font--rg rg-input input-box-style" style="letter-spacing: 0em;"> 
						<button type="button" id="emailCheck" style="background-color: #999999;">이메일 중복확인</button><br>
						<span id="emailCheckResult"></span>
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
					
					<!-- 이메일 확인 -->
					<div id="mbEmail" class="input-box">
						<p class="input-label font--kr font--13 font--rg">이메일 주소 확인</p>
						<input type="text" name="email_check" id="email_check" class="requiredInfo font--kr font--12 font--rg rg-input input-box-style" style="letter-spacing: 0em;">
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
					
					<!-- 비밀번호 -->
					<div id="mbPw" class="input-box">
						<p class="input-label font--kr font--13 font--rg">비밀번호</p>
						<input type="password" name="pwd" id="pwd" class="requiredInfo font--kr font--13 font--rg rg-input input-pwd input-box-style" >
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div id="mbPwRe" class="input-box">
						<p class="input-label font--kr font--13 font--rg">비밀번호 확인</p>
						<input type="password" name="pwd_re" id="pwd_re" class="requiredInfo font--kr font--13 font--rg rg-input input-pwd input-box-style" >
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
				
				
					<div class="field_info info_mtzero">
						<!-- 성별 -->
						<div class="input-box">
							<label for="mbGender" class="input-label font--kr font--13 font--rg">성별 (선택)</label>
							<div id="mbGender" class="select-box">
								<select class="mo-select rg-input font--kr font--13" name="gender" id="mb_gender">
									<option value="3" selected="">성별을 선택해 주세요</option>
									<option value="1">남성</option>
									<option value="2">여성</option>
								</select>
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
						</div>					 
					  	
					 
						<!-- 이름 -->
						<div id="mbName" class="box-group box-group-child-2">
							<div class="input-box">
								<p class="input-label font--kr font--13 font--rg">성</p>
								<input type="text" name="familyName" id="familyName"
									class="requiredInfo font--kr font--13 font--rg rg-input input-box-style"
									maxlength="2"
									>
								<span class="error font--kr font--11">필수 입력란 입니다.</span>
							</div>
							<div class="input-box">
								<p class="input-label font--kr font--13 font--rg">이름</p>
								<input type="text" name="lastName" id="lastName"
									class="requiredInfo font--kr font--13 font--rg rg-input input-box-style"
									maxlength="6"
									>
								<span class="error font--kr font--11">필수 입력란 입니다.</span>
							</div>
						</div>
						
						
						<!-- 생년월일 -->
						<div class="box-group box-group-child-3">
							<label class="input-label font--kr font--13 font--rg">
								생년월일 </label>
							<!-- 년 -->
							<div id="birthYear" class="select-box">
								<select class="requiredInfo mo-select rg-input font--13 font--kr" name="mb_birth_year" id="mb_birth_year">
									<option value="">년</option>  
									<c:forEach var="i" begin="1920" end="2010">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> 
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
							<!--// 년 -->
							<!-- 월 -->
							<div id="birthMonth" class="select-box">
								<select class="requiredInfo mo-select rg-input font--kr font--13 font--rg" name="mb_birth_month" id="mb_birth_month">
									<option value="">월</option>  
									<c:forEach var="i" begin="1" end="12">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> 
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
							<!--// 월 -->
							<!-- 일 -->
							<div id="birthDay" class="select-box">
								<select class="requiredInfo mo-select rg-input font--kr font--13 font--rg" name="mb_birth_day" id="mb_birth_day">
									<option value="">일</option>  
									<c:forEach var="i" begin="1" end="31">
										<option value="${i}">${i}</option>
									</c:forEach>
								</select> 
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
							<!--// 일 -->
						</div>
					</div>


					<!-- 약관(개인정보 처리 방침) -->
					<div class="agreement agreement-group group_mttype01">
						<div class="input-box">
							<label for="check_all">
								<input type="checkbox" class="terms_all rg-input" id="check_all" name="check_all" value="T">
								<!-- <div class="input-box-check-layer"></div> -->
								<span class="font--kr font--13 font--rg">전체 동의</span>
							</label>
						</div>
						<div class="input-box">
							<label for="age">
								<input type="checkbox" class="terms rg-input" id="agreement_age" name="agreement_age" >
								<!-- <div class="input-box-check-layer"></div> -->
								<span class="font--kr font--13 font--rg"> [필수] 만 14세 이상입니다 </span>
							</label>
						</div>
						<div class="input-box">
							<label for="terms">
								<input type="checkbox" class="terms rg-input" id="agreement_terms" name="terms" value="T" data-required="" aria-required="true" aria-invalid="false">
								<!-- <div class="input-box-check-layer"></div> -->
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none" target="_blank" >
										<u class="atag-line display-unset" data-toggle="modal" data-target="#legalModal">[필수] 이용약관 동의 </u>
									</a>
								</span>
							</label>
						</div>
						<div class="input-box">
							<label for="privacy_policy">
								<input type="checkbox" class="terms rg-input" id="agreement_privacy_policy" name="privacy_policy" value="T" data-required="" aria-required="true" aria-invalid="false">
								<!-- <div class="input-box-check-layer"></div> -->
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none;" target="_blank" >
										<u class="atag-line display-unset" data-toggle="modal" data-target="#privacyModal">[필수] 개인정보 수집 및 이용 동의</u>
									</a>
								</span>
							</label>
						</div>
					</div>
					
					
					<div class="register-submit-wrap button-group section-row">
						<button type="button" class="button font--kr font--13 font--rg" onclick="location.href='<%= ctxPath%>/index.gm'">
							취소
						</button>
						<button type="button" id="btn_memberRegister" class="login_bt button button-primary gm-component__spinner-container font--kr font--13 font--rg" accesskey="s" onclick="goRegister()" >
							<div class="cart-loading gm-component__spinner-wrapper">
								<div class="gm-component__spinner dark"></div>
							</div>
							<span>계정생성</span>
						</button>
					</div>
					
				</form>
				
			</div>
		</div>
	</div>

</div>


   <!-- ///////////////////////////////////////// 모달 ///////////////////////////////////////// -->
   <!-- 이용약관 Modal -->
   <!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
   <div class="modal fade" id="legalModal">
      <div class="modal-dialog" style="max-width: 600px;">
         <div class="modal-content">

            <!-- Modal header -->
            <div class="modal-header">
               <h5 class="modal-title font--kr">이용약관</h5>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
               <iframe style="width: 100%; height: 600px;" src="<%=ctxPath%>/common/modal.gm?modalName=legalModal"> </iframe>
            </div>


            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>
   
   
   <!-- 개인정보수집 Modal -->
   <!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
   <div class="modal fade" id="privacyModal">
      <div class="modal-dialog" style="max-width: 1000px;">
         <div class="modal-content">

            <!-- Modal header -->
            <div class="modal-header">
               <h5 class="modal-title font--kr">개인정보수집</h5>
               <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
               <iframe style="width: 100%; height: 500px;" src="<%=ctxPath%>/common/modal.gm?modalName=privacyModal"> </iframe>
            </div>


            <!-- Modal footer -->
            <div class="modal-footer">
               <button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
            </div>
         </div>
      </div>
   </div>


<jsp:include page="../common/footer.jsp" />