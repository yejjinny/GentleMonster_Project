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
		 
		/*	
			System.out.println("~~~ 확인용 email : " + email);
			System.out.println("~~~ 확인용 pwd : " + pwd);
			System.out.println("~~~ 확인용 clientip : " + clientip);
		*/	
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("email", email);
			paraMap.put("pwd", pwd);
			paraMap.put("clientip", clientip);
			
			MemberDAO mdao = new MemberDAO_imple();
			
			MemberVO loginUser = mdao.selectOneMember(paraMap);
			
			if(loginUser != null) {
			//	System.out.println("로그인 성공!");
				
							
				// 로그인 성공시
			//	System.out.println( ">>> 확인용 로그인한 사용자명 : " + loginUser.getFamilyName() + loginUser.getLastName() );
				
				
				HttpSession session = request.getSession(); 
				// WAS 메모리에 생성되어져 있는 session 을 불러오는 것이다.
				
				session.setAttribute("loginUser", loginUser);
				// session(세션)에 로그인 되어진 사용자 정보인 loginuser 를 키이름을 "loginuser" 으로 저장시켜두는 것이다. 
				
			/*
				if(loginuser.isRequirePwdChange() == true) {
					// 비밀번호를 변경한지 3개월 이상된 경우 
									
					String message = "비밀번호를 변경하신지 3개월이 지났습니다.\\n암호를 변경하는 페이지로 이동합니다!!";
					String loc = request.getContextPath()+"/index.up";
					// 원래는 위와같이 index.up 이 아니라 암호를 변경하는 페이지로 URL을 잡아주어야 한다.!!
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false); 
					super.setViewPage("/WEB-INF/msg.jsp");
					
					return; // 메소드 종료
				}
				else {
					// 비밀번호를 변경한지 3개월 미만인 경우
					
					// 페이지 이동을 시킨다.
					super.setRedirect(true);
					super.setViewPage(request.getContextPath()+"/index.up");
				}
			*/
				
				// 페이지 이동을 시킨다.
				super.setRedirect(true);
				super.setViewPage(request.getContextPath()+"/index.gm");
				
			}
			
			else {
			//	System.out.println("~~~ 확인용 로그인 실패 ㅜㅜ");
				
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
