package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-비밀번호 변경 Controller
 */
public class MemberToChangePwdAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 
		HttpSession session = req.getSession();
		String method=req.getMethod();  
		
		 if (session.getAttribute("loginUser") != null) {
			 
			 
			 if("GET".equalsIgnoreCase(method)) {
				 
				 
				 super.setRedirect(false); 
				  super.setViewPage("/jsp/member/editMemberInfo/changePwd.jsp");
				
				 
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
		 else {
				// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
				  
		    	  String message=" 다른사용자의 접근은 불가합니다!!";
				   String loc="javascript:history.back()";
				   
				   req.setAttribute("message", message);
				   req.setAttribute("loc", loc);
				   
				   super.setRedirect(false);
				   super.setViewPage("/jsp/common/msg.jsp");
			    	 
			 }
		  
	}

}
