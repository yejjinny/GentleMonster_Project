package order.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

/**
 * 작성자 신예진 
 * 상품 주문_2 결제 화면 관련 Controller
 */
public class OrderPaymentAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우
			
			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어왔을 경우 = 유저가 화면에서 다음단계 버튼을 눌렀을 경우 = 정상경로일 경우

				AddressBookVO avo = new AddressBookVO();
				avo.setFk_memberId(((MemberVO) session.getAttribute("loginUser")).getMemberId());
				
				// 기본주소 저장여부용 변수 / 1 = 기본주소로 저장한다, 0 = 기본주소로 저장하지 않는다
				int isCheckDefaultAddr = 0; 
				
				if(req.getParameter("save_address") != null) {
					isCheckDefaultAddr = Integer.parseInt(req.getParameter("save_address"));
				}
				
				// 유저가 input값을 변경해 주소가 바뀌었을 경우 / 1 = 변경 되었다, 0 = 변경 되지 않았다 (주소록에 이미 등록되어있는 주소를 선택했다)
				int isChangedAddr = Integer.parseInt(req.getParameter("change_address")); 
				
				
				AddressDAO adao = new AddressDAO_imple();

				if (isChangedAddr != 1) {
					// 유저가 input값을 변경해 주소가 바뀌지 않았다면 주소록에 등록되어있는 addressBookId를 가져온다
					avo.setAddressBookId(Integer.parseInt(req.getParameter("addressBookId")));
				}
				avo.setFamilyName(req.getParameter("mb_lname"));
				avo.setLastName(req.getParameter("mb_fname"));
				avo.setTel(req.getParameter("mb_hp"));
				avo.setPostCode(req.getParameter("mb_zipcode"));
				avo.setAddress(req.getParameter("mb_address"));
				avo.setDetailAddress(req.getParameter("mb_address_sub"));
				
				// 유저가 입력한 주소 값을 결제 완료까지 보유해야하기 때문에 세션에 등록한다
				session.setAttribute("addressOne", avo);

				if (isCheckDefaultAddr == 1) {
					// 기본주소로 등록하려고 할 경우 주소록 정보를 업데이트한다
					adao.updateDefaultAddr(avo);
				}
				
				super.setRedirect(false);
				super.setViewPage("/jsp/order/order_pay.jsp");

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
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}
	}

}
