package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberInfoDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub


		HttpSession session = req.getSession();
		String method=req.getMethod(); //"GET" 또는 "POST"
		
		
		if("GET".equalsIgnoreCase(method)) {
			
			 if (session.getAttribute("loginUser") != null) {

				  
					MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
				      
					int memberId = loginUser.getMemberId();
					
					//System.out.println("memberId=>"+memberId);
					
					 MemberDAO mado= new MemberDAO_imple();
					 
					 int result =mado.updateIsDeletedMember(memberId);
					 
					 if( result==1) {
						 
						 System.out.println("탈퇴성공");
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
