package wish.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import wish.domain.WishVO;
import wish.model.WishDAO;
import wish.model.WishDAO_imple;

public class WishAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		MemberVO loginUser = new MemberVO();
		
		HttpSession session = request.getSession();

		/* --------------- 로그인 했을 경우 --------------- */
		if (session.getAttribute("loginUser") != null) {
		
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());

			WishDAO wdao = new WishDAO_imple(); 
			
			int totalWishCount = wdao.totalWishCount(paraMap.get("memberId"));  // 위시리스트의 상품 전체개수를 알아온다.
			request.setAttribute("totalWishCount", totalWishCount);	
			System.out.println(totalWishCount);
	    	
			List<WishVO> wishList = wdao.getWishList(paraMap);
			request.setAttribute("wishList", wishList);
			
		//	super.setRedirect(false);
			super.setViewPage("/jsp/wish/wish.jsp");
		
		/* --------------- 로그인 안 했을 경우 --------------- */
		} else {
			
			String message = "위시리스트는 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			String loc = request.getContextPath() + "/register/login.gm";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

		//	super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------

	}// end of public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception -----------------
	

}
