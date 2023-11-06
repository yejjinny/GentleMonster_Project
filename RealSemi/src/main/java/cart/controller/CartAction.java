package cart.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.domain.CartVO;
import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 *  작성자 신예진
 *  쇼핑백 Controller
 */
public class CartAction extends AbstractController {

	// 쇼핑백 버튼 및 쇼핑백 자세히 보기 버튼을 눌렀을 경우
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			// 유저의 로그인 정보 바탕으로 쇼핑백에 등록된 상품 꺼내오기
			CartDAO dao = new CartDAO_imple();
			List<CartVO> cartList = dao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId());
			session.setAttribute("cartList", cartList);
			req.setAttribute("cartList", cartList);

			super.setRedirect(false);
			super.setViewPage("/jsp/cart/cart.jsp");

		} else {
			// 로그인하지 않았을 경우 (확인 완료)

			String message = "쇼핑백은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// path 수정필
			String loc = req.getContextPath() + "/login/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------

	}

}
