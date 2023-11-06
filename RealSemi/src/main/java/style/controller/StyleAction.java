package style.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import style.model.StyleDAO;
import style.model.StyleDAO_imple;

/**
 * 작성자 신예진
 * 스타일 Controller
 */
public class StyleAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if("GET".equalsIgnoreCase(req.getMethod())){
			// GET으로 들어왔을 때 = 정상 경로일 때
			
			StyleDAO dao = new StyleDAO_imple();
			
			// 스타일 정보 저장
			req.setAttribute("styleList", dao.getStyleList());
			
			super.setRedirect(false);
			super.setViewPage("/jsp/style/style.jsp");
			
		}else {
			// POST로 들어왔을 때 = 잘못된 경로일 때
			String message = "잘못된 경로입니다. 인덱스 화면으로 이동합니다.";
			String loc = req.getContextPath() + "/index.gm";

			req.setAttribute("message", message);
			req.setAttribute("loc", loc);

			super.setRedirect(false);
			super.setViewPage("/jsp/common/msg.jsp");
			
		}
		
		
	}
	
}
