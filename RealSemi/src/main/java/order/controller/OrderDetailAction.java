package order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import order.domain.OrderVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 
 * 주문 상세 Controller
 */
public class OrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어온 경우 = 정상적으로 들어온 경우

				OrderDAO odao = new OrderDAO_imple();
				
				// dao에 넘겨줄 값을 저장한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
				paraMap.put("orderId", req.getParameter("orderId"));
				
				// 유저가 선택한 주문정보와 그 상세정보를 저장한다.
				req.setAttribute("orderOne", odao.getPersonalOrderOne(paraMap));
				req.setAttribute("orderDetailList", odao.getPersonalOrderDetail(paraMap));

				super.setRedirect(false);
				super.setViewPage("/jsp/order/orderDetail.jsp");

			} else {
				// GET으로 들어온 경우 = 잘못된 경로로 들어온 경우

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
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
