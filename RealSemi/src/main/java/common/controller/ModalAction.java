package common.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ModalAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		if ("GET".equals(req.getMethod())) {
			// GET으로 들어왔을 경우 = 정상적인 경로로 들어왔을 경우
			
			String modalName = req.getParameter("modalName");
			if(modalName != null && !modalName.isEmpty()) {
				super.setRedirect(false);
				super.setViewPage("/jsp/common/" + req.getParameter("modalName") + ".jsp");
			}else {
				String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
				String loc = req.getContextPath() + "/index.gm";

				req.setAttribute("message", message);
				req.setAttribute("loc", loc);

				super.setRedirect(false);
				super.setViewPage("/jsp/common/msg.jsp");
			}
			
			
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
