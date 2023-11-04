<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
	//	/tempSemi
%>

<jsp:include page="../common/header_meta.jsp" />


<link rel="stylesheet" href="<%=ctxPath%>/css/register/memberRegister.css">

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.7.1.min.js"></script>
<%-- <script type="text/javascript" src="<%= ctxPath%>/js/register/memberRegister.js"></script> --%>
<script type="text/javascript" src="<%= ctxPath%>/js/register/real.js"></script>

<title>GENTLE MONSTER Official Site</title>

<jsp:include page="../common/header.jsp" />


<div class="container_sq register_page">
	<div>
		<div class="center_wrap account contentswrap register max_width_440" style="min-height: 963">
			<div class="register-wrap">
				<form id="fregisterform" name="fregisterform" action="https://www.gentlemonster.com/kr/customer/create_account" onsubmit="return fregisterform_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off">
					
					<input type="hidden" name="w" value=""> <input type="hidden" name="url" value="register_new.html"> <input type="hidden" name="agree" value=""> <input type="hidden" name="agree2" value=""> <input type="hidden" name="cert_type" value=""> <input type="hidden" name="flag" value=""> <input type="hidden" name="is_begin_checkout" value="">
					<p class="register-title font--kr font--15 font--bd account-font-kr">신규 회원가입</p>
					
					<!-- 이메일 -->
					<div id="mbEmail" class="input-box">
						<p class="input-label font--kr font--13 font--rg">이메일 주소</p>
						<input type="text" name="email" id="email" class="font--kr font--12 font--rg rg-input input-box-style" style="letter-spacing: 0em;"> 
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
					
					<!-- 이메일 확인 -->
					<div id="mbEmail" class="input-box">
						<p class="input-label font--kr font--13 font--rg">이메일 주소 확인</p>
						<input type="text" name="email_check" id="email_check" class="font--kr font--12 font--rg rg-input input-box-style" style="letter-spacing: 0em;" onkeyup="register_autovalid_check('email_check_form',this.value)"> 
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
					</div>
					
					<!-- 비밀번호 -->
					<div id="mbPw" class="input-box">
						<p class="input-label font--kr font--13 font--rg">비밀번호</p>
						<input type="password" name="mb_password" id="password" class="font--kr font--13 font--rg rg-input input-pwd input-box-style" onkeyup="register_autovalid_check('password_validation',this.value)"> 
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
						<button type="button" class="show-pwd" id="show-pwd" onclick="clickPasswordEye(this, $('#password'))">
							<span class="viewpass eye-slash"></span>
						</button>
					</div>
					
					<!-- 비밀번호 확인 -->
					<div id="mbPwRe" class="input-box">
						<p class="input-label font--kr font--13 font--rg">비밀번호 확인</p>
						<input type="password" name="mb_password_re" id="password_re" class="font--kr font--13 font--rg rg-input input-pwd input-box-style" onkeyup="register_autovalid_check('password_form',this.value)"> 
						<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
						<button type="button" class="show-pwd" id="show-pwd-re" onclick="clickPasswordEye(this, $('#password_re'))">
							<span class="viewpass eye-slash"></span>
						</button>
					</div>
					
					<div id="pw_pattern" style="display: none" class="ruletxt-box">
						<div class="font--rg" style="font-size: 13px;">다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.</div>
						<div style="margin: 14px 0px 15px 0px; color: gray">
							<p id="length_8" class="font--kr font--13 font--rg">최소 8자 이상</p>
							<p id="capital_1" class="font--kr font--13 font--rg">최소 1개의 대문자 사용</p>
							<p id="special_chactor_1" class="font--kr font--13 font--rg">최소 1개의 특수문자 사용</p>
							<p id="number_1" class="font--kr font--13 font--rg">최소 1개의 숫자 사용</p>
						</div>
					</div>
					
					
					<!-- 성별 -->
					<div class="field_info info_mtzero">
						<div class="input-box">
							<label for="mbGender" class="input-label font--kr font--13 font--rg">성별 (선택)</label>
							<div id="mbGender" class="select-box">
								<div class="pc-select">
									<span class="current height_40"> 성별을 선택해 주세요 </span>
									<div class="option-list">
										<div class="list-inner">
											<ul>
												<li data-value="M">남성</li>
												<li data-value="F">여성</li>
											</ul>
										</div>
									</div>
								</div>
								<select class="mo-select rg-input font--kr font--13" name="mb_sex" id="mb_gender">
									<option value="" selected="" disabled="">성별을 선택해 주세요</option>
									<option value="M">남성</option>
									<option value="F">여성</option>
								</select>
								<span class="error font--kr font--11 font--rg">필수 입력란 입니다.</span>
							</div>
						</div>
					 
					 
						<!-- 이름 -->
						<div id="mbName" class="box-group box-group-child-2">
							<div class="input-box">
								<p class="input-label font--kr font--13 font--rg">성</p>
								<input type="text" name="mb_lname"
									class="font--kr font--13 font--rg rg-input input-box-style"
									maxlength="2"
									onkeyup="register_autovalid_check('lname_form',this.value)">
								<span class="alert font--kr font--11" data-alert="필수 입력란 입니다."></span>
							</div>
							<div class="input-box">
								<p class="input-label font--kr font--13 font--rg">이름</p>
								<input type="text" name="mb_fname"
									class="font--kr font--13 font--rg rg-input input-box-style"
									maxlength="6"
									onkeyup="register_autovalid_check('fname_form',this.value)">
								<span class="alert font--kr font--11" data-alert="필수 입력란 입니다."></span>
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
								<select class="mo-select rg-input font--13 font--kr"
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
								</select> <span class="alert font--kr font--11 font--rg"
									data-alert="필수 입력란 입니다."></span>
							</div>
							<!--// 년 -->
							<!-- 월 -->
							<div id="birthMonth" class="select-box">
								<div class="pc-select">
									<span class="current height_40 font--kr font--13 font--rg">
									</span>
									<div class="option-list">
										<div class="list-inner">
											<ul>
												<li data-month="1">1</li>
												<li data-month="2">2</li>
												<li data-month="3">3</li>
												<li data-month="4">4</li>
												<li data-month="5">5</li>
												<li data-month="6">6</li>
												<li data-month="7">7</li>
												<li data-month="8">8</li>
												<li data-month="9">9</li>
												<li data-month="10">10</li>
												<li data-month="11">11</li>
												<li data-month="12">12</li>
											</ul>
										</div>
									</div>
								</div>
								<select class="mo-select rg-input font--kr font--13 font--rg"
									name="mb_birth_month" id="mb_birth_month">
									<option value="">월</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select> <span class="alert font--kr font--11 font--rg"
									data-alert="필수 입력란 입니다."></span>
							</div>
							<!--// 월 -->
							<!-- 일 -->
							<div id="birthDay" class="select-box">
								<div class="pc-select">
									<span class="current height_40 font--kr font--13 font--rg">
									</span>
									<div class="option-list">
										<div class="list-inner">
											<ul class="font--kr font--13">
												<li data-day="1">1</li>
												<li data-day="2">2</li>
												<li data-day="3">3</li>
												<li data-day="4">4</li>
												<li data-day="5">5</li>
												<li data-day="6">6</li>
												<li data-day="7">7</li>
												<li data-day="8">8</li>
												<li data-day="9">9</li>
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
								<select class="mo-select rg-input font--kr font--13 font--rg"
									name="mb_birth_day" id="mb_birth_day">
									<option value="">일</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
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
								</select> <span class="alert font--kr font--11 font--rg"
									data-alert="필수 입력란 입니다."></span>
							</div>
							<!--// 일 -->
						</div>
					</div>

						<!-- 약관(개인정보 처리 방침) -->
					<div class="agreement agreement-group group_mttype01">
						<div class="input-box input-box-check" style="visibility: visible">
							<label for="check_all">
								<input type="checkbox" class="terms_all rg-input" id="check_all" name="check_all" value="T">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg">전체 동의</span>
							</label>
						</div>
						<!-- 한국 -->
						<div class="input-box input-box-check">
							<label for="age">
								<input type="checkbox" class="terms rg-input" id="age" name="age" value="T" data-required="" aria-required="true" aria-invalid="false">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg"> [필수] 만 14세 이상입니다 </span>
							</label>
						</div>
						<div class="input-box input-box-check">
							<label for="terms">
								<input type="checkbox" class="terms rg-input" id="terms" name="terms" value="T" data-required="" aria-required="true" aria-invalid="false">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none" target="_blank" href="https://www.gentlemonster.com/kr/legal/terms">
										<u class="atag-line display-unset">[필수] 이용약관 동의 </u>
									</a>
								</span>
							</label>
						</div>
						<div class="input-box input-box-check">
							<label for="privacy_policy">
								<input type="checkbox" class="terms rg-input" id="privacy_policy" name="privacy_policy" value="T" data-required="" aria-required="true" aria-invalid="false">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none;" target="_blank" href="https://www.gentlemonster.com/kr/legal/privacy_collect?case=account_register">
										<u class="atag-line display-unset">[필수] 개인정보 수집 및 이용 동의</u>
									</a>
								</span>
							</label>
						</div>
						<div class="input-box input-box-check">
							<label for="marketing_check">
								<input type="checkbox" class="terms terms--marketing rg-input" id="marketing_check" name="marketing_check" value="T">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none;" target="_blank" href="https://www.gentlemonster.com/kr/legal/privacy_collect_marketing?case=account_register">
										<u class="atag-line display-unset">[선택] 마케팅 목적 개인정보 수집 및 이용 동의</u>
									</a>
								</span>
							</label>
						</div>
						<div class="input-box input-box-check">
							<label for="marketing_info">
								<input type="checkbox" class="terms terms--marketing rg-input" id="marketing_info" name="marketing_info" value="T">
								<div class="input-box-check-layer"></div>
								<span class="font--kr font--13 font--rg"> <a style="text-decoration: none;" target="_blank" href="https://www.gentlemonster.com/kr/legal/marketing_consent">
										<u class="atag-line display-unset">[선택] 마케팅 정보 수신 및 활용 동의</u>
									</a>
								</span>
							</label>
						</div>
						



					</div>
					<!-- D :: 카카오 플러스 친구 -->
					<div class="register-submit-wrap button-group section-row">
						<button type="button" class="button font--kr font--13 font--rg" onclick="location.href='<%= ctxPath%>/jsp/common/index.jsp'">
							취소
						</button>
						<button type="button" class="login_bt button button-primary gm-component__spinner-container font--kr font--13 font--rg" id="btn_dd" accesskey="s">
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

	<!-- <script src="https://www.gentlemonster.com/kr/assets/js/lib/libphonenumber-js/libphonenumber-mobile.js" defer=""></script>
	<script src="https://www.gentlemonster.com/kr/assets/js/bluebird.min.js" defer=""></script> -->
</div>


<!-- <script src="https://www.gentlemonster.com/kr/assets/js/renew2022/common/input-control.js?ver=230915_3"></script>
<script>
	document.addEventListener('DOMContentLoaded', function () {
		var get_register_data = [];
			});
</script>

<script type="text/javascript">
	/** Array.from polyfill */
	// Production steps of ECMA-262, Edition 6, 22.1.2.1
	if (!Array.from) {
		Array.from = (function () {
			var toStr = Object.prototype.toString;
			var isCallable = function (fn) {
				return typeof fn === 'function' || toStr.call(fn) === '[object Function]';
			};
			var toInteger = function (value) {
				var number = Number(value);
				if (isNaN(number)) {
					return 0;
				}
				if (number === 0 || !isFinite(number)) {
					return number;
				}
				return (number > 0 ? 1 : -1) * Math.floor(Math.abs(number));
			};
			var maxSafeInteger = Math.pow(2, 53) - 1;
			var toLength = function (value) {
				var len = toInteger(value);
				return Math.min(Math.max(len, 0), maxSafeInteger);
			};

			// The length property of the from method is 1.
			return function from(arrayLike /*, mapFn, thisArg */) {
				// 1. Let C be the this value.
				var C = this;

				// 2. Let items be ToObject(arrayLike).
				var items = Object(arrayLike);

				// 3. ReturnIfAbrupt(items).
				if (arrayLike == null) {
					throw new TypeError('Array.from requires an array-like object - not null or undefined');
				}

				// 4. If mapfn is undefined, then let mapping be false.
				var mapFn = arguments.length > 1 ? arguments[1] : void undefined;
				var T;
				if (typeof mapFn !== 'undefined') {
					// 5. else
					// 5. a If IsCallable(mapfn) is false, throw a TypeError exception.
					if (!isCallable(mapFn)) {
						throw new TypeError(
							'Array.from: when provided, the second argument must be a function');
					}

					// 5. b. If thisArg was supplied, let T be thisArg; else let T be undefined.
					if (arguments.length > 2) {
						T = arguments[2];
					}
				}

				// 10. Let lenValue be Get(items, "length").
				// 11. Let len be ToLength(lenValue).
				var len = toLength(items.length);

				// 13. If IsConstructor(C) is true, then
				// 13. a. Let A be the result of calling the [[Construct]] internal method
				// of C with an argument list containing the single item len.
				// 14. a. Else, Let A be ArrayCreate(len).
				var A = isCallable(C) ? Object(new C(len)) : new Array(len);

				// 16. Let k be 0.
				var k = 0;
				// 17. Repeat, while k < len… (also steps a - h)
				var kValue;
				while (k < len) {
					kValue = items[k];
					if (mapFn) {
						A[k] = typeof T === 'undefined' ? mapFn(kValue, k) : mapFn.call(T, kValue, k);
					} else {
						A[k] = kValue;
					}
					k += 1;
				}
				// 18. Let putStatus be Put(A, "length", len, true).
				A.length = len;
				// 20. Return A.
				return A;
			};
		}());
	}

	// 전화번호 스크립트 추가 : 김태웅
	document.addEventListener('DOMContentLoaded', function () {
		var initialRegion = 'us'.toUpperCase(),
			phoneValidation = new libphonenumber.AsYouType(initialRegion);

		var $regionSelect = $('#mbRegion mo-select'),
			$mbTel = $('#mb_tel');
		/** (\d+) 문자열 일시에 )가 지워지지 않는 현상 감지 */
		var regex = /\(\d+$/;
		$mbTel.on('input', function (e) {
			var $input = $(this);
			phoneValidation.reset();
			var inputValue = $(this).val();
			/** CN Phone Number 12자리부터 autofill 비활성화 */
			var onlyNumber = inputValue.replace(/[^0-9]+/g, '');
			var isInvalidPhoneForCn = initialRegion === 'CN' && onlyNumber.length >= 12;
			var parseValue = phoneValidation.input(inputValue);

			$input.val(
				isInvalidPhoneForCn
					? onlyNumber
					: regex.test(inputValue) ? inputValue : parseValue
			);
		});
	});


	var saveflag = 1;
	var email_check = false;
	var inputBirth = document.querySelector('[name="mb_birth"]');
	var birthYear = document.getElementById('birthYear');
	var birthMonth = document.getElementById('birthMonth');
	var birthDay = document.getElementById('birthDay');
	var mbGender = document.getElementById('mbGender');
	var regionWrap = document.getElementById('mbRegion');
	var genders = Array.from(document.querySelectorAll('.gender-check'));
	var genderAlert = document.getElementById('mbGender').querySelector('.alert');
	//var mbTelRegion = document.getElementById('mb_tel_region');
	var alertColor = '#ef480e';
	var initColor = '#000';
	var emailRegex = /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/i;

	function checkclick(id) {
		if (saveflag == "1") {
			$("#" + id).prop("checked", true);
			saveflag = 2;
		} else {
			$("#" + id).prop("checked", false);
			saveflag = 1;
		}
	}

	// 접속 기기 체크
	function isMobile() {
		var UserAgent = navigator.userAgent;
		if (UserAgent.match(
			/iPhone|iPod|Android|Mobile|iP(hone|od|ad)|Windows CE|BlackBerry|Symbian|Windows Phone|webOS|Opera Mini|Opera Mobi|POLARIS|IEMobile|lgtelecom|nokia|SonyEricsson/i
		) != null || UserAgent.match(/LG|SAMSUNG|Samsung/) != null) {
			return true;
		} else {
			return false;
		}
	}

	// 컨텐츠 세로 사이즈 조정
	function windowResizing() {
		var contWrap = document.querySelector('.contentswrap');
		var getHeight = window.innerHeight;
		contWrap.setAttribute('style', 'min-height:' + getHeight);
	}

	// 생년월일 auto hypen
	function handleBirthDayHypen() {
		var regBirth = new RegExp('(\\d{4})(\\d{2})(\\d{2})');
		var change = this.value.replace(regBirth, '$1.$2.$3');
		this.value = change;
	}

	// 셀렉트 박스 선택 시 value값 얻기 & 셀렉트박스 닫기
	function handleRegionOpt(wrap) {
		var moSelectBox = wrap.querySelector('.mo-select');
		var pcOpt = Array.from(wrap.querySelectorAll('.option-list li'));
		var mobileOpt = Array.from(wrap.querySelectorAll('select option'));
		var pcSelected = wrap.querySelector('.current');
		var optWrap = pcSelected.nextElementSibling;
		var initColor = '#000';
		var idx;

		pcSelected.addEventListener('click', function () {
			this.classList.toggle('on');
			this.style.borderColor = initColor;
			this.nextElementSibling.classList.toggle('on');
			this.parentNode.nextElementSibling.nextElementSibling.innerText = '';
		});

		moSelectBox.addEventListener('click', function () {
			this.style.borderColor = initColor;
			this.nextElementSibling.innerText = '';
		});
		pcOpt.forEach(function (opt) {
			opt.addEventListener('click', function () {
				if (this.hasAttribute('data-disabled')) return false;
				var current = this.innerText;
				var self = this;
				pcOpt.forEach(function (opt) {
					var all = pcOpt.indexOf(opt);
					opt.classList.remove('selected');
					mobileOpt[all].removeAttribute('selected');
					idx = pcOpt.indexOf(self) + 1;
				});
				// alert(idx + ' : ' + mobileOpt.length);
				this.classList.add('selected');
				pcSelected.innerText = current;
				mobileOpt[idx].setAttribute('selected', 'selected');
				if (moSelectBox && ('selectedIndex' in moSelectBox)) {
					moSelectBox.selectedIndex = idx;
				}
				pcSelected.classList.remove('on');
				pcSelected.style.color = initColor;
				optWrap.classList.remove('on');
			});
		});

	}

	// 성별 선택
	function handleGenderChk() {
		genders.forEach(function (chk) {
			var box = chk.nextElementSibling.querySelector('span');
			box.style.borderColor = initColor;
			chk.checked = false;
		});
		this.checked = true;
		genderAlert.innerText = '';
	}


	const form = document.fregisterform;
	var mailDuplication = false;
	var mailAlert = form.mb_email.nextElementSibling;
	var mailCheckAlert = form.mb_email_check.nextElementSibling;
	var mailInput = form.mb_email.parentNode;
	var mailCheckInput = form.mb_email_check.parentNode;
	var pwAlert = form.mb_password.nextElementSibling;
	var pwInput = form.mb_password.parentNode;
	var pwReAlert = form.mb_password_re.nextElementSibling;
	var pwReInput = form.mb_password_re.parentNode;
	var fnameAlert = form.mb_fname.nextElementSibling;
	var fnameInput = form.mb_fname.parentNode;
	var lnameAlert = form.mb_lname.nextElementSibling;
	var lnameInput = form.mb_lname.parentNode;

	// 이메일 중복 체크
	function register_email_check(obj){
		var target_email = $(obj).val();
		$.ajax({
			type: 'POST',
			url: "https://www.gentlemonster.com/kr/customer/check_email",
			data: {
				email : target_email
			},
			dataType: "json",
			success: function (data) {
				if( data.success ){
					mailDuplication = true;
					var mailInput = obj.closest('.input-box');
					var mailAlert = mailInput.querySelector('.alert');
					if( !data.data['is_email_available'] ){
						mailInput.classList.add('required');
						mailAlert.innerText = "중복된 이메일 입니다.";
					} else {
						mailInput.classList.remove('required');
						mailAlert.innerText = "";

					}
				}
			},
			error:function(request, status, error){
				console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}

	// 유효성검사
	function register_autovalid_check(type, val) {
		// 이메일 형식
		if (mailDuplication && type == 'email_form') {
			if (!emailRegex.test(val)) {
				
				mailInput.classList.add('required');
				mailAlert.innerText = "이메일 주소를 입력해 주십시오.";
			} else {
				// mailInput.classList.remove('required');
				// mailAlert.innerText = "";
			}
		}

		// 이메일 재확인
		if (type == 'email_check_form') {
			var input_email = document.getElementsByName('mb_email')[0].value;
			var confirm_email = document.getElementsByName('mb_email_check')[0].value;

			if (input_email != confirm_email) {
				mailCheckInput.classList.add('required');
				mailCheckAlert.innerText = "이메일 주소가 일치하지 않습니다.";
			} else {
				mailCheckInput.classList.remove('required');
				mailCheckAlert.innerText = "";
			}
		}

		// 비밀번호 형식: 8자 이상, 숫자/대문자/소문자/특수문자를 모두 포함
		if (type == "password_validation") {
			document.getElementById("pw_pattern").style.display = "block";
			if(val.length < 9) {
				$('#length_8').removeClass('rule-helper-color');
			} else {
				$('#length_8').addClass('rule-helper-color');
			}

			let reg2 = /(?=.*[A-Z])/; // has at least 1 upper letter
			if (reg2.test(val)){
				$('#capital_1').addClass('rule-helper-color');
			} else {
				$('#capital_1').removeClass('rule-helper-color');
			}

			let reg3 = /[0-9]+/; // has at least 1 number
			if (reg3.test(val)){
				$('#number_1').addClass('rule-helper-color');
			} else {
				$('#number_1').removeClass('rule-helper-color');
			}

			let reg4 = /[$-/:-?{-~!@#"^_`+&<>,.\[\]\%\|\\]/; 	// has at least 1 symbol
			if (reg4.test(val)){
				$('#special_chactor_1').addClass('rule-helper-color');
			} else {
				$('#special_chactor_1').removeClass('rule-helper-color');
			}

			var pw = document.getElementById("password").value;
			const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[$-/:-?{-~!@#"^_`+&<>,.\[\]\%\|\\]).{8,}$/g;
			if (pw == '') {
				pwInput.classList.remove('required');
				pwAlert.innerText = "";
				document.getElementById("pw_pattern").style.display = "none";
				return false;
			}

			if (false === reg.test(pw)) {
				pwAlert.innerText = "다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.";
				pwInput.classList.add('required');
				return false;
			} else {
				pwInput.classList.remove('required');
				pwAlert.innerText = "";
				document.getElementById("pw_pattern").style.display = "none";
			}
		}

		// 비밀번호 재확인
		if (type == "password_form") {
			// document.getElementById("pw_pattern").style.display = "block";

			if (form.mb_password.value != form.mb_password_re.value) {
				pwReAlert.innerText = "일치하는 비밀번호를 입력하세요.";
				pwInput.classList.add('required');
				pwReInput.classList.add('required');
				return false;
			} else {
				pwInput.classList.remove('required');
				pwReInput.classList.remove('required');
				pwReAlert.innerText = "";
				document.getElementById("pw_pattern").style.display = "none";
			}
		}

		// 이름 형식
		const nameReg = /[0-9]|[!@#$%^&*()\-_=+\\\|\[\]\{};:\'",.<>\/?]/;
		if (type == "fname_form") {
			let fname = document.getElementsByName('mb_fname')[0].value;

			if (nameReg.test(fname)) {
				fnameAlert.innerText = "이름에 숫자나 특수문자가 들어갈 수 없습니다.";
				fnameInput.classList.add('required');
				return false;
			} else {
				fnameInput.classList.remove('required');
				fnameAlert.innerText = "";
			}
		}

		if (type == "lname_form") {
			let lname = document.getElementsByName('mb_lname')[0].value;
			if (nameReg.test(lname)) {
				lnameAlert.innerText = "이름에 숫자나 특수문자가 들어갈 수 없습니다.";
				lnameInput.classList.add('required');
				return false;
			} else {
				lnameInput.classList.remove('required');
				lnameAlert.innerText = "";
			}
		}

	}

	// submit 최종 폼체크
	function fregisterform_submit(f) {
		var selectBox = document.querySelectorAll('.select-box');
		var $mbTel = $('#mb_tel')
		var status = true;
	
		// 국가 셀렉트 박스 경고 표시 제거
		function handleSelectClick() {
			this.style.borderColor = initColor;
			regAlert.style.color = initColor;
			regAlert.innerText = '';
		}

		/*
		var return_email = 0;
		//이메일 확인
		$.ajax({
			type: "POST",
			url: "_proc.php",
			async: false,
			data: {
				mode: "email_check",
				email: f.mb_email.value
			}
		}).done(function (msg) {

			var msgp = parseInt(msg);

			if (msgp > 0) {
				email_check = true;


				return_email = 1;
			} else {
				return_email = 0;
				email_check = false;
			}
		});

		if (!emailRegex.test(f.mb_email.value)) {
			mailInput.classList.add('required');
			mailAlert.innerText = "Please enter a valid email address.";
			return_email = 1;
		} else if (return_email == 1) {
			mailInput.classList.add('required');
			mailAlert.innerText = "This email address is already registered.";
			// return false;
		}
		
		//이메일 확인 끝*/


		// 회원가입시 하이픈 입력할 경우
		if(f.mb_email.value.match('-')) {
			mailInput.classList.add('required');
			mailAlert.innerText = "하이픈 '-' 은 입력이 불가 합니다.";
			return false;
		}else {
			mailInput.classList.remove('required');
			mailAlert.innerText = "";
		}
		// 회원가입시 이메일과 이메일 확인이 일치하지 않을 경우
		if (f.mb_email.value != f.mb_email_check.value) {
			mailCheckInput.classList.add('required');
			mailCheckAlert.innerText = "이메일 주소가 일치하지 않습니다.";
			return false;
		} else {
			mailCheckInput.classList.remove('required');
			mailCheckAlert.innerText = "";
		}

		// 약관 동의 validation script
		var isOK = false;
var marketingOK = false;
var requiredOK = false;

// @note: [선택] 마켓팅 항목을 하나라도 선택하면 다른 선택 항목은 필수값
var marketingInput = Array.from(document.querySelectorAll('.terms--marketing'));
var marketingInputChecked = null;
var marketingInputUnchecked = [];
    console.log('marketingInput: ', marketingInput);
if (marketingInput && marketingInput.length)  {
    marketingInput.filter(function (input) {
        if (document.querySelectorAll('.terms--marketing:checked').length == marketingInput.length) {
            console.log('Marketing All Checked');
            marketingInputChecked = null;
            marketingOK = true;
        } else if (!marketingInputChecked) {
            if (input.checked) {
                marketingInputChecked = input;
            } else {
                marketingOK = true;
            }         
        } 
        input.onchange = function () {
            if (!input.checked && marketingInputUnchecked.length >= 1) {
                marketingInputUnchecked.filter(input => {
                    $(input).closest('.input-box').removeClass('required');
                })					
            } 
        };
    });
    if (marketingInputChecked) {
        marketingInputUnchecked.push(marketingInput.filter(input => input != marketingInputChecked));
        marketingInputUnchecked.filter(function(input) {	
            if (!input.checked && input != marketingInputChecked) {
                $(input).closest('.input-box').addClass('required');
                marketingOK = false;
            };
        });
    };
} else {
    marketingOK = true;
}


// @note: 필수 동의 항목 체크
var invalidSelect = true;
var requiredInputs = Array.from(document.querySelectorAll('.rg-input'));
var invalids = requiredInputs.filter(function (input) {
    var box = input.parentNode;
    var $box = $(input).closest('.input-box');

    function undoAlert() {
        $box.removeClass('required');
        if (input.nextElementSibling) {
            input.nextElementSibling.innerText = '';
        }
    }

    if (input.nodeName === 'INPUT' && input.getAttribute('type') === 'checkbox') {
        if (input.hasAttribute("data-required")) {
            if (!input.checked) {
                $box.addClass('required');
                input.onchange = function () {
                    if (input.checked) {
                        $box.removeClass('required');
                    }
                }
                requiredOK = false;
            } else {
                requiredOK = true;
            }
        }
    }
    input.addEventListener('click', undoAlert);
    input.addEventListener('focus', undoAlert);
    if (invalidSelect) {
        // note: KR에서만 성별 입력란 필수값 해제
        var genderExclusionKR = window._php.country == 'KR' & input.id == 'mb_gender' ? true : false;
        var txt = input.nextElementSibling.getAttribute('data-alert');
        if (!genderExclusionKR && input.value == '') {
            $box.addClass('required');
            input.nextElementSibling.innerText = txt;

            if (input.nodeName == 'SELECT') {
                var pcSelected = input.previousSibling.previousSibling.children[0];
                var selectAlert = input.nextSibling.nextSibling;
                if (isMobile()) {
                    input.style.borderColor = alertColor;
                } else {
                    pcSelected.style.borderColor = alertColor;
                }
                selectAlert.style.color = alertColor;
                selectAlert.innerText = selectAlert.dataset.alert;
            }

            return true;
        } else {
            return false;
        }
    }
});
;
isOK = requiredOK && marketingOK ? true : false;
		/** rg-input class에서 값이 빈 input이 1개 이상존재할 경우 return */
		if (invalids.length > 0) {
			// alert('invalid length : '+ invalids.length);
			return false;
		}

		// 국가 셀렉트 박스 클릭 시 경고 표시 제거
		// Array.from(selectBox).forEach(select => {
		//     if(isMobile()) {
		//         select.children[0].children[0].addEventListener('click', function() {
		//             console.log(this);
		//         });
		//         // console.log(select.children[0].children[0]);
		//     } else {

		//     }

		// })
		// if(isMobile()) {
		//     f.mb_region.addEventListener('click',handleSelectClick);
		// } else {
		//     currentReg.addEventListener('click',handleSelectClick);
		// }

		// 성별 선택 체크 -> 체크박스에서 select로 변경
		// if (f.mb_male.checked == false && f.mb_female.checked == false) {
		//     genders.forEach(function (gdr) {
		//         var box = gdr.nextElementSibling.querySelector('span');
		//         box.style.borderColor = alertColor;
		//     });
		//     genderAlert.innerText = genderAlert.dataset.alert;
		//     genderAlert.style.color = alertColor;
		//     return false;
		// }

		if (f.w.value == '') {
			// 이메일 중복 체크
			// 비밀번호 체크
			if (f.mb_password.value.length < 6) {
				pwInput.classList.add('required');
				pwAlert.innerText = "Please enter at least 6 characters.";
				return false;
			}
			const reg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!+,-./:;<=>?@$#~^_&%*()|]).{8,}$/;
			if (!reg.test(f.mb_password.value)) {
				pwInput.classList.add('required');
				pwAlert.innerText = "다음을 활용한 보안 비밀번호를 사용하시기 바랍니다.";
				return false;
			}
		}
		// 비밀번호 중복 체크
		if (f.mb_password.value != f.mb_password_re.value) {
			pwReAlert.innerText = "Passwords are not matching.";
			pwInput.classList.add('required');
			pwReInput.classList.add('required');
			return false;
		}

		// 이름형식 체크
		if (fnameInput.getAttribute("class").includes("required") || lnameInput.getAttribute("class").includes("required")) {
			return false;
		}

		if (!isOK) {
			return false
		} else {
			document.querySelector('#btn_submit .cart-loading').classList.add('active')
			return true;
		};
	}

	// pc 셀렉트박스 외 타겟 클릭 시 셀렉트 박스 닫기
	$(document).click(function (e) {
		var optBox = $(this).find('.option-list');
		optBox.each(function () {
			if (!$(e.target).is($(this).prev('.current')) && $(this).css('display') == 'block') {
				$(this).removeClass('on').prev('.current').removeClass('on');
			}
		});
	});

	window.addEventListener('load', windowResizing);
	window.addEventListener('resize', windowResizing);
	handleRegionOpt(birthYear);
	handleRegionOpt(birthMonth);
	handleRegionOpt(birthDay);
	handleRegionOpt(regionWrap);
	handleRegionOpt(mbGender);
	// if(mbTelRegion) {
	//     handleRegionOpt(mbTelRegion);
	// }
	// genders.forEach(function (gender) {
	//     gender.addEventListener('change', handleGenderChk);
	// });
	// $(document).ready(function () {
	// 	ajax_countrycode();
	// });
</script> -->




<jsp:include page="../common/footer.jsp" />