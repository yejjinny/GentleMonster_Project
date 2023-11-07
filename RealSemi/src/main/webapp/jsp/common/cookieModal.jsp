<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
%>
<link rel="stylesheet" href="<%=ctxPath%>/css/common/cookieModal.css">

<div class="box_content">
	<section class="contents">
		<h3 class="h2-font font--kr">쿠키 정책</h3>
		<div class="legal__container font--kr">


			<article class="legal__row">
				<h4 class="legal__title">쿠키 관리</h4>
				<p class="legal__text">이 섹션에서는 gentlemonster.com의 쿠키 관리 정책에 대해 설명합니다. 이는 귀하가 당사의 웹사이트를 방문할 때 처리되는 브라우징 정보의 출처와 사용 및 귀하의 권리를 알리기 위한 것입니다.</p>
			</article>
			<article class="legal__row">
				<h4 class="legal__title">쿠키란?</h4>
				<p class="legal__text">쿠키란, 귀하가 당사의 웹사이트를 방문하여 이용한 환경 설정 및 기타 정보를 담고 있는 작은 데이터(텍스트 파일)로 귀하의 선택에 따라 귀하의 단말기(PC, 스마트폰, 태플릿 등)에 저장될 수 있습니다. 쿠키가 유효하거나 저장되는 동안, 젠틀몬스터는 쿠키를 사용하여 다음 방문 시 귀하의 단말기를 식별할 수 있으며 이를 토대로 귀하가 더 나은 사용자 경험을 할 수 있도록 지원하고 당사 사이트 및 서비스의 품질을 향상시키기 위해 노력합니다.</p>
			</article>
			<article class="legal__row">
				<h4 class="legal__title">GENTLEMSONTER.COM에서 쿠키를 사용하는 이유</h4>
				<ol class="legal__text list-style list-style--circle-number">
					<li>귀하가 쇼핑을 계속하거나 사이트의 다른 페이지로 이동 시 장바구니에 선택한 제품들을 저장하고, 당사 사이트의 보안페이지를 접속할 수 있게 하는 등 귀하가 당사 사이트의 필수적인 기능들을 이용할 수 있도록 합니다. 만일 필수 쿠키를 거부하는 경우, 귀하는 당사 사이트를 쇼핑목적으로 이용할 수 없으며 오직 브라우징만 가능합니다.</li>
					<li>
						귀하가 당사 사이트를 어떻게 이용하는지 정보를 수집하여 당사 사이트와 서비스의 품질을 향상시킬 수 있게 합니다. 귀하의 사이트 이용 정보와 환경 설정 정보는 구체적으로 다음과 같은 목적을 위하여 활용됩니다.
						<ol class="legal__text list-style list-style--bracket-number">
							<li>당사 사이트 이용 현황에 대한 통계 제공</li>
							<li>귀하가 어디에서 클릭하고 어떤 사이트로부터 당사 사이트에 방문하게 되었는지를 파악하여 광고 효과를 확인</li>
							<li>당사가 선정한 제 3자 협력사에게도 당사 방문자가 협력사 웹사이트를 방문하였다는 피드백 제공(귀하가 구매한 제품에 대한 상세 내용 포함)</li>
							<li>귀하의 브라우징 도중 발생하는 오류들을 측정하여 사이트를 개선할 수 있도록 함</li>
							<li>귀하의 과거 방문 여부 및 귀하가 어떤 환경설정을 적용하였는지를 기억하여 귀하의 향후 당사 홈페이지 방문 환경을 향상시키고자 합니다. 또한 당사는 귀하가 다음 브라우징 시 사이트로 복귀하고자 하는 경우 귀하의 장바구니 품목들을 복구할 수 있습니다. 이러한 쿠키는 당사 사이트에서 서비스 제공을 위하여 협력사와 정보를 공유할 수 있습니다. 공유된 정보는 오직 서비스와 제품, 또는 기능 제공의 목적으로만 사용되며 그 외 다른 목적으로 쓰이지 않습니다.</li>
							<li>귀하의 관심에 따라 귀하 개개인에게 맞춤 브라우징 경험을 제공할 수 있도록 합니다. 이러한 맞춤 브라우징 경험은 제 3자가 제공하는 서비스로 링크되어 있을 수 있는데, 이들 제3자는 귀하가 당사 사이트를 방문 하였는지를 인식하기 위하여 이 서비스를 제공합니다. 이러한 정보는 귀하가 관심을 가질 만한 제품과 서비스에 대한 정보를 귀하에게 알리는데 사용됩니다. 또한 쿠키는 페이스북과 같은 소셜네트워크와 링크되어 있거나 광고대행업체에 귀하의 방문 정보를 제공하여 귀하가 관심을 가질만한 젠틀몬스터 제품과 서비스의 광고를 게시할 수 있도록 합니다.</li>
						</ol>
					</li>
				</ol>
			</article>
			<article class="legal__row">
				<p class="legal__text">다음은 gentlemonster.com의 페이지 방문 시, 젠틀몬스터 또는 제3자가 단말기에 저장할 수 있는 쿠키에 대한 정보와 이러한 쿠키를 삭제하거나 저장하지 못하도록 차단하는 방법에 대한 정보입니다.</p>
				<!-- include onetrust sdk -->
				<div id="ot-sdk-cookie-policy" class="legal__text">
					<div id="ot-sdk-cookie-policy-v2" class="ot-sdk-cookie-policy ot-sdk-container">
						<h3 id="cookie-policy-title" class="ot-sdk-cookie-policy-title">쿠키 목록</h3>
						<div id="cookie-policy-description">쿠키는 사용자가 웹사이트를 방문할 때 사용자가 선호하는 언어, 로그인 정보와 같이 사용자를 기억하기 위해 웹사이트가 기기에 저장할 것인지를 브라우저에게 묻는 적은 양의 데이터(텍스트 파일)입니다. 이러한 쿠키는 당사가 설정하며, 제1 쿠키라고 불립니다. 또한 당사는 광고와 홍보를 위해 사용자가 방문하는 웹사이트의 도메인이 아닌 다른 도메인에서 발생되는 제3의 쿠키를 사용하기도 합니다. 더 정확히 말해 아래 목적을 위해 쿠키 및 기타 추적 기술을 사용합니다.</div>

						<section>
							<h4 class="ot-sdk-cookie-policy-group">필수 쿠키</h4>
							<p class="ot-sdk-cookie-policy-group-desc">이 쿠키는 웹사이트의 기능을 위해 필수적이며, 회사 시스템 내에서 종료할 수 없습니다. 이 쿠키는 개인정보 선호도, 로그인 또는 양식 작성과 같은 서비스 요청에 해당하는 귀하의 행위에 따라서만 주로 설정됩니다. 귀하의 브라우저에서 이 쿠키를 차단하거나 쿠키에 대해 알림 설정을 할 수 있지만, 이 경우 해당 사이트의 일부 기능이 동작하지 않을 수 있습니다.</p>

							<table>
								<caption class="ot-scrn-rdr">필수 쿠키</caption>
								<thead>
									<tr>
										<th scope="col" class="ot-table-header ot-host">쿠키 하위 그룹</th>

										<th scope="col" class="ot-table-header ot-cookies">쿠키</th>
										<th scope="col" class="ot-table-header ot-cookies-type">사용 중인 쿠키</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/PHPSESSID" rel="noopener" target="_blank" aria-label="PHPSESSID 새 탭에서 열기">PHPSESSID</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											.gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/OptanonConsent" rel="noopener" target="_blank" aria-label="OptanonConsent 새 탭에서 열기">OptanonConsent</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/OptanonAlertBoxClosed" rel="noopener" target="_blank" aria-label="OptanonAlertBoxClosed 새 탭에서 열기">OptanonAlertBoxClosed</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/gentlemonster.com" rel="noopener" target="_blank" aria-label="gentlemonster.com 새 탭에서 열기">gentlemonster.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">ci_session</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
								</tbody>
							</table>
						</section>
						<section>
							<h4 class="ot-sdk-cookie-policy-group">성능 관련 쿠키</h4>
							<p class="ot-sdk-cookie-policy-group-desc">이 쿠키는 방문자 수, 데이터 트래픽 정보를 확인해 회사 사이트의 성능을 측정하고 개선할 수 있도록 합니다. 또한 가장 인기가 많거나 인기가 적은 페이지를 확인하며 방문자가 사이트를 이동하는 방법을 확인할 수 있도록 합니다. 쿠키가 수집하는 모든 정보는 누적되며 익명 처리됩니다. 쿠키를 허용하지 않으면 귀하가 회사 사이트에 방문한 시기를 알 수 없습니다.</p>

							<table>
								<caption class="ot-scrn-rdr">성능 관련 쿠키</caption>
								<thead>
									<tr>
										<th scope="col" class="ot-table-header ot-host">쿠키 하위 그룹</th>

										<th scope="col" class="ot-table-header ot-cookies">쿠키</th>
										<th scope="col" class="ot-table-header ot-cookies-type">사용 중인 쿠키</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											www.gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/s_xxxx" rel="noopener" target="_blank" aria-label="s_xxxx 새 탭에서 열기">s_xxxx</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/_gid" rel="noopener" target="_blank" aria-label="_gid 새 탭에서 열기">_gid</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/_gat_UA-" rel="noopener" target="_blank" aria-label="_gat_UA- 새 탭에서 열기">_gat_UA-</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/_uetvid" rel="noopener" target="_blank" aria-label="_uetvid 새 탭에서 열기">_uetvid</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/_ga" rel="noopener" target="_blank" aria-label="_ga 새 탭에서 열기">_ga</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/_gclxxxx" rel="noopener" target="_blank" aria-label="_gclxxxx 새 탭에서 열기">_gclxxxx</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
								</tbody>
							</table>
						</section>
						<section>
							<h4 class="ot-sdk-cookie-policy-group">기능적 쿠키</h4>
							<p class="ot-sdk-cookie-policy-group-desc">본 쿠키는 동영상 및 실시간 채팅과 같은 고급 기능과 개인화를 허용합니다. 쿠키는 회사 또는 회사 페이지에 추가된 제3 서비스 사업자가 설정할 수 있습니다. 쿠키를 허용하지 않으면 일부 기능이 정상 작동하지 않을 수 있습니다.</p>

							<table>
								<caption class="ot-scrn-rdr">기능적 쿠키</caption>
								<thead>
									<tr>
										<th scope="col" class="ot-table-header ot-host">쿠키 하위 그룹</th>

										<th scope="col" class="ot-table-header ot-cookies">쿠키</th>
										<th scope="col" class="ot-table-header ot-cookies-type">사용 중인 쿠키</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/noScroll" rel="noopener" target="_blank" aria-label="noScroll 새 탭에서 열기">noScroll</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/gentlemonster.com" rel="noopener" target="_blank" aria-label="gentlemonster.com 새 탭에서 열기">gentlemonster.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">hasScroll</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
								</tbody>
							</table>
						</section>
						<section>
							<h4 class="ot-sdk-cookie-policy-group">광고 쿠키</h4>
							<p class="ot-sdk-cookie-policy-group-desc">이 쿠키는 회사의 광고 협력사가 회사 사이트에 설정한 것입니다. 해당 협력사는 귀하의 관심사에 대한 프로파일을 만들고 다른 사이트에서도 관련 광고를 표시하기 위해 이 쿠키를 사용합니다. 이 쿠키는 귀하의 브라우저와 기기를 식별함으로써 동작합니다. 이 쿠키를 허용하지 않으면 다른 웹사이트에서 회사가 제공하는 맞춤형 광고를 경험할 수 없습니다.</p>

							<table>
								<caption class="ot-scrn-rdr">광고 쿠키</caption>
								<thead>
									<tr>
										<th scope="col" class="ot-table-header ot-host">쿠키 하위 그룹</th>

										<th scope="col" class="ot-table-header ot-cookies">쿠키</th>
										<th scope="col" class="ot-table-header ot-cookies-type">사용 중인 쿠키</th>

									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/_uetsid" rel="noopener" target="_blank" aria-label="_uetsid 새 탭에서 열기">_uetsid</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/_fbp" rel="noopener" target="_blank" aria-label="_fbp 새 탭에서 열기">_fbp</a>
												,
												<a href="https://cookiepedia.co.uk/cookies/cto_tld_test" rel="noopener" target="_blank" aria-label="cto_tld_test 새 탭에서 열기">cto_tld_test</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											www.gentlemonster.com
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">
												<a href="https://cookiepedia.co.uk/cookies/criteo_write_test" rel="noopener" target="_blank" aria-label="criteo_write_test 새 탭에서 열기">criteo_write_test</a>
											</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">퍼스트 파티</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/sharethrough.com" rel="noopener" target="_blank" aria-label="sharethrough.com 새 탭에서 열기">sharethrough.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">stx_user_id</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/criteo.com" rel="noopener" target="_blank" aria-label="criteo.com 새 탭에서 열기">criteo.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">uid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/casalemedia.com" rel="noopener" target="_blank" aria-label="casalemedia.com 새 탭에서 열기">casalemedia.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">CMID, CMPS</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/media.net" rel="noopener" target="_blank" aria-label="media.net 새 탭에서 열기">media.net</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">data-c, data-c-ts, gdpr_status, visitor-id</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/360yield.com" rel="noopener" target="_blank" aria-label="360yield.com 새 탭에서 열기">360yield.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">tuuid, tuuid_lu, um, umeh</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/www.facebook.com" rel="noopener" target="_blank" aria-label="www.facebook.com 새 탭에서 열기">www.facebook.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content"></span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/turn.com" rel="noopener" target="_blank" aria-label="turn.com 새 탭에서 열기">turn.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">uid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/outbrain.com" rel="noopener" target="_blank" aria-label="outbrain.com 새 탭에서 열기">outbrain.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">criteo, obuid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/i.liadm.com" rel="noopener" target="_blank" aria-label="i.liadm.com 새 탭에서 열기">i.liadm.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">_li_ss</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/taboola.com" rel="noopener" target="_blank" aria-label="taboola.com 새 탭에서 열기">taboola.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">t_gid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/yahoo.com" rel="noopener" target="_blank" aria-label="yahoo.com 새 탭에서 열기">yahoo.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">A3, APID, APIDTS, B</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/ads.yahoo.com" rel="noopener" target="_blank" aria-label="ads.yahoo.com 새 탭에서 열기">ads.yahoo.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">APIDTS</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/rlcdn.com" rel="noopener" target="_blank" aria-label="rlcdn.com 새 탭에서 열기">rlcdn.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">pxrc, rlas3</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/advertising.com" rel="noopener" target="_blank" aria-label="advertising.com 새 탭에서 열기">advertising.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">APID</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/adnxs.com" rel="noopener" target="_blank" aria-label="adnxs.com 새 탭에서 열기">adnxs.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">anj, uuid2</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/dpm.demdex.net" rel="noopener" target="_blank" aria-label="dpm.demdex.net 새 탭에서 열기">dpm.demdex.net</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">dpm</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/tapad.com" rel="noopener" target="_blank" aria-label="tapad.com 새 탭에서 열기">tapad.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">TapAd_3WAY_SYNCS, TapAd_DID, TapAd_TS</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/analytics.yahoo.com" rel="noopener" target="_blank" aria-label="analytics.yahoo.com 새 탭에서 열기">analytics.yahoo.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">IDSYNC</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/doubleclick.net" rel="noopener" target="_blank" aria-label="doubleclick.net 새 탭에서 열기">doubleclick.net</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">IDE, test_cookie</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/addthis.com" rel="noopener" target="_blank" aria-label="addthis.com 새 탭에서 열기">addthis.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">na_id, ouid, uid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/demdex.net" rel="noopener" target="_blank" aria-label="demdex.net 새 탭에서 열기">demdex.net</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">demdex</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/postrelease.com" rel="noopener" target="_blank" aria-label="postrelease.com 새 탭에서 열기">postrelease.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">opt_out</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/bing.com" rel="noopener" target="_blank" aria-label="bing.com 새 탭에서 열기">bing.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">MUID</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/3lift.com" rel="noopener" target="_blank" aria-label="3lift.com 새 탭에서 열기">3lift.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">tluid</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/bidswitch.net" rel="noopener" target="_blank" aria-label="bidswitch.net 새 탭에서 열기">bidswitch.net</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">c, tuuid, tuuid_lu</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/pubmatic.com" rel="noopener" target="_blank" aria-label="pubmatic.com 새 탭에서 열기">pubmatic.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">KRTBCOOKIE_xxxx, PUBMDCID, PugT</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
									<tr>
										<td class="ot-host-td" data-label="쿠키 하위 그룹">
											<span class="ot-mobile-border"></span>
											<a href="https://cookiepedia.co.uk/host/youtube.com" rel="noopener" target="_blank" aria-label="youtube.com 새 탭에서 열기">youtube.com</a>
										</td>

										<td class="ot-cookies-td" data-label="쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-td-content">CONSENT, VISITOR_INFO1_LIVE, YSC</span>
										</td>
										<td class="ot-cookies-type" data-label="사용 중인 쿠키">
											<span class="ot-mobile-border"></span>
											<span class="ot-cookies-type-td-content">제삼자</span>
										</td>

									</tr>
								</tbody>
							</table>
						</section>
					</div>
				</div>
			</article>
			<article class="legal__row">
				<h4 class="legal__title">단말기에 저장된 쿠키 관리</h4>
				<p class="legal__text">귀하의 선택에 따라 단말기에 쿠키가 저장됩니다. 브라우저 환경 설정을 통해 단말기에서의 쿠키 저장을 수락하거나 거부할 수 있습니다. 각 브라우저마다 구성 설정이 다릅니다. 일반적으로 브라우저의 도움말 메뉴에서 관련 내용을 확인할 수 있으며, 이를 통해 쿠키 선호도를 수정하는 것을 권해 드립니다.</p>
				<ul class="legal__text list-style list-style--hyphen">
					<li class="font--en">
						Internet Explorer™:
						<a href="https://support.microsoft.com/en-us/help/17442/windows-internet-explorer-delete-manage-cookies">https://support.microsoft.com/</a>
					</li>
					<li class="font--en">
						Safari:
						<a href="https://support.apple.com/kb/PH19214?locale=fr_FR&amp;viewlocale=en_US">https://support.apple.com/</a>
					</li>
					<li class="font--en">
						Chrome:
						<a href="https://support.google.com/chrome/answer/95647?hl=en&amp;hlrm=enbr">https://support.google.com/</a>
					</li>
					<li class="font--en">
						Firefox:
						<a href="https://support.mozilla.org/en-US/kb/enable-and-disable-cookies-website-preferences">https://support.mozilla.org/</a>
					</li>
					<li class="font--en">
						Opera™:
						<a href="http://help.opera.com/Windows/10.20/en/cookies.html">http://help.opera.com/</a>
					</li>
				</ul>
				<ul class="legal__text list-style list-style--reference">
					<li>주의사항: 귀하의 브라우저 프로그램에서 쿠키를 수락 또는 거부하도록 변경한 설정은 온라인 브라우징 경험 및 해당 쿠키를 사용해야 하는 특정 서비스에 대한 귀하의 이용에 영향을 미칠 수 있습니다. 예를 들어, 필수 쿠키의 사용을 거부하면 당사의 웹사이트에서 주문을 처리할 수 없습니다.</li>
				</ul>
			</article>
			<article class="legal__row">
				<h4 class="legal__title">쿠키와 관련된 개인정보처리</h4>
				<p class="legal__text">쿠키를 이용하여 포착된 모든 정보가 귀하를 식별하는 것은 아니지만 이 정보를 통하여 귀하를 식별할 수 있게 되어 개인정보에 해당하는 경우, 젠틀몬스터는 개인정보처리방침에 따라 귀하의 정보를 행태정보로서 수집∙이용합니다.</p>
			</article>
			<div class="legal__row">
				<ul class="legal__text">
				</ul>
			</div>
		</div>
	</section>
</div>