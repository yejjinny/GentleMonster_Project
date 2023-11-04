package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

public class MemberInfoViewAllAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HttpSession session = req.getSession();

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		int memberId = loginUser.getMemberId();

		AddressDAO dao = new AddressDAO_imple();

		AddressBookVO addressDefault = dao.selectDefaultAddress(memberId);
		req.setAttribute("addressDefault", addressDefault);

		String method = req.getMethod(); // "GET" 또는 "POST"

		if ("GET".equalsIgnoreCase(method)) {

			if (session.getAttribute("loginUser") != null) {

				OrderDAO odao = new OrderDAO_imple();
				req.setAttribute("orderList", odao.getOrderListInfo(memberId));
				super.setViewPage("/jsp/member/memberInfo/memberInfo_viewAll.jsp");

			} else {
				// 로그인을 안했으면
				String message = "회원정보를 조회하기 위해서는 먼저 로그인을 하세요!!";
				String loc = "javascript:history.back()";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");

			}

		} else {
			// GET 방식이 아니라면

			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			// super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
