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
		
		
		/*
		 * super.setRedirect(false); super.setViewPage("/jsp/wish/wish.jsp");
		 * 
		 */
		
		
		
		
		
		
		
		
	// 임시용 코드 시작
		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("ganada@gmail.com");
		loginUser.setMemberId(3);

		HttpSession session = request.getSession();

		session.setAttribute("loginUser", loginUser);
	// 임시용 코드 끝

		
		
		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			// dao에 전달할 값을 설정한다
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());

			// 유저의 로그인 정보 바탕으로 위시리스트에 등록된 상품 꺼내오기
			WishDAO wdao = new WishDAO_imple();
			
			int totalWishCount = wdao.totalWishCount(loginUser.getMemberId());  // 위시리스트의 상품 전체개수를 알아온다.
			request.setAttribute("totalWishCount", totalWishCount);		    	
	    	
			List<WishVO> wishList = wdao.getWishList(paraMap);
			request.setAttribute("wishList", wishList);
			
			
			super.setRedirect(false);
			super.setViewPage("/jsp/wish/wish.jsp");

		} else {
			// 로그인하지 않았을 경우 (확인 완료)

			String message = "쇼핑백은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// path 수정필
			String loc = request.getContextPath() + "/login/login.gm";

			request.setAttribute("message", message);
			request.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------

	}

}
