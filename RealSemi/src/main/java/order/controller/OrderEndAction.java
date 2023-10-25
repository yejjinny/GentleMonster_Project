package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.domain.CartVO;
import common.controller.AbstractController;
import member.domain.AddressBookVO;
import member.domain.MemberVO;
import order.domain.OrderVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

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
				
				req.setAttribute("orderOne", odao.getOrderCompleteList(paraMap));
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
