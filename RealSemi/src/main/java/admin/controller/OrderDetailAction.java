package admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import member.domain.MemberVO;
import order.domain.OrderVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 
 * 관리자용_주문 상세 Controller
 */
public class OrderDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null && ((MemberVO)session.getAttribute("loginUser")).getGrade() == 2) {
			// 로그인 했을 경우 && 관리자 등급일 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어온 경우 = 정상적으로 들어온 경우

				OrderDAO odao = new OrderDAO_imple();
				
				// dao에 넘겨줄 값을 저장한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("orderId", req.getParameter("orderId"));
				
				// 주문 내역 불러오기
				OrderVO ovo = odao.getOrderCompleteList(paraMap);
				List<OrderVO> orderDetailList = odao.getPersonalOrderDetail(paraMap);
				
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("email", ovo.getEmail());
				jsonObj.put("name", ovo.getFullName());
				jsonObj.put("tel", ovo.getTel());
				jsonObj.put("orderId", ovo.getOrderId());
				jsonObj.put("orderStatus", ovo.getOrderStatus());
				jsonObj.put("address", ovo.getAddress());
				jsonObj.put("detailAddress", ovo.getDetailAddress());
				jsonObj.put("postCode", ovo.getPostCode());
				jsonObj.put("amount", ovo.getAmount());
				jsonObj.put("orderDay", ovo.getOrderDay());
				
				JSONArray jsonArr = new JSONArray();
				
				for(OrderVO vo : orderDetailList) {
					JSONObject jsonObj2 = new JSONObject();
					
					jsonObj2.put("productName", vo.getProductName());
					jsonObj2.put("price", vo.getPrice());
					jsonObj2.put("quantity", vo.getQuantity());
					jsonObj2.put("mainImageFile", vo.getMainImageFile());
					
					jsonArr.put(jsonObj2);
				}
				
				jsonObj.put("orderDetailList", jsonArr);
				
				
				req.setAttribute("json", jsonObj);
				
				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");

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
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
