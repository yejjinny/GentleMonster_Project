package admin.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 관리자용 전체주문목록 Controller
 */
public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null
				&& ((MemberVO) session.getAttribute("loginUser")).getGrade() == 2) {
			// 로그인 및 관리자등급일 경우

			// orderList.jsp의 select option 값 설정
			Map<String, String> orderSearchResultMap = new LinkedHashMap<>();
			orderSearchResultMap.put("", "정렬");
			orderSearchResultMap.put("orderIdUp", "주문번호 오름차순");
			orderSearchResultMap.put("orderIdDown", "주문번호 내림차순");
			orderSearchResultMap.put("orderDayUp", "주문일자 오름차순");
			orderSearchResultMap.put("orderDayDown", "주문일자 내림차순");
			orderSearchResultMap.put("fullNameUp", "주문자명 오름차순");
			orderSearchResultMap.put("fullNameDown", "주문자명 내림차순");

			// orderList.jsp의 select option 값 설정
			Map<String, String> searchCategoryMap = new LinkedHashMap<>();
			searchCategoryMap.put("", "검색대상");
			searchCategoryMap.put("orderId", "주문번호");
			searchCategoryMap.put("orderDay", "주문일자");
			searchCategoryMap.put("memberId", "회원고유번호");
			searchCategoryMap.put("name", "주문자명");

			req.setAttribute("orderSearchResultMap", orderSearchResultMap);
			req.setAttribute("searchCategoryMap", searchCategoryMap);

			if ("GET".equalsIgnoreCase(req.getMethod())) {
				// GET으로 들어왔을 경우 = 정상적으로 들어왔을 경우 = 초기화면 or 검색 or 페이징

				OrderDAO odao = new OrderDAO_imple();

				// 유저가 입력한 검색값을 설정한다
				String colName = req.getParameter("searchCategory");
				String value = req.getParameter("searchOrderInput");
				String order = req.getParameter("orderSearchResult");
				String currentPageNo = req.getParameter("currentPageNo");

				if (colName == null || (!"orderId".equals(colName) && !"orderDay".equals(colName)
						&& !"memberId".equals(colName) && !"name".equals(colName))) {
					// 유저가 검색값을 입력하지 않았을 경우 혹은 잘못된 검색값을 입력하였을 경우
					colName = "";
				}
				
				if (value == null) {
					// 유저가 검색값을 입력하지 않았을 경우 혹은 잘못된 검색값을 입력하였을 경우
					value = "";
				}

				if (order == null || (!"orderIdUp".equals(order) && !"orderIdDown".equals(order)
						&& !"orderDayUp".equals(order) && !"orderDayDown".equals(order) && !"fullNameUp".equals(order)
						&& !"fullNameDown".equals(order))) {
					// 유저가 검색값을 입력하지 않았을 경우 혹은 잘못된 검색값을 입력하였을 경우
					order = "";
				}

				switch (order) {
				// 유저가 선택한 정렬방식 값에 따라 sql문에 들어갈 파라미터 값을 설정한다
				case "orderIdUp":
					order = "orderId";
					break;
				case "orderIdDown":
					order = "orderId Desc";
					break;
				case "orderDayUp":
					order = "orderDay";
					break;
				case "orderDayDown":
					order = "orderDay Desc";
					break;
				case "fullNameUp":
					order = "name Desc";
					break;
				case "fullNameDown":
					order = "name Desc";
					break;
				default:
					order = "orderId";
					break;
				}
				

				// dao에 파라미터로 넘겨줄 값을 설정한다
				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("colName", colName);
				paraMap.put("value", value);
				paraMap.put("order", order);
				
				// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총 페이지 수 알아오기
				int totalPage = odao.getTotalPage(paraMap);

				if (currentPageNo == null) {
					// 페이징 처리로 들어오지 않은 첫페이지일 경우
					currentPageNo = "1";
				}
				// ==== GET 방식이므로 사용자 웹브라우저 주소창에서 currentShowPageNo 에 totalPage값 보다 더 큰 값을 입력하여
				// 장난친 경우
				// ==== GET 방식이므로 사용자 웹브라우저 주소창에서 currentShowPageNo 에 0 또는 음수를 입력하여 장난친 경우
				// ==== GET 방식이므로 사용자 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자열 입력하여 장난친 경우
				// 아래처럼 막아주도록 하겠다.
				try {
					if (Integer.parseInt(currentPageNo) > totalPage || Integer.parseInt(currentPageNo) <= 0) {
						currentPageNo = "1";
					}

				} catch (NumberFormatException e) {
					currentPageNo = "1";
				}

				paraMap.put("pageNum", currentPageNo);

				if (colName == "") {
					// 검색이 아닌 초기화면 or 페이징처리로 들어온 경우이다

					req.setAttribute("orderList", odao.getOrderList(Integer.parseInt(currentPageNo)));

				} else {
					// 검색으로 들어온 경우

					req.setAttribute("orderList", odao.searchOrder(paraMap));
				}

				String pageBar = "";

				if (totalPage > 0) {

					int blockSize = 10;
					// blockSize는 블럭(토막)당 보여지는 페이지 번호의 갯수이다.

					int loop = 1;
					// loop는 1부터 증가하여 1개 블럭을 이루는 페이지 번호의 개수 (지금은 10개)까지만 증가하는 용도이다.

					// ==== !!! 다음은 pageNo 구하는 공식이다. !!! ==== //
					int pageNo = ((Integer.parseInt(currentPageNo) - 1) / blockSize) * blockSize + 1;
					// pageNo는 페이지바에서 보여지는 첫번째 번호이다.

					// **** [맨처음][이전] 만들기 ***** ///
					// pageNo ==> 11

					pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?searchCategory=" + req.getParameter("searchCategory") 
							+ "&searchOrderInput=" + value 
							+ "&orderSearchResult=" + req.getParameter("orderSearchResult") 
							+ "&currentPageNo=1'><<</a></li>";

					if (pageNo != 1) {
						pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?searchCategory=" + req.getParameter("searchCategory") 
								+ "&searchOrderInput=" + value
								+ "&orderSearchResult=" + req.getParameter("orderSearchResult") 
								+ "&currentPageNo=" + (pageNo - 1) + "'>[이전]</a></li>";
					}

					while (!(loop > blockSize || pageNo > totalPage)) {

						if (pageNo == Integer.parseInt(currentPageNo)) {
							pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
						} else {
							pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?searchCategory=" + req.getParameter("searchCategory") 
									+ "&searchOrderInput=" + value
									+ "&orderSearchResult=" + req.getParameter("orderSearchResult")
									+ "&currentPageNo=" + pageNo + "'>" + pageNo + "</a></li>";
						}
						loop++;

						pageNo++;

					} // end of while-------------------

					// **** [다음][마지막] 만들기 ***** ///
					// pageNo ==> 11
					if (pageNo <= totalPage) {
						pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?searchCategory=" + req.getParameter("searchCategory")
								+ "&searchOrderInput=" + value
								+ "&orderSearchResult=" + req.getParameter("orderSearchResult") 
								+ "&currentPageNo=" + pageNo + "'>[다음]</a></li>";
					}
					pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?searchCategory=" + req.getParameter("searchCategory") 
							+ "&searchOrderInput=" + value 
							+ "&orderSearchResult=" + req.getParameter("orderSearchResult") 
							+ "&currentPageNo=" + totalPage + "'>>></a></li>";
				}
				req.setAttribute("pageBar", pageBar);
				/// **** ==== 페이지바 만들기 끝 =====/// ***

				req.setAttribute("colName", req.getParameter("searchCategory"));
				req.setAttribute("value", req.getParameter("searchOrderInput"));
				req.setAttribute("order", req.getParameter("orderSearchResult"));

				super.setRedirect(false);
				super.setViewPage("/jsp/admin/orderList.jsp");

			} else {
				// POST로 들어왔을 경우 = 잘못된 경로로 들어왔을 경우

				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			}

		} else {
			// 로그인하지 않았을 경우 (확인 완료)

			String message = "권한이 없습니다. 관리자 로그인 후 이용해주세요. 인덱스 화면으로 이동합니다.";
			// path 수정필
			String loc = req.getContextPath() + "/index.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");

		} // end of if (session.getAttribute("loginUser") != null) -----------------------------------------------------
	}

}
