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

public class ProductAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		String method = req.getMethod();

		HttpSession session = req.getSession();




		if ("POST".equalsIgnoreCase(method)) {

			ProductDAO pdao = new ProductDAO_imple();

			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("categoryId", req.getParameter("categoryId"));
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
			}

			// 필터 결과 갖고오기
			String[] frame_color = req.getParameterValues("frame_color");

			String[] lens_color = req.getParameterValues("lens_color");
			String[] materials = req.getParameterValues("materials");
			String[] gender = req.getParameterValues("gender");
			String[] order = req.getParameterValues("order");
			Map<String, String[]> paraArrMap = new HashMap<>();

			paraArrMap.put("frame_color", frame_color);
			
			paraArrMap.put("lens_color", lens_color);
			
			paraArrMap.put("materials", materials);
			
			paraArrMap.put("gender", gender);
			
			paraMap.put("order", req.getParameter("order"));

			List<ProductVO> productList = pdao.getfilterlist(paraMap, paraArrMap);

			req.setAttribute("productList", productList);
			Map<String, Integer> paraMap2 = new HashMap<>();
			
			
			// 선글라스 종류별 개수 알아오기
			List<ProductVO> sunglassesCount = pdao.getSunglassesCount();
			req.setAttribute("sunglassesCount", sunglassesCount);
			// 프레임컬러렌즈 이름 가져오기
			List<FrameColorVO> getFrameColor = pdao.getFrameColor(paraMap2);
			req.setAttribute("getFrameColor", getFrameColor);

			// 렌즈컬러렌즈 이름 가져오기
			List<LenseColorVO> getLenseColor = pdao.getLenseColor(paraMap2);
			req.setAttribute("getLenseColor", getLenseColor);

			// 소재 이름 가져오기
			List<MaterialVO> getMaterial = pdao.getMaterial(paraMap2);
			req.setAttribute("getMaterial", getMaterial);

			if ("1".equals(req.getParameter("categoryId"))) {
				setViewPage("/jsp/sunglasses/sunglasses_viewAll.jsp");
			}
			if ("2".equals(req.getParameter("categoryId"))) {
				setViewPage("/jsp/glasses/glasses_viewAll.jsp");
			}

		} else {
			// GET 방식으로 들어왔을 경우

			ProductDAO pdao = new ProductDAO_imple();

			// 선글라스 대표사진, 이름, 가격 알아오기
			Map<String, Integer> paraMap = new HashMap<>();
			paraMap.put("categoryId", Integer.parseInt(req.getParameter("categoryId")));
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", ((MemberVO) session.getAttribute("loginUser")).getMemberId());
			}
			List<ProductVO> productList = pdao.getProductList(paraMap);
			req.setAttribute("productList", productList);

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
			

			if ("1".equals(req.getParameter("categoryId"))) {
				setViewPage("/jsp/sunglasses/sunglasses_viewAll.jsp");
			}
			if ("2".equals(req.getParameter("categoryId"))) {
				setViewPage("/jsp/glasses/glasses_viewAll.jsp");
			}
			
			if(req.getParameter("allView") != null) {
				req.setAttribute("allView", true);
			}

		}

	}

}
