package order.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;
import order.domain.OrderVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 
 * 상품 주문_1 배송정보 입력 관련 Controller
 */
public class OrderAddressAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우
			
			if ("GET".equalsIgnoreCase(req.getMethod())) {
				// GET으로 들어온 경우 = 결제하기 버튼을 눌렀을 경우
				
				// dao에 전달할 값을 설정한다
				Map<String, Integer> paraMap = new HashMap<>();
				paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());
				
				// 로그인한 유저가 등록해둔 주소록 정보를 가져온다
				OrderDAO odao = new OrderDAO_imple();
				List<OrderVO> addressList = odao.getAddressBookList(paraMap);
				
				CartDAO cdao = new CartDAO_imple();
				
				for(OrderVO ovo : addressList) {
					if(ovo.getIsDefaultAddr() == 1) {
						// 기본주소로 등록되어있는 주소록은 따로 처리한다
						
						paraMap.put("addressBookId", ovo.getAddressBookId());
						req.setAttribute("addressOne", odao.getAddressOne(paraMap));
						break;
					}
				}
				
				// 주문, 결제하는 동안 유저가 결제하기 버튼을 눌렀을 당시의 카트정보를 계속 사용하기 때문에 세션에 등록해둔다
				session.setAttribute("cartList", cdao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
				req.setAttribute("addressList", addressList);
				
				
				super.setRedirect(false);
				super.setViewPage("/jsp/order/order.jsp");
				
			}else {
				// POST일 경우 = order.jsp의 셀렉트리스트에서 유저가 주소록을 선택했을 경우
				
				// dao에 전달할 값을 설정한다
				Map<String, Integer> paraMap = new HashMap<>();
				paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());
				paraMap.put("addressBookId", Integer.parseInt(req.getParameter("addressBookId")));
				
				// 유저가 선택한 주소의 주소정보만을 가져온다
				OrderDAO dao = new OrderDAO_imple();
				OrderVO ovo = dao.getAddressOne(paraMap);
				
				// ajax에게 돌려줄 결과값을 생성한다
				JSONObject jsonObj = new JSONObject(); // {}
				
				jsonObj.put("addressbookId", ovo.getAddressBookId());
				jsonObj.put("fk_memberId", ovo.getFk_memberId());
				jsonObj.put("familyName", ovo.getFamilyName());
				jsonObj.put("lastName", ovo.getLastName());
				jsonObj.put("tel", ovo.getTel());
				jsonObj.put("address", ovo.getAddress());
				jsonObj.put("detailAddress", ovo.getDetailAddress());
				jsonObj.put("postCode", ovo.getPostCode());
				jsonObj.put("isDefaultAddr", ovo.getIsDefaultAddr());
				
				
				req.setAttribute("json", jsonObj.toString());
				
				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");
				
			}
			
		}else {
			//로그인한 유저가 아닐 경우
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
