package common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import cart.model.CartDAO;
import cart.model.CartDAO_imple;
import common.model.IndexImageDAO;
import common.model.IndexImageDAO_imple;
import member.domain.MemberVO;
import product.domain.ProductVO;

public class IndexController extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		if ("GET".equalsIgnoreCase(request.getMethod())) {
			// GET으로 들어왔을 경우 = index.jsp 보여주기

			if(session.getAttribute("loginUser") != null) {
				CartDAO cdao = new CartDAO_imple();
				
				session.setAttribute("cartList", cdao.getCartList(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
			}
			
			super.setRedirect(false);
			super.setViewPage("/jsp/common/index.jsp");
			
		} else {
			// POST로 들어왔을 경우 = index.jsp에서 인덱스용 이미지 파일 가져올 경우

			// 인덱스에서 보여줄 상품 이미지 가져오는 처리

			IndexImageDAO idao = new IndexImageDAO_imple();
			List<ProductVO> indexImageList = idao.getIndexImageList();

			// ajax에 넘겨줄 jsonArr 생성
			JSONArray jsonArr = new JSONArray();

			for (ProductVO pvo : indexImageList) { // jsonArr에 등록하기 위해 jsonObj 생성
				JSONObject jsonObj = new JSONObject(); // {}

				jsonObj.put("productDetailId", pvo.getProductDetailId());
				jsonObj.put("mainImageFile", pvo.getMainImageFile());
				jsonArr.put(jsonObj);
			}

			// jsonObj를 설정한다
			request.setAttribute("json", jsonArr.toString());

			super.setRedirect(false);
			super.setViewPage("/jsp/common/jsonview.jsp");

		}

	}

}
