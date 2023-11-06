package order.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import order.model.OrderDAO;
import order.model.OrderDAO_imple;

/**
 * 작성자 신예진 주문내역 Controller
 */
public class OrderListAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null) {
			// 로그인 했을 경우

			if ("GET".equalsIgnoreCase(req.getMethod())) {
				// GET으로 들어온 경우 = 정상적으로 들어온 경우

				// 현재페이지
				String currentPageNo = req.getParameter("currentPageNo");

				OrderDAO odao = new OrderDAO_imple();

				Map<String, String> paraMap = new HashMap<>();
				paraMap.put("memberId", String.valueOf(((MemberVO) session.getAttribute("loginUser")).getMemberId()));

				// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 회원에 대한 총 페이지 수 알아오기
				int totalPage = odao.getPersonalTotalPage(paraMap);

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

				req.setAttribute("orderList", odao.getPersonalOrderList(paraMap));

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

					pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?currentPageNo=1'><<</a></li>";

					if (pageNo != 1) {
						pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?currentPageNo=" + (pageNo - 1) + "'><</a></li>";
					}

					while (!(loop > blockSize || pageNo > totalPage)) {

						if (pageNo == Integer.parseInt(currentPageNo)) {
							pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo
									+ "</a></li>";
						} else {
							pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?currentPageNo="
									+ pageNo + "'>" + pageNo + "</a></li>";
						}
						loop++;

						pageNo++;

					} // end of while-------------------

					// **** [다음][마지막] 만들기 ***** ///
					// pageNo ==> 11
					if (pageNo <= totalPage) {
						pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?currentPageNo="
								+ pageNo + "'>></a></li>";
					}
					pageBar += "<li class='page-item'><a class='page-link' href='orderList.gm?currentPageNo="
							+ totalPage + "'>>></a></li>";
				}
				req.setAttribute("pageBar", pageBar);
				/// **** ==== 페이지바 만들기 끝 =====/// ***

				super.setRedirect(false);
				super.setViewPage("/jsp/order/orderList.jsp");

			} else {
				// POST로 들어온 경우 = 잘못된 경로로 들어온 경우

				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			}

		} else {
			// 로그인한 유저가 아닐 경우
			String message = "주문은 로그인 한 후 이용해주세요. 로그인 화면으로 이동합니다.";
			// 수정필
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}

	}

}
