package order.controller;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import cart.domain.CartVO;
import common.controller.AbstractController;
import member.domain.MemberVO;
import my.util.GoogleMail;
import order.domain.OrderVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 
 * 상품 주문_3 주문확인 Controller
 */
public class OrderEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어왔을 경우 = 정상경로로 들어왔을 경우

				// 세션에 등록해둔 구매할 카트정보
				List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");

				// 세션에 등록해둔 유저가 입력해둔 주문지 정보
				AddressBookVO avo = (AddressBookVO) session.getAttribute("addressOne");

				// 총 금액 구하기
				int productPrice = 0;
				for (CartVO cvo : cartList) {
					productPrice += cvo.getPrice() * cvo.getQuantity();
				}

				// dao에서 사용할 값 저장하기
				Map<String, Object> objMap = new HashMap<>();
				objMap.put("cartList", cartList);
				objMap.put("addressOne", avo);
				objMap.put("amount", productPrice);

				// 사용이 끝난 세션 속성 지우기
				session.removeAttribute("cartList");
				session.removeAttribute("addressOne");

				// 주문, 주문상세 테이블에 등록 및 구매한 카트 아이템 삭제 하기
				OrderDAO odao = new OrderDAO_imple();
				String orderId = odao.insertOrderData(objMap);
				
				// 화면에 보일 내용 가져오기
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("orderId", orderId);
				
				// 주문 내역 불러오기
				OrderVO ovo = odao.getOrderCompleteList(paraMap);
				List<OrderVO> orderDetailList = odao.getPersonalOrderDetail(paraMap);
				
				////////////////////////////////////////////////////////
				boolean sendMailSuccess = false; // 메일이 정상적으로 전송되었는지 유무를 알아오기 위한 용도
				if (orderId != null && !orderId.isEmpty()) {
					// 주문이 완료되었을 경우
					DecimalFormat df = new DecimalFormat("###,###");
					// 사용자에게 보낼 email 내용을 저장한다
					String orderData = 
							"<div style='margin: 0; padding: 0; color: #333; font-style: normal; line-height: 1.42857143; font-size: 14px; font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; font-weight: normal; text-align: left; background-color: #f5f5f5'>"
							+ ""
							+ ""
							+ ""
							+ "		<table width='100%' style='border-collapse: collapse; margin: 0 auto'>"
							+ "			<tbody>"
							+ "				<tr>"
							+ "					<td align='center' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding-bottom: 30px; width: 100%'>"
							+ "						<table class='m_6590388548678541595main' align='center' style='border-collapse: collapse; margin: 0 auto; text-align: left; width: 660px'>"
							+ "							<tbody>"
							+ "								<tr>"
							+ "									<td class='m_6590388548678541595header' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 25px; text-align: center; background-color: #ffffff; padding-top: 70px'>"
							+ "										<a href='http://url1727.gentlemonster.com/ls/click?upn=9uOrRgG3XoG03xqUrIng8OvN8UBhKF-2FD2cdCjJhmnYQG7jdDXiNEcvLdkdClbdkqFZElXprW26EpL1GxVxyD1bx9Ih93i0Vl72f2gY6THTk-3DwgMx_TIk-2Fo66ocFMGXGel05aEItK-2BFPNB3YyltDg5NfNjYHctI5bg7KwY-2BYqlpaedzebyT9-2BRsi-2FyyUYSJBl-2FNnCcPWaiME-2Bo5oKDgGAGSCWULWZ5dLgoyafPTPazqd9WJPktFVunajJJyuq9dOjktZ5guJVvgwDmTIAxWGxy4Fb2Z6UasSZOOZIOIowPUNBCA2c7F-2F46oEA376neNnruYvIPuQ-3D-3D' style='color: #006bb4; text-decoration: none' target='_blank'"
							+ "											data-saferedirecturl='https://www.google.com/url?q=http://url1727.gentlemonster.com/ls/click?upn%3D9uOrRgG3XoG03xqUrIng8OvN8UBhKF-2FD2cdCjJhmnYQG7jdDXiNEcvLdkdClbdkqFZElXprW26EpL1GxVxyD1bx9Ih93i0Vl72f2gY6THTk-3DwgMx_TIk-2Fo66ocFMGXGel05aEItK-2BFPNB3YyltDg5NfNjYHctI5bg7KwY-2BYqlpaedzebyT9-2BRsi-2FyyUYSJBl-2FNnCcPWaiME-2Bo5oKDgGAGSCWULWZ5dLgoyafPTPazqd9WJPktFVunajJJyuq9dOjktZ5guJVvgwDmTIAxWGxy4Fb2Z6UasSZOOZIOIowPUNBCA2c7F-2F46oEA376neNnruYvIPuQ-3D-3D&amp;source=gmail&amp;ust=1698987036142000&amp;usg=AOvVaw2_VttZP4XeG5aMnjxtOPcQ'"
							+ "										>"
							+ "											<img width='180' src='https://ci5.googleusercontent.com/proxy/RNdZtVtogBUIuJTNf6nqKW15WalqHqVCZF53AxbGsb4FeZin3fkItSHjlxIasX7NpynEfNGk-hueXGPhD7Z9JWRIXl5lc84yRn0R2pYC3AdK_xiFA67BNK9x35oYN39P=s0-d-e1-ft#https://www-prd-kr.gentlemonster.com/media/email/logo/stores/1/email_logo.png' alt='한국스토어' border='0' style='border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none' class='CToWUd' data-bit='iit'>"
							+ "										</a>"
							+ "									</td>"
							+ "								</tr>"
							+ "								<tr>"
							+ "									<td class='m_6590388548678541595main-content' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; background-color: #fff; padding: 25px'>"
							+ "										<div style='min-width: 320px; background-color: #ffffff; margin: 0px auto; padding: 0px; width: 100%; max-width: 520px; box-sizing: border-box; color: #000000; font-family: CircularXXWeb-Book, SDGothicNeo-eMd, Nanum Gothic, Malgum Gothic, sans-serif'>"
							+ "											<div style='padding: 0; margin: 0; background-color: #ffffff'>"
							+ "												<div style='margin: 0; padding: 0 42px; text-align: center'>"
							+ "													<p style='margin-top: 0; margin-bottom: 10px; margin: 0; padding: 0 0 22px; font-size: 14px; line-height: 19px; font-weight: bold; font-family: 'SDGothicNeo-gBd', sans-serif'>" + ((MemberVO)session.getAttribute("loginUser")).getFullName() +" 고객님, 결제 안내드립니다.</p>"
							+ "													<div style='margin: 0; padding: 89px 0 25px'>"
							+ "														<p style='margin-top: 0; margin-bottom: 10px; margin: 0; padding: 0 0 24px; text-align: left; font-size: 13px; line-height: 1; font-weight: bold; font-family: CircularXXWeb-Bold, SDGothicNeo-gBd, sans-serif;'>"
							+ "															주문번호"
							+ "															<span style='font-size: 14px'> #" + ovo.getOrderId() + "</span>"
							+ "														</p>"
							+ "														<table width='100%' cellpadding='0' cellspacing='0' border='0' style='border-collapse: collapse'>"
							+ "															<colgroup>"
							+ "																<col width='22%'>"
							+ "																<col width='*'>"
							+ "																<col width='25%'>"
							+ "																<col width='15%'>"
							+ "																<col width='20%'>"
							+ "															</colgroup>"
							+ "															<tbody style='margin: 0; padding: 0; font-size: 12px; line-height: 1'>"
							+ "																<tr>"
							+ "																	<td class='m_6590388548678541595cancel-data' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; width: 100%'>"
							+ "																		<table class='m_6590388548678541595email-items' style='width: 100%; border-collapse: collapse; border-spacing: 0; max-width: 100%'>"
							+ "																			<thead>"
							+ "																				<tr>"
							+ "																					<th style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; vertical-align: bottom; padding: 10px'>제품명</th>"
							+ "																					<th style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; text-align: left; vertical-align: bottom; padding: 10px; font-weight: 700; margin-bottom: 5px'></th>"
							+ "																					<th style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: bottom; padding: 10px; text-align: center'>수량</th>"
							+ "																				</tr>"
							+ "																			</thead>";

					
					
					
					
					for(OrderVO vo : orderDetailList) {
						orderData +=
								  "																		<tbody>"
								+ "																				<tr>"
								+ "																					<td style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; border-top: 1px solid #ccc'>"
								+ "																						<img src='http://127.0.0.1:9090/TempSemi" + vo.getMainImageFile() +"' alt='" + vo.getProductName() + "' style='border: 0; height: 100px; line-height: 100%; outline: none; text-decoration: none' class='CToWUd' data-bit='iit'>"
								+ "																					</td>"
								+ "																					<td style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; border-top: 1px solid #ccc'>"
								+ "																						<p style='margin-top: 0; font-weight: 700; margin-bottom: 5px'>" + vo.getProductName() + "</p>"
								+ "																					</td>"
								+ "																					<td style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; border-top: 1px solid #ccc; text-align: center'>" + vo.getQuantity() + "</td>"
								+ "																				</tr>"
								+ "																			</tbody>";
					}
					
					
					
					
					
					
					
					orderData +=
							"																			<tfoot style='border-top: 1px solid #ccc; border-bottom: 1px solid #ccc'>"
							+ "																				<tr>"
							+ "																					<th colspan='2' scope='row' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; font-weight: 400; padding: 10px; text-align: left; background-color: #ffffff'>소계</th>"
							+ "																					<td colspan='2' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; text-align: right; background-color: #ffffff; min-width: 65px'>"
							+ "																						<span style='white-space: nowrap'>₩" + df.format(ovo.getAmount()) +"</span>"
							+ "																					</td>"
							+ "																				</tr>"
							+ "																				<tr>"
							+ "																					<th colspan='2' scope='row' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; font-weight: 400; padding: 10px; padding-top: 0; text-align: left; background-color: #ffffff'>배송비</th>"
							+ "																					<td colspan='2' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; text-align: right; padding-top: 0; background-color: #ffffff; min-width: 65px'>"
							+ "																						<span style='white-space: nowrap'>₩0</span>"
							+ "																					</td>"
							+ "																				</tr>"
							+ "																				<tr>"
							+ "																					<th colspan='2' scope='row' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; font-weight: 400; padding: 10px; padding-top: 0; text-align: left; background-color: #ffffff'>"
							+ "																						<strong style='font-weight: 700'>합계</strong>"
							+ "																					</th>"
							+ "																					<td colspan='2' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 10px; text-align: right; padding-top: 0; background-color: #ffffff; min-width: 65px'>"
							+ "																						<span style='white-space: nowrap'>₩" + df.format(ovo.getAmount()) +"</span>"
							+ "																					</td>"
							+ "																				</tr>"
							+ "																			</tfoot>"
							+ "																		</table>"
							+ ""
							+ "																	</td>"
							+ "																</tr>"
							+ "															</tbody>"
							+ "														</table>"
							+ "													</div>"
							+ "													<div style='margin: 0; padding: 76px 0; line-height: 19px'>"
							+ "														<h3 style='font-weight: 300; margin-top: 20px; margin-bottom: 10px; margin: 0; padding: 0 0 24px; line-height: 1; font-size: 13px; text-align: left; font-family: SDGothicNeo-gBd, sans-serif'>주문 상세 내역</h3>"
							+ "														<table width='100%' cellpadding='0' cellspacing='0' border='0' style='border-collapse: collapse'>"
							+ "															<colgroup>"
							+ "																<col width='50%'>"
							+ "																<col width='50%'>"
							+ "															</colgroup>"
							+ "															<thead style='font-size: 12px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>주문일</td>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>이메일</td>"
							+ "																</tr>"
							+ "															</thead>"
							+ "															<tbody style='font-size: 13px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 33px'>" + ovo.getOrderDay() + "</td>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 33px'>"
							+ "																		<p style='margin-top: 0; margin-bottom: 10px; color: #000000; text-decoration: none'>"
							+ "																			" + ((MemberVO)session.getAttribute("loginUser")).getEmail()
							+ "																		</p>"
							+ "																	</td>"
							+ "																</tr>"
							+ "															</tbody>"
							+ "														</table>"
							+ "														<table width='100%' cellpadding='0' cellspacing='0' border='0' style='border-collapse: collapse'>"
							+ "															<colgroup>"
							+ "																<col width='50%'>"
							+ "																<col width='50%'>"
							+ "															</colgroup>"
							+ "															<thead style='font-size: 12px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>결제 수단</td>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>배송 주소</td>"
							+ "																</tr>"
							+ "															</thead>"
							+ "															<tbody style='font-size: 12px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 33px'>카드 결제</td>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 33px'>" + ovo.getAddress() + ovo.getDetailAddress() + ovo.getPostCode() + "</td>"
							+ "																</tr>"
							+ "															</tbody>"
							+ "														</table>"
							+ "														<table width='100%' cellpadding='0' cellspacing='0' border='0' style='border-collapse: collapse'>"
							+ "															<colgroup>"
							+ "																<col width='50%'>"
							+ "																<col width='50%'>"
							+ "															</colgroup>"
							+ "															<thead style='font-size: 12px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>배송방법</td>"
							+ ""
							+ "																</tr>"
							+ "															</thead>"
							+ "															<tbody style='font-size: 12px'>"
							+ "																<tr>"
							+ "																	<td align='left' valign='top' style='font-family: Open Sans, Helvetica Neue, Helvetica, Arial, sans-serif; vertical-align: top; padding: 0 0 10px'>CJ 대한통운</td>"
							+ "																</tr>"
							+ "															</tbody>"
							+ "														</table>"
							+ "													</div>"
							+ "												</div>"
							+ "												<div class='m_6590388548678541595footer' style='background-color: #fafafa; margin: 112px 0 0; padding: 46px 42px; font-size: 13px; line-height: 1; color: #b8b8b8'>"
							+ "													<div style='margin: 0; padding: 0'>"
							+ "														<p style='margin-top: 0; margin-bottom: 10px; margin: 0; padding: 0 0 10px; font-weight: bold; font-family: CircularXXWeb-Bold, sans-serif; color: #b8b8b8'>도움이 필요하신가요?</p>"
							+ "														<p style='margin-top: 0; margin-bottom: 10px; margin: 0; padding: 0; line-height: 19px; color: #b8b8b8; text-decoration: none'>본 메일은 발신 전용 메일이므로 회신하실 경우 답변이 되지 않습니다. 자세한 문의 사항은 고객서비스센터를 통해 문의해주시기 바랍니다.</p>"
							+ "													</div>"
							+ "													<div style='margin: 0; padding: 0; font-size: 12px'>"
							+ "														<p style='margin-top: 0; margin-bottom: 10px; margin: 0; padding: 0; color: #b8b8b8'>"
							+ "															© 2023"
							+ "															<span class='il'>GENTLE</span>"
							+ "															MONSTER"
							+ "														</p>"
							+ "													</div>"
							+ "												</div>"
							+ "											</div>"
							+ "										</div>"
							+ ""
							+ ""
							+ "									</td>"
							+ "								</tr>"
							+ "							</tbody>"
							+ "						</table>"
							+ "					</td>"
							+ "				</tr>"
							+ "			</tbody>"
							+ "		</table>"
							+ "		<img src='https://ci5.googleusercontent.com/proxy/L17Yu5bztoeF503juEtvUKNS35t1dYKbK3g4q6ddrGTzNbsAUuc5IRcc2jgkpLb0BZpu5-KH3VIzxAPjejvyp-BxTasVuSrWV0BOt3vPdB3JnNJExL4qA2uxZhC0o47yKXGwXusEnOuODQLKlxGg4LpaK7lIhCmaLiIQLR6FKmlpJM-5HvI8y1TxDn7viKGIr1Gj6Dzq9ZKriwLCcjzU9spw3qti6V29dMDBIy-5Gw_kH_t1sPqXqI6PYp6j4hfZgjvgx5bfW8pcHAUh0Nx9Op-BSXEPO0VlAA8cb_jEVbhwGJDAe1ldmpTCgGI4EjGDc0kg9vQ4p3BrtvHOihjTZr6BWe7DN3ZyJZxJrbipfz9WbK4UHLnNPih0vygJRaxRb1Jf1WrKWja_-Xipbr4Y7XIzd6OKEFctpw=s0-d-e1-ft#http://url1727.gentlemonster.com/wf/open?upn=MJDZyMaZufYLJFUzWnlVesJy3TGy7FuBJJboHO2Hsco0jlDGSYuH-2Fd7WNF5iqgo9vipZogeaQNSM8PNCj87XKfJH2oEvLq4IoUeFAXAr30HQZ1apc77uNj09BV-2BHWqXNgFJXx1oFAtw3BUH3O7HngOLYp363-2F65Dp8V-2Bw-2B5VDlcCvOx76w1RlPvz0DxWyQaS9payebvlshM378k4PG5jI7ZggXenYpzyR6mlOUd8T48-3D' alt='' width='1' height='1' border='0'"
							+ "			style='height: 1px !important; width: 1px !important; border-width: 0 !important; margin-top: 0 !important; margin-bottom: 0 !important; margin-right: 0 !important; margin-left: 0 !important; padding-top: 0 !important; padding-bottom: 0 !important; padding-right: 0 !important; padding-left: 0 !important' class='CToWUd' data-bit='iit'"
							+ "		>"
							+ "	</div>";
					
					
					
					
					// 주문내역을 사용자의 email로 전송시킨다.
					GoogleMail mail = new GoogleMail();

					try {
						mail.send_certification_code(((MemberVO)session.getAttribute("loginUser")).getEmail(), orderData);
						sendMailSuccess = true; // 메일 전송 성공했음을 기록함
					} catch (Exception e) {
						//메일 전송이 실패한 경우
						e.printStackTrace();
						sendMailSuccess = false; // 메일 전송 실패했음을 기록함
					}

				} // end of if (orderId != null && !orderId.isEmpty())
				////////////////////////////////////////////////////////

				

				req.setAttribute("orderOne", ovo);
				req.setAttribute("orderDetailList", orderDetailList);
				
				super.setRedirect(false);
				super.setViewPage("/jsp/order/order_complete.jsp");

			} else {
				// GET 방식으로 들어왔을 경우 = 잘못된 경로로 들어왔을 경우

				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			}

		} else {
			// 로그인한 유저가 아닐 경우

			String message = "주문은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// 수정필
			String loc = req.getContextPath() + "/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}
	}

}
