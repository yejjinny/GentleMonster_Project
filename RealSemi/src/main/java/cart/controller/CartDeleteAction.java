package cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 * 작성자 신예진
 * 쇼핑백 상품삭제 Controller
 */
public class CartDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 되어있을 경우
			
			if ("POST".equalsIgnoreCase(req.getMethod())) {
				//POST로 들어왔을 경우 = 정상적인 경로로 들어왔을 경우
				
				
				// dao에 전달할 값을 설정한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("cartId", req.getParameter("cartId"));
				
				// 삭제 되었는지에 대한 변수 true = 삭제완료 / false = 삭제실패
				boolean isDelete = false;
				
				// ajax에 넘겨줄 json 값 설정위해 생성
				JSONObject jsonObj = new JSONObject(); // {}
				
				// 유저가 선택한 카트 아이템 삭제 처리
				CartDAO dao = new CartDAO_imple();
				int num = dao.deleteCartItem(paraMap);
				
				if (num == 1) {
					// 삭제 되었을 경우
					
					isDelete = true;
					jsonObj.put("isDelete", isDelete);

				} else {
					// 삭제 되지 않았을 경우
					
					jsonObj.put("isDelete", isDelete);
				}
				
				session.setAttribute("cartList", dao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
				
				// jsonObj를 설정한다
				req.setAttribute("json", jsonObj.toString());
				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");

			} else {
				// GET 방식으로 들어왔을 경우 = 잘못된 경로로 들어왔을 경우
				
				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
				
			} // end of if ("POST".equalsIgnoreCase(req.getMethod())) --------------------------

		} else {
			// 로그인하지 않았을 경우
			String message = "쇼핑백은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			
			// 수정필
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -------------------------------------------------

	}

}
