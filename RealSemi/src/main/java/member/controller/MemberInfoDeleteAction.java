package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;
/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 


		HttpSession session = req.getSession();
		String method=req.getMethod();  
		
		
		if("GET".equalsIgnoreCase(method)) {
			
			 if (session.getAttribute("loginUser") != null) {

				  
					MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
				      
					int memberId = loginUser.getMemberId();
					
					 
					
					 MemberDAO mado= new MemberDAO_imple();
					 
					 int result =mado.updateIsDeletedMember(memberId);
					 
					 if( result==1) {
						 
						 
						 
						 session.removeAttribute("loginUser");
						 
						 super.setRedirect(false);
						 super.setViewPage("/jsp/common/index.jsp");
							
					 }
			 }
		
			
		}
		else {
			// GET 방식이 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
		      String loc = "javascript:history.back()";
		      
		      req.setAttribute("message", message);
		      req.setAttribute("loc", loc);
		      
		   //   super.setRedirect(false);
		      super.setViewPage("/jsp/common/msg.jsp");
		}
		 
		
		
		
	}

}
