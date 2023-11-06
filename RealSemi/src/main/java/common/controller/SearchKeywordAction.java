package common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.model.SearchDAO;
import common.model.SearchDAO_imple;
import member.domain.MemberVO;
import product.domain.ProductVO;

/**
 * 작성자 신예진
 * 검색 Controller
 */
public class SearchKeywordAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if ("GET".equalsIgnoreCase(req.getMethod())) {
			// GET으로 들어왔을 경우 = 정상 경로로 들어왔을 경우
			
			// dao에 넘겨줄 값을 저장한다
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("memberId", req.getParameter("search"));
			
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
			}
			
			// 유저가 입력한 검색어를 dao에 넘겨주기 위해 저장한다
			paraMap.put("search", req.getParameter("search"));
			
			// 검색어를 바탕으로 검색결과를 취득한다
			SearchDAO sdao = new SearchDAO_imple();
			List<ProductVO> productList = sdao.searchKeyword(paraMap);
			
			// 화면에 보여줄 검색결과를 저장한다
			req.setAttribute("productList", productList);
			req.setAttribute("searchKeyword", req.getParameter("search"));

			List<String> searchKeywordList = new ArrayList<>();

			if (session.getAttribute("searchKeywordList") != null) {
				// 검색 기록이 이미 있을 경우
				
				searchKeywordList = (List<String>) session.getAttribute("searchKeywordList");

				if (searchKeywordList.size() >= 8) {
					// 최대 기록할 수 있는 검색량은 9개까지라
					searchKeywordList.remove(0);
				}

			}
			
			// 검색 모달창에서 보여줄 최근 검색어를 저장한다 
			searchKeywordList.add(req.getParameter("search"));

			session.setAttribute("searchKeywordList", searchKeywordList);

			super.setRedirect(false);
			super.setViewPage("/jsp/search/searchResult.jsp");

		} else {
			// POST로 들어왔을 경우 = 잘못된 경로로 들어왔을 경우

			String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
			String loc = req.getContextPath() + "/index.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
