package login.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class LoginAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST" 
		
		
		// GET 방식으로 넘어온 것이라면 
		if("GET".equalsIgnoreCase(method)) {
			
			super.setRedirect(false);
			super.setViewPage("/jsp/register/login.jsp");
			
			return; // execute(HttpServletRequest request, HttpServletResponse response) 메소드 종료함. 
		}
		
		
		// POST 방식으로 넘어온 것이라면 
		else{
			
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");
			
			// === 클라이언트의 IP 주소를 알아오는 것 === //
			String clientip = request.getRemoteAddr();
		 
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("email", email);
			paraMap.put("pwd", pwd);
			paraMap.put("clientip", clientip);
			
			MemberDAO mdao = new MemberDAO_imple();
			MemberVO loginUser = mdao.selectOneMember(paraMap);
			
			if(loginUser != null) {
				
				HttpSession session = request.getSession(); 
				session.setAttribute("loginUser", loginUser);
				
				// 페이지 이동을 시킨다.
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/index.gm");
				
			}
			
			else {
				
				String message = "이메일 또는 비밀번호를 확인해주세요.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false); 
				super.setViewPage("/jsp/common/msg.jsp");
			
			}
		}
		
		
	}
}
