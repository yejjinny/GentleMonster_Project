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

public class SearchKeywordAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// 테스트용 코드 시작

		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("hi@naver.com");
		loginUser.setMemberId(1234);

		HttpSession session = req.getSession();

		session.setAttribute("loginUser", loginUser);
		// 테스트용 코드 끝
		if ("GET".equalsIgnoreCase(req.getMethod())) {
			// GET으로 들어왔을 경우 = 정상 경로로 들어왔을 경우

			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("memberId", req.getParameter("search"));
			if (session.getAttribute("loginUser") != null) {
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));
			}
			paraMap.put("search", req.getParameter("search"));

			SearchDAO sdao = new SearchDAO_imple();
			List<ProductVO> productList = sdao.searchKeyword(paraMap);

			req.setAttribute("productList", productList);
			req.setAttribute("searchKeyword", req.getParameter("search"));

			List<String> searchKeywordList = new ArrayList<>();

			if (session.getAttribute("searchKeywordList") != null) {
				// 검색 기록이 있을 경우
				searchKeywordList = (List<String>) session.getAttribute("searchKeywordList");

				if (searchKeywordList.size() >= 8) {
					// 최대 기록할 수 있는 검색량은 9개까지라
					searchKeywordList.remove(0);
				}

			}
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
