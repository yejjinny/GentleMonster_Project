package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import product.domain.ProductVO;
import product.model.ProductDAO;
import product.model.ProductDAO_imple;

public class ProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String method = req.getMethod();

		HttpSession session = req.getSession();
		MemberVO loginUser = new MemberVO();
	      loginUser.setEmail("hi@naver.com");
	      loginUser.setMemberId(1234);


	      session.setAttribute("loginUser", loginUser);

		if (!"GET".equalsIgnoreCase(method)) {
			// GET 방식으로 넘어온 것이 아니라면

			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javascript:history.back()";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

			return;

		} else {
			// GET 방식으로 들어왔을 경우
			// System.out.println("확인용 여기맞습니다.");

			ProductDAO pdao = new ProductDAO_imple();

			// 선글라스 대표사진, 이름, 가격 알아오기
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("categoryId", Integer.parseInt(req.getParameter("categoryId")));
			if(session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", ((MemberVO)session.getAttribute("loginUser")).getMemberId());
			}
			List<ProductVO> productList = pdao.getProductList(paraMap);
			req.setAttribute("productList", productList);

			// 선글라스 종류별 개수 알아오기
			List<ProductVO> sunglassesCount = pdao.getsunglassesCount(paraMap);
			req.setAttribute("sunglassesCount", sunglassesCount);

			// 선글라스 전체 개수 알아오기
			int sunglassesnumber = pdao.allViewList("1");
			req.setAttribute("sunglassesnumber", sunglassesnumber);

			
			

			/*
			 * Object loginUserObj = session.getAttribute("loginUser");
			 * 
			 * if (loginUserObj != null) { MemberVO loginUser = (MemberVO) loginUserObj;
			 * paraMap.put("memberId", loginUser.getMemberId()); }
			 */
			
			
			
			
			super.setRedirect(false);
			super.setViewPage("/jsp/sunglasses/sunglasses_viewAll.jsp");

		}

	}

}
