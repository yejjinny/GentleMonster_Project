package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;

public class MemberInfoEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		

		MemberVO loginUser = new MemberVO();
		loginUser.setEmail("hi@naver.com");
		loginUser.setPwd("Qwer1234$");
		loginUser.setMemberId(1112);
		loginUser.setFamilyName("홍");
		loginUser.setLastName("길동");
		loginUser.setBirth("19990127");
		loginUser.setGender(2); //여자
		HttpSession session = req.getSession();

		session.setAttribute("loginUser", loginUser);
		
		
		
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
		 
		 
	/*
		if (session.getAttribute("loginUser") != null) {
			//로그인 했을 경우
			 //super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
			
			//---
			

			// super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
		      
		     // HttpSession session = req.getSession();
		      MemberVO loginUserr = (MemberVO)session.getAttribute("loginUser");
		      //System.out.println("dsfs"+ req.getParameter("memberId") );
		 
		      
			     String memberId = req.getParameter("memberIdd");
			      System.out.println("dsfs"+ memberId );
		    
		      //loginUserr.getMemberId()==memberId
		      //Integer.toString( loginUserr.getMemberId()).equals(memberId) 
		      if( Integer.toString( loginUserr.getMemberId()).equals(memberId)  ) {
		    	  // 로그인한 사용자가 자신의 정보를 수정하는 경우
		    	  
		    	 // request.setAttribute("userid", userid);

			      //super.setRedirect(false);
		    	  super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.jsp");
		    	  
		    	   
					
			      //super.setViewPage("/WEB-INF/member/memberEdit.jsp");
			     
		     }
		     else {
		    	// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
		    	  
		    	  String message="다른 사용자의 정보 변경을 불가합니다!!";
				   String loc="javascript:history.back()";
				   
				   //request.setAttribute("message", message);
				   //request.setAttribute("loc", loc);
				   
				   super.setRedirect(false);
				   super.setViewPage("/WEB-INF/msg.jsp");
				   
		      }
		      
			
			
			
			//---
		   
			if ("GET".equalsIgnoreCase(req.getMethod())) {
				 
				String userid = req.getParameter("userid");
				//MemberDAO mdao = new MemberDAO_imple();
				
				req.setAttribute("userid", userid);

				super.setRedirect(false);
				super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
				
				
			} else {
				//post 로 들어온 경우 에러
				
			}
			
			
			

		} else {
			// 로그인하지 않았을 경우
			
		}
*/
	}

}
