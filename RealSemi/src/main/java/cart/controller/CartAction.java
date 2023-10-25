package cart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cart.domain.CartVO;
import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

public class CartAction extends AbstractController {

	// 쇼핑백 버튼 및 쇼핑백 자세히 보기 버튼을 눌렀을 경우 (/cart/cart.up)
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		// 테스트용 코드 시작

		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("hi@naver.com");
		loginUser.setMemberId(1234);

		HttpSession session = req.getSession();

		session.setAttribute("loginUser", loginUser);
		// 테스트용 코드 끝

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			// dao에 전달할 값을 설정한다
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());

			// 유저의 로그인 정보 바탕으로 쇼핑백에 등록된 상품 꺼내오기
			CartDAO dao = new CartDAO_imple();
			List<CartVO> cartList = dao.getCartList(paraMap);

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
