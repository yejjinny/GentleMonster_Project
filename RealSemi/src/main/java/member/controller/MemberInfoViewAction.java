package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;

public class MemberInfoViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		
		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("hi@naver.com");
		loginUser.setPwd("Qwer1234$");
		loginUser.setMemberId(1234);
		loginUser.setFamilyName("홍");
		loginUser.setLastName("길동");
		loginUser.setBirth("19990127");
		loginUser.setGender(2); //여자
		HttpSession session = req.getSession();

		session.setAttribute("loginUser", loginUser);
		
		 
		
		String method=req.getMethod(); //"GET" 또는 "POST"
		
		if("GET".equalsIgnoreCase(method)) {
			
			
			if (session.getAttribute("loginUser") != null) {
				 
				 
				
				 super.setViewPage("/jsp/member/memberInfo/memberInfo_viewAll.jsp");
				 
			 }
			 else {
				   //로그인을 안했으면
				   String message="회원정보를 조회하기 위해서는 먼저 로그인을 하세요!!";
				   String loc="javascript:history.back()";
				   
				   req.setAttribute("message", message);
				   req.setAttribute("loc", loc);
				   
				   super.setRedirect(false);
				   super.setViewPage("/jsp/common/jsonview.jsp");
				   
				   
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
