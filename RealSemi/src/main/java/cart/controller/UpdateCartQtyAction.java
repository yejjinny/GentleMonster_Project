package cart.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import cart.domain.CartVO;
import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 * 작성자 신예진
 * 쇼핑백 상품 수량수정 Controller
 */
public class UpdateCartQtyAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인한 유저일 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어왔을 경우 = 정상 경로로 들어왔을 경우
				
				// dao에 전달할 값을 설정한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("cartId", req.getParameter("cartId"));
				paraMap.put("action", req.getParameter("action"));
				
				
				// 수량 업데이트가 되었는지에 대한 변수 true = 업데이트완료 / false = 업데이트실패
				boolean isUpdate = false;
				
				// ajax에 넘겨줄 json 값 설정위해 생성
				JSONObject jsonObj = new JSONObject(); // {}

				// 유저가 선택한 카트 아이템 수량 업데이트 처리
				CartDAO dao = new CartDAO_imple();
				CartVO cvo = dao.updateCartQty(paraMap);
				
				if (cvo.getCartId() != 0) {
					// 수량 업데이트가 되었을 경우
					
					isUpdate = true;
					jsonObj.put("isUpdate", isUpdate);
					jsonObj.put("cartId", cvo.getCartId());
					jsonObj.put("quantity", cvo.getQuantity());
					jsonObj.put("price", cvo.getPrice());

				} else {
					// 수량 업데이트가 되지 않았을 경우
					
					jsonObj.put("isUpdate", isUpdate);
				}

				// jsonObj를 설정한다
				req.setAttribute("json", jsonObj.toString());
				
				session.setAttribute("cartList", dao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
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
				
			} // end of if ("POST".equalsIgnoreCase(req.getMethod())) -------------------------------------

		} else {
			// 로그인하지 않았을 경우
			
			String message = "쇼핑백은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// 수정필
			String loc = req.getContextPath() + "/login/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------------------

	}

}
