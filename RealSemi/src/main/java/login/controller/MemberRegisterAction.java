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
			
			
			
			
			// ========== 회원가입 성공시 자동로그인 ========== //
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
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false); 
				super.setViewPage("/jsp/common/msg.jsp");
			}	
			
		}
			
	}

}
