package product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import frameColor.domain.FrameColorVO;
import lenseColor.domain.LenseColorVO;
import material.domain.MaterialVO;
import member.domain.MemberVO;
import product.domain.ProductVO;
import product.model.ProductDAO;
import product.model.ProductDAO_imple;

public class CategoryAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		String method = req.getMethod();

		HttpSession session = req.getSession();




		if ("GET".equalsIgnoreCase(method)) {
			// GET 방식으로 들어왔을 경우

			ProductDAO pdao = new ProductDAO_imple();

			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("categoryId", Integer.parseInt(req.getParameter("categoryId")));
			
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());
			}else {
				paraMap.put("memberId", 0);
			}

			// 선글라스 종류별 개수 알아오기
			List<ProductVO> sunglassesCount = pdao.getSunglassesCount();
			req.setAttribute("sunglassesCount", sunglassesCount);

			// 프레임컬러렌즈 이름 가져오기
			List<FrameColorVO> getFrameColor = pdao.getFrameColor(paraMap);
			req.setAttribute("getFrameColor", getFrameColor);

			// 렌즈컬러렌즈 이름 가져오기
			List<LenseColorVO> getLenseColor = pdao.getLenseColor(paraMap);
			req.setAttribute("getLenseColor", getLenseColor);

			// 소재 이름 가져오기
			List<MaterialVO> getMaterial = pdao.getMaterial(paraMap);
			req.setAttribute("getMaterial", getMaterial);

			// 카테고리 틴트, 프레임, 선물추천 카테고리
			Map<String, String> paraMap2 = new HashMap<>();
			String colName = "";
			List<ProductVO> productList = null;


			if (req.getParameter("square") != null) {
				paraMap2.put("colName", "fk_frameId");
				paraMap2.put("value", req.getParameter("square"));
				productList = pdao.searchCategoryList(paraMap2, paraMap);
				req.setAttribute("square", true);
			}
			if (req.getParameter("cateye") != null) {
				paraMap2.put("colName", "fk_frameId");
				paraMap2.put("value", req.getParameter("cateye"));
				productList = pdao.searchCategoryList(paraMap2, paraMap);
				req.setAttribute("cateye", true);
			}
			if (req.getParameter("round") != null) {
				paraMap2.put("colName", "fk_frameId");
				paraMap2.put("value", req.getParameter("round"));
				productList = pdao.searchCategoryList(paraMap2, paraMap);
				req.setAttribute("round", true);
			}
			if (req.getParameter("isTint") != null) {
				paraMap2.put("colName", "isTint");
				paraMap2.put("value", req.getParameter("isTint"));
			    productList = pdao.searchCategoryList(paraMap2, paraMap);
			    req.setAttribute("isTint", true);
			}
			if (req.getParameter("isGift") != null) {
				paraMap2.put("colName", "isGift");
				paraMap2.put("value", req.getParameter("isGift"));
				productList = pdao.searchCategoryList(paraMap2, paraMap);
				req.setAttribute("isGift", true);
			}
			if (req.getParameter("isBluelight") != null) {
				paraMap2.put("colName", "isBluelight");
				paraMap2.put("value", req.getParameter("isBluelight"));
				productList = pdao.searchCategoryList(paraMap2, paraMap);
				req.setAttribute("isBluelight", true);
			}
			
		
			
			
			// 베스트셀러 카테고리

			if (req.getParameter("bestSeller") != null) {
				productList = pdao.getBestSeller(paraMap);
				req.setAttribute("bestSeller", true);
			}

			
			// 카테고리 allView 추가해서 검정테두리 넣기
			req.setAttribute("productList", productList);
			if(req.getParameter("allView") != null) {
				req.setAttribute("allView", true);
			}
			
			// 전체선택 외에 다른 카테고리 선택시 필터버튼없애기
			req.setAttribute("productList", productList);
			req.setAttribute("isCategorySearch", true);
			
			
			

			if ("1".equals(req.getParameter("categoryId"))) {
				setViewPage("/jsp/sunglasses/sunglasses_viewAll.jsp");
			} else {
				setViewPage("/jsp/glasses/glasses_viewAll.jsp");
			}

		}

	}
}
