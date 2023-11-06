package cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 * 작성자 신예진
 * 쇼핑백 상품추가 Controller
 */
public class CartAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginUser") != null) {
			// 로그인한 유저일 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어왔을 경우 = 정상 경로로 들어왔을 경우

				// dao에 전달할 값을 설정한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("productDetailId", req.getParameter("productDetailId"));
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));

				// 유저가 선택한 상품을 쇼핑백에 추가하는 처리
				CartDAO dao = new CartDAO_imple();
				int num = dao.addCartItem(paraMap);

				if (num == 1) {
					// 추가처리가 완료되었을 경우 원래 화면으로 갈 수 있도록 한다

					session.setAttribute("cartList",
							dao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId()));

					super.setRedirect(true);
					super.setViewPage(req.getHeader("referer"));

				} else {
					// 추가처리가 실패했을 경우

					String message = "쇼핑백에 추가 하는 데에 문제가 생겼습니다. 원래 화면으로 돌아갑니다.";
					String loc = "javascript:history.back()";
					req.setAttribute("message", message);
					req.setAttribute("loc", loc);

					super.setRedirect(false);
					super.setViewPage("/jsp/common/msg.jsp");
				}

			} else {
				// GET 방식으로 들어왔을 경우

				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			} // end of if ("POST".equalsIgnoreCase(req.getMethod())) ---------------------------------------------------

		} else {
			// 로그인하지 않았을 경우

			String message = "쇼핑백에 추가는 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// 수정필
			String loc = req.getContextPath() + "/login/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------------------------

	}

}
