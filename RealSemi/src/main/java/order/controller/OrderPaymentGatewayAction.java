package order.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import cart.domain.CartVO;
import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 * 작성자 신예진 
 * 상품 주문_2 결제 기능 관련 Controller
 */
public class OrderPaymentGatewayAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우
			
			if ("GET".equalsIgnoreCase(req.getMethod())) {
				// GET으로 들어왔을 경우 = 정상적으로 들어왔을 경우

				// 세션에 등록해둔 구매할 카트정보
				List<CartVO> cartList = (List<CartVO>) session.getAttribute("cartList");

				// 총 금액 구하기
				int productPrice = 0;
				for (CartVO cvo : cartList) {
					productPrice += cvo.getPrice() * cvo.getQuantity();
				}

				// 세션에 등록해둔 유저가 입력해둔 주문지 정보
				AddressBookVO avo = (AddressBookVO) session.getAttribute("addressOne");
				
				req.setAttribute("productName", cartList.get(0).getProductName() + " 포함 " + cartList.size() + "건"); // 주문명 "상품명 포함 2건" 이렇게 표시
				req.setAttribute("productPrice", productPrice); // 총 합계 가격
				req.setAttribute("email", ((MemberVO) session.getAttribute("loginUser")).getEmail()); // 이메일
				req.setAttribute("name", avo.getFamilyName() + avo.getLastName()); // 이름
				req.setAttribute("tel", avo.getTel()); // 전화번호

				super.setRedirect(false);
				super.setViewPage("/jsp/order/paymentGateway.jsp");
				
			} else {
				// POST로 들어왔을 경우 = 잘못된 경로로 들어왔을 경우
				
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
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}
	}

}
