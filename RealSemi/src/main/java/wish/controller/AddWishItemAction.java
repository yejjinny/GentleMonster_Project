package wish.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.domain.MemberVO;
import wish.model.WishDAO;
import wish.model.WishDAO_imple;

public class AddWishItemAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();

		/* --------------- 로그인 했을 경우 --------------- */
		if (session.getAttribute("loginUser") != null) {
			
			if ("POST".equalsIgnoreCase(request.getMethod())) {
				
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("productDetailId", request.getParameter("productDetailId"));
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));

				boolean isAdd = false; // 추가 되었는지에 대한 변수 true = 추가완료 / false = 추가실패
				
				JSONObject jsonObj = new JSONObject(); // {}
				
				// 유저가 선택한 상품을 위시리스트에 추가
				WishDAO wdao = new WishDAO_imple();
				int num = wdao.addWishItem(paraMap);
				if (num == 1) {
					// 추가 되었을 경우
					isAdd = true;
					jsonObj.put("isAdd", isAdd);

				} else {
					// 추가 되지 않았을 경우
					jsonObj.put("isAdd", isAdd);
				}

				// jsonObj를 설정한다
				request.setAttribute("json", jsonObj.toString());
				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");
				
			} else {

				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = request.getContextPath() + "/index.gm";

				request.setAttribute("message", message);
				request.setAttribute("loc", loc);

			//	super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			} // end of if ("POST".equalsIgnoreCase(request.getMethod())) --------------------------
				

		/* --------------- 로그인 안 했을 경우 --------------- */
		} else {

			String message = "위시리스트 담기는 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			String loc = request.getContextPath() + "/register/login.gm";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

		//	super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null)
			

	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception -----------------
		

}
