package order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.domain.MemberVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진
 * 주문내용 취소 Controller
 */
public class OrderCancelAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인한 유저일 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어왔을 경우 = 정상 경로로 들어왔을 경우
				
				// dao에 넘겨줄 값을 저장
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("orderId", req.getParameter("orderId"));
				paraMap.put("memberId", String.valueOf(((MemberVO)session.getAttribute("loginUser")).getMemberId()));
				
				// ajax에 넘겨줄 json 값 설정위해 생성
				JSONObject jsonObj = new JSONObject(); // {}

				// 유저가 선택한 카트 아이템 수량 업데이트 처리
				OrderDAO dao = new OrderDAO_imple();
				int num = dao.cancleOrder(paraMap);

				if (num == 1) {
					// 수량 업데이트가 되었을 경우

					jsonObj.put("isUpdate", true);

				} else {
					// 수량 업데이트가 되지 않았을 경우

					jsonObj.put("isUpdate", false);
				}

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

			} // end of if ("POST".equalsIgnoreCase(req.getMethod())) -------------------------------------

		} else {
			// 로그인하지 않았을 경우

			String message = "쇼핑백은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// 수정필
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------------------
	}

}
