package login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;

public class LogoutAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		HttpSession session = request.getSession(); 
		session.invalidate(); //  WAS 메모리 상에서 세션을 아예 삭제해버리기 
		
		super.setRedirect(true);
		super.setViewPage(request.getContextPath()+"/index.gm"); // 로그아웃을 하면 무조건 /index.gm 페이지로 돌아간다.
		
		
	}

}
