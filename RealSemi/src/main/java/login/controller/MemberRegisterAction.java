package login.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberRegisterAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod(); // "GET" 또는 "POST" 
		
		if("GET".equalsIgnoreCase(method)) { // "GET" 방식으로 들어왔을 떄
			super.setRedirect(false);
			super.setViewPage("/jsp/register/memberRegister.jsp");
		}
	
		else { // "POST" 방식으로 들어왔을 떄
			
			String email = request.getParameter("email");
			String pwd = request.getParameter("pwd");

			//System.out.println(request.getParameter("gender"));
			// int gender = Integer.parseInt(request.getParameter("gender"));
			String gender = request.getParameter("gender");
			
			
			String familyName = request.getParameter("familyName");
			String lastName = request.getParameter("lastName");
			
			String mb_birth_year = request.getParameter("mb_birth_year");
			String mb_birth_month = request.getParameter("mb_birth_month");
			String mb_birth_day = request.getParameter("mb_birth_day");
			String birth = mb_birth_year +"/"+ mb_birth_month +"/"+ mb_birth_day;
			
			MemberVO member;
			MemberDAO mdao; 
			if(gender != null) { // 회원가입시 gender 선택했을 경우
				int int_gender = Integer.parseInt(gender);
				
				member = new MemberVO(email, pwd, int_gender, familyName, lastName, birth);
				mdao = new MemberDAO_imple();
			}
			else { // 회원가입시 gender 선택하지 않았을 경우 
				member = new MemberVO(email, pwd, familyName, lastName, birth);	
				mdao = new MemberDAO_imple();
			}
			
	/* 지워 이거 우리는 자동로그인 할 거임 	
			// === 회원가입이 성공되어지면 "회원가입 성공" 이라는 alert 를 띄우고 시작페이지로 이동한다. === //
			String message = "";
			String loc = "";
			
			try {
				int n = mdao.registerMember(member);
				
				if(n==1) {
					message = "회원가입 성공";
					loc = request.getContextPath()+"/index.gm"; // 시작페이지로 이동한다.
				}
			} catch(SQLException e) {
				message = "SQL구문 에러발생";
				loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는 것. 
				e.printStackTrace();
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false); 
			super.setViewPage("/jsp/common/msg.jsp");
	*/		
			
			
			// #### 회원가입이 성공되어지면 자동으로 로그인 되도록 하겠다. ### //
			try {
				int n = mdao.registerMember(member);
				
				if(n==1) {
				   request.setAttribute("email", email); 
				   request.setAttribute("pwd", pwd); 
				   
				   super.setRedirect(false);
				   super.setViewPage("/jsp/register/memberRegister_after_autoLogin.jsp");
				}
			} catch(SQLException e) {
				e.printStackTrace();
				
				String message = "SQL구문 에러발생";
				String loc = "javascript:history.back()"; // 자바스크립트를 이용한 이전페이지로 이동하는 것. 
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false); 
				super.setViewPage("/jsp/common/msg.jsp");
			}	
			
		}
			
	}

}
