package admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberDetailAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginUser") != null
				&& ((MemberVO) session.getAttribute("loginUser")).getGrade() == 2) {
			// 로그인 했을 경우 && 관리자 등급일 경우

			if ("POST".equalsIgnoreCase(req.getMethod())) {
				// POST로 들어온 경우 = 정상적으로 들어온 경우

				MemberDAO mdao = new MemberDAO_imple();

				MemberVO mvo = mdao.getMemberOne(req.getParameter("memberId"));

				JSONObject jsonObj = new JSONObject();

				jsonObj.put("memberId", mvo.getMemberId());
				jsonObj.put("email", mvo.getEmail());
				jsonObj.put("name", mvo.getFullName());
				jsonObj.put("birth", mvo.getBirth());
				jsonObj.put("registerDay", mvo.getRegisterDay());

				switch (mvo.getGender()) {
				case 1:
					jsonObj.put("gender", "남성");
					break;
				case 2:
					jsonObj.put("gender", "여성");
					break;
				case 3:
					jsonObj.put("gender", "선택 안함");
					break;
				}

				req.setAttribute("json", jsonObj);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/jsonview.jsp");

			} else {
				// GET으로 들어온 경우 = 잘못된 경로로 들어온 경우

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
			String loc = req.getContextPath() + "/register/login.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
		}
	}

}
