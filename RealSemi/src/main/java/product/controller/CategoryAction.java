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

public class CategoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String method = req.getMethod();
		
		HttpSession session = req.getSession();
		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("hi@naver.com");
		loginUser.setMemberId(1234);

		session.setAttribute("loginUser", loginUser);
		
		if (!"GET".equalsIgnoreCase(method)) {
		
		}
		else {
			// GET 방식으로 들어왔을 경우
			// System.out.println("확인용 여기맞습니다.");
			
			ProductDAO pdao = new ProductDAO_imple();
			
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("categoryId", Integer.parseInt(req.getParameter("categoryId")));
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());
			}
			
			
		
			String colName = "";
			
			if(req.getParameter("frameId")!= null) {
				 colName = "fk_frameId";
			}
			if(req.getParameter("isTint")!= null) {
				colName = "istint";
			}
			if(req.getParameter("isGift")!= null) {
				colName = "isgift";
			}
		
			paraMap.put("colName", Integer.parseInt(colName));
			
			req.setAttribute("productList",pdao.getFrameId(paraMap));
			
			
			
			if("1".equals(req.getParameter("categoryId"))) {
			setViewPage("/jsp/sunglasses/sunglasses_viewAll.jsp");
			}
			else {
				setViewPage("/jsp/glasses/glasses_viewAll.jsp");
			}
		}

  }
}
