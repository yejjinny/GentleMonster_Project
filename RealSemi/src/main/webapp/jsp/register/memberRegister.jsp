<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
						<!--  
						<button type="button" class="show-pwd" id="show-pwd" onclick="clickPasswordEye(this, $('#password'))">
							<span class="viewpass eye-slash"></span>
						</button>
						-->
					</div>
					
					<!-- 비밀번호 확인 -->
					<div id="mbPwRe" class="input-box">
						<p class="input-label font--kr font--13 font--rg">비밀번호 확인</p>
						<input type="password" name="pwd_re" id="pwd_re" class="requiredInfo font--kr font--13 font--rg rg-input input-pwd input-box-style" >
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
						<!--
						<button type="button" class="show-pwd" id="show-pwd-re" onclick="clickPasswordEye(this, $('#password_re'))">
							<span class="viewpass eye-slash"></span>
						</button>
						-->
					</div>
				
				
					<!-- 성별 -->
					<div class="field_info info_mtzero">
						<div class="input-box">
							<label for="mbGender" class="input-label font--kr font--13 font--rg">성별 (선택)</label>
							<div id="mbGender" class="select-box">
								<!--  
								<div class="pc-select">
									<span class="current height_40"> 성별을 선택해 주세요 </span>
									<div class="option-list">
										<div class="list-inner">
											<ul>
												<li data-value="1">남성</li>
												<li data-value="2">여성</li>
											</ul>
										</div>
									</div>
								</div>
								-->
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
							<!--?
							$month = intval($register_data['mb_birth_month'] ?? '');
							$day = intval($register_data['mb_birth_day'] ?? '');
							$getYear = intval($register_data['mb_birth_year'] ?? '');
							?-->
							<div id="birthYear" class="select-box">
								<!--  
								<div class="pc-select">
									<span class="current height_40"> </span>
									<div class="option-list">
										<div class="list-inner">
											<ul>											
												<li data-year="2007">2007</li>
												<li data-year="2006">2006</li>
												<li data-year="2005">2005</li>
												<li data-year="2004">2004</li>
												<li data-year="2003">2003</li>
												<li data-year="2002">2002</li>
												<li data-year="2001">2001</li>
												<li data-year="2000">2000</li>
												<li data-year="1999">1999</li>
												<li data-year="1998">1998</li>
												<li data-year="1997">1997</li>
												<li data-year="1996">1996</li>
												<li data-year="1995">1995</li>
												<li data-year="1994">1994</li>
												<li data-year="1993">1993</li>
												<li data-year="1992">1992</li>
												<li data-year="1991">1991</li>
												<li data-year="1990">1990</li>
												<li data-year="1989">1989</li>
												<li data-year="1988">1988</li>
												<li data-year="1987">1987</li>
												<li data-year="1986">1986</li>
												<li data-year="1985">1985</li>
												<li data-year="1984">1984</li>
												<li data-year="1983">1983</li>
												<li data-year="1982">1982</li>
												<li data-year="1981">1981</li>
												<li data-year="1980">1980</li>
												<li data-year="1979">1979</li>
												<li data-year="1978">1978</li>
												<li data-year="1977">1977</li>
												<li data-year="1976">1976</li>
												<li data-year="1975">1975</li>
												<li data-year="1974">1974</li>
												<li data-year="1973">1973</li>
												<li data-year="1972">1972</li>
												<li data-year="1971">1971</li>
												<li data-year="1970">1970</li>
												<li data-year="1969">1969</li>
												<li data-year="1968">1968</li>
												<li data-year="1967">1967</li>
												<li data-year="1966">1966</li>
												<li data-year="1965">1965</li>
												<li data-year="1964">1964</li>
												<li data-year="1963">1963</li>
												<li data-year="1962">1962</li>
												<li data-year="1961">1961</li>
												<li data-year="1960">1960</li>
												<li data-year="1959">1959</li>
												<li data-year="1958">1958</li>
												<li data-year="1957">1957</li>
												<li data-year="1956">1956</li>
												<li data-year="1955">1955</li>
												<li data-year="1954">1954</li>
												<li data-year="1953">1953</li>
												<li data-year="1952">1952</li>
												<li data-year="1951">1951</li>
												<li data-year="1950">1950</li>
												<li data-year="1949">1949</li>
												<li data-year="1948">1948</li>
												<li data-year="1947">1947</li>
												<li data-year="1946">1946</li>
												<li data-year="1945">1945</li>
												<li data-year="1944">1944</li>
												<li data-year="1943">1943</li>
												<li data-year="1942">1942</li>
												<li data-year="1941">1941</li>
												<li data-year="1940">1940</li>
												<li data-year="1939">1939</li>
												<li data-year="1938">1938</li>
												<li data-year="1937">1937</li>
												<li data-year="1936">1936</li>
												<li data-year="1935">1935</li>
												<li data-year="1934">1934</li>
												<li data-year="1933">1933</li>
												<li data-year="1932">1932</li>
												<li data-year="1931">1931</li>
												<li data-year="1930">1930</li>
												<li data-year="1929">1929</li>
												<li data-year="1928">1928</li>
												<li data-year="1927">1927</li>
												<li data-year="1926">1926</li>
												<li data-year="1925">1925</li>
												<li data-year="1924">1924</li>
												<li data-year="1923">1923</li>
												<li data-year="1922">1922</li>
												<li data-year="1921">1921</li>
											</ul>
										</div>
									</div>
								</div>
								-->
								<select class="requiredInfo mo-select rg-input font--13 font--kr"
									name="mb_birth_year" id="mb_birth_year">
									<option value="">년</option>  
									<option value="2007">2007</option>
									<option value="2006">2006</option>
									<option value="2005">2005</option>
									<option value="2004">2004</option>
									<option value="2003">2003</option>
									<option value="2002">2002</option>
									<option value="2001">2001</option>
									<option value="2000">2000</option>
									<option value="1999">1999</option>
									<option value="1998">1998</option>
									<option value="1997">1997</option>
									<option value="1996">1996</option>
									<option value="1995">1995</option>
									<option value="1994">1994</option>
									<option value="1993">1993</option>
									<option value="1992">1992</option>
									<option value="1991">1991</option>
									<option value="1990">1990</option>
									<option value="1989">1989</option>
									<option value="1988">1988</option>
									<option value="1987">1987</option>
									<option value="1986">1986</option>
									<option value="1985">1985</option>
									<option value="1984">1984</option>
									<option value="1983">1983</option>
									<option value="1982">1982</option>
									<option value="1981">1981</option>
									<option value="1980">1980</option>
									<option value="1979">1979</option>
									<option value="1978">1978</option>
									<option value="1977">1977</option>
									<option value="1976">1976</option>
									<option value="1975">1975</option>
									<option value="1974">1974</option>
									<option value="1973">1973</option>
									<option value="1972">1972</option>
									<option value="1971">1971</option>
									<option value="1970">1970</option>
									<option value="1969">1969</option>
									<option value="1968">1968</option>
									<option value="1967">1967</option>
									<option value="1966">1966</option>
									<option value="1965">1965</option>
									<option value="1964">1964</option>
									<option value="1963">1963</option>
									<option value="1962">1962</option>
									<option value="1961">1961</option>
									<option value="1960">1960</option>
									<option value="1959">1959</option>
									<option value="1958">1958</option>
									<option value="1957">1957</option>
									<option value="1956">1956</option>
									<option value="1955">1955</option>
									<option value="1954">1954</option>
									<option value="1953">1953</option>
									<option value="1952">1952</option>
									<option value="1951">1951</option>
									<option value="1950">1950</option>
									<option value="1949">1949</option>
									<option value="1948">1948</option>
									<option value="1947">1947</option>
									<option value="1946">1946</option>
									<option value="1945">1945</option>
									<option value="1944">1944</option>
									<option value="1943">1943</option>
									<option value="1942">1942</option>
									<option value="1941">1941</option>
									<option value="1940">1940</option>
									<option value="1939">1939</option>
									<option value="1938">1938</option>
									<option value="1937">1937</option>
									<option value="1936">1936</option>
									<option value="1935">1935</option>
									<option value="1934">1934</option>
									<option value="1933">1933</option>
									<option value="1932">1932</option>
									<option value="1931">1931</option>
									<option value="1930">1930</option>
									<option value="1929">1929</option>
									<option value="1928">1928</option>
									<option value="1927">1927</option>
									<option value="1926">1926</option>
									<option value="1925">1925</option>
									<option value="1924">1924</option>
									<option value="1923">1923</option>
									<option value="1922">1922</option>
									<option value="1921">1921</option>
								</select> 
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
							<!--// 년 -->
							<!-- 월 -->
							<div id="birthMonth" class="select-box">
								<!--  
								<div class="pc-select">
									<span class="current height_40 font--kr font--13 font--rg">
									</span>
									<div class="option-list">
										<div class="list-inner">
											<ul>
												<li data-month="01">01</li>
												<li data-month="02">02</li>
												<li data-month="03">03</li>
												<li data-month="04">04</li>
												<li data-month="05">05</li>
												<li data-month="06">06</li>
												<li data-month="07">07</li>
												<li data-month="08">08</li>
												<li data-month="09">09</li>
												<li data-month="10">10</li>
												<li data-month="11">11</li>
												<li data-month="12">12</li>
											</ul>
										</div>
									</div>
								</div>
								-->
								<select class="requiredInfo mo-select rg-input font--kr font--13 font--rg"
									name="mb_birth_month" id="mb_birth_month">
									<option value="">월</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select> 
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
							<!--// 월 -->
							<!-- 일 -->
							<div id="birthDay" class="select-box">
								<!--  
								<div class="pc-select">
									<span class="current height_40 font--kr font--13 font--rg">
									</span>
									<div class="option-list">
										<div class="list-inner">
											<ul class="font--kr font--13">
												<li data-day="01">01</li>
												<li data-day="02">02</li>
												<li data-day="03">03</li>
												<li data-day="04">04</li>
												<li data-day="05">05</li>
												<li data-day="06">06</li>
												<li data-day="07">07</li>
												<li data-day="08">08</li>
												<li data-day="09">09</li>
												<li data-day="10">10</li>
												<li data-day="11">11</li>
												<li data-day="12">12</li>
												<li data-day="13">13</li>
												<li data-day="14">14</li>
												<li data-day="15">15</li>
												<li data-day="16">16</li>
												<li data-day="17">17</li>
												<li data-day="18">18</li>
												<li data-day="19">19</li>
												<li data-day="20">20</li>
												<li data-day="21">21</li>
												<li data-day="22">22</li>
												<li data-day="23">23</li>
												<li data-day="24">24</li>
												<li data-day="25">25</li>
												<li data-day="26">26</li>
												<li data-day="27">27</li>
												<li data-day="28">28</li>
												<li data-day="29">29</li>
												<li data-day="30">30</li>
												<li data-day="31">31</li>
											</ul>
										</div>
									</div>
								</div>
								-->
								<select class="requiredInfo mo-select rg-input font--kr font--13 font--rg"
									name="mb_birth_day" id="mb_birth_day">
									<option value="">일</option>
									<option value="01">01</option>
									<option value="02">02</option>
									<option value="03">03</option>
									<option value="04">04</option>
									<option value="05">05</option>
									<option value="06">06</option>
									<option value="07">07</option>
									<option value="08">08</option>
									<option value="09">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
									<option value="13">13</option>
									<option value="14">14</option>
									<option value="15">15</option>
									<option value="16">16</option>
									<option value="17">17</option>
									<option value="18">18</option>
									<option value="19">19</option>
									<option value="20">20</option>
									<option value="21">21</option>
									<option value="22">22</option>
									<option value="23">23</option>
									<option value="24">24</option>
									<option value="25">25</option>
									<option value="26">26</option>
									<option value="27">27</option>
									<option value="28">28</option>
									<option value="29">29</option>
									<option value="30">30</option>
									<option value="31">31</option>
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
						<!-- 한국 -->
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
					
					<!-- D :: 카카오 플러스 친구 -->
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
               <h5 class="modal-title font--kr">이용약관</h5>
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