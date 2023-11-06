package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {

		HttpSession session = req.getSession();
 
		/* 테스트 코드
		  MemberVO loginUser = new MemberVO();
		  
			
			  loginUser.setEmail("hi@naver.com"); 
			  loginUser.setPwd("Qwer1234$");
			
		  
		  loginUser.setMemberId(1112);
		  
			
			 loginUser.setFamilyName("홍"); 
			 loginUser.setLastName("길동");
			 loginUser.setBirth("19990127");
			 loginUser.setGender(2); //여자
			
	  
		  session.setAttribute("loginUser", loginUser);
		 
		테스트 코드끝 */ 
		
		String method=req.getMethod(); //"GET" 또는 "POST"
		
		if("GET".equalsIgnoreCase(method)) {
			
			
			if (session.getAttribute("loginUser") != null) {
				 
				 
				
				 super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
				 
			 }
			 else {
				   //로그인을 안했으면
				   String message="계정설정을 하기 위해서는 먼저 로그인을 하세요!!";
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
