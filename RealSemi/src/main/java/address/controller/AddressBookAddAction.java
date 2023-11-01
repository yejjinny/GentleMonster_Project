package address.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;

public class AddressBookAddAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		
		HttpSession session = req.getSession();
		String method=req.getMethod(); //"GET" 또는 "POST"
		if("GET".equalsIgnoreCase(method)) {
			
			

			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		      
			int memberId = loginUser.getMemberId();
			
			req.setAttribute("memberId", memberId);
			
			//System.out.println("memberId=>"+memberId);
			
			super.setRedirect(false);
			super.setViewPage("/jsp/member/addressBook/addAddressBook.jsp");
			
			
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
