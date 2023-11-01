package product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import product.domain.ProductVO;
import product.model.ProductDAO;
import product.model.ProductDAO_imple;

public class ProductDetailAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		
		if("GET".equalsIgnoreCase(req.getMethod())) {
			// GET으로 들어온 경우 = 정상적으로 들어온 경우 = 상품 전체보기에서 상품을 클릭하였을 경우
			
			Map<String, Integer> paraMap = new HashMap<>();
			
			paraMap.put("productDetailId", Integer.parseInt(req.getParameter("productDetailId")));
			
			ProductDAO pdao = new ProductDAO_imple();
			
			// 상품 상세정보
			ProductVO pvo = pdao.getProductDetail(paraMap);
			
			req.setAttribute("productDetail", pvo);
			
			// 상품 상세사진
			req.setAttribute("productDetailImageList", pdao.getProductDetailImageList(paraMap));
			
			// 관련 상품
			paraMap.put("productGroupId", pvo.getFk_productGroupId());
			req.setAttribute("otherList", pdao.getOtherProductList(paraMap));
			
			super.setRedirect(false);
			super.setViewPage("/jsp/common/product_viewDetail.jsp");
		}else {
			// POST 방식으로 들어왔을 경우 
			
			String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
			String loc = req.getContextPath() + "/index.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}
	}

}
