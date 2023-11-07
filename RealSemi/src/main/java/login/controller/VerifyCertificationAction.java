package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;

public class VerifyCertificationAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		if ("POST".equalsIgnoreCase(method)) {

			HttpSession session = request.getSession(); 
			String certification_code = (String) session.getAttribute("certification_code");
			String userCertificationCode = request.getParameter("userCertificationCode");
			
			session.removeAttribute("certification_code"); // 세션에 저장된 인증코드 삭제

			JSONObject jsonObj = new JSONObject();
			if (certification_code.equals(userCertificationCode)) { // 인증코드가 일치하는 경우
				session.getAttribute("userEmail");
				jsonObj.put("isSame", true);
			} else { // 인증코드가 일치하지 않는 경우
				jsonObj.put("isSame", false);
			}

			request.setAttribute("json", jsonObj.toString());
			
		 // super.setRedirect(false);
			super.setViewPage("/jsp/common/jsonview.jsp");

		} // end of if("POST".equalsIgnoreCase(method))------------

	}

}
