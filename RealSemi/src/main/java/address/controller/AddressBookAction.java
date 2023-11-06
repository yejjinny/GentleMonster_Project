package address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;
/*
 * 작성자 윤예인
 * 계정설정-주소록 Controller
 */
public class AddressBookAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		 
		HttpSession session = req.getSession();
		String method = req.getMethod(); // "GET" 또는 "POST"

		MemberVO loginUser = (MemberVO) session.getAttribute("loginUser");

		int memberId = loginUser.getMemberId();

		if (session.getAttribute("loginUser") != null) {

			if ("GET".equalsIgnoreCase(method)) {

				 

				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("memberId", Integer.toString(memberId));

				AddressDAO dao = new AddressDAO_imple();

				List<AddressBookVO> addressList = dao.selectAddressLists(paraMap);

				if (addressList.size() == 0) { // 등록된 주소가 없을경우

					super.setRedirect(false);
					super.setViewPage("/jsp/member/addressBook/noAddressBook.jsp");

				} else { // 등록된 주소가 있을 경우

				 
					req.setAttribute("addressList", addressList);

					super.setRedirect(false);
					super.setViewPage("/jsp/member/addressBook/addressBook.jsp");

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

		} else {
			// 로그인을 안했으면
			String message = "주소록을 볼려면 먼저 로그인을 하세요!!";
			String loc = "javascript:history.back()";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		}
 

	}

}
