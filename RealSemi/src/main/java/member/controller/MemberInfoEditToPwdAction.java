package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;

import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberInfoEditToPwdAction extends AbstractController{

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		/*
		 * MemberVO loginUser = new MemberVO(); loginUser.setEmail("hi@naver.com");
		 * loginUser.setPwd("1234"); loginUser.setMemberId(1235);
		 * 
		 * HttpSession session = req.getSession();
		 * 
		 * session.setAttribute("loginUser", loginUser);
		 * 
		 * String memberId = req.getParameter("memberId"); System.out.println("toa: "+
		 * memberId );
		 */
		String memberId = req.getParameter("memberIdd"); 
		System.out.println("toad: "+ memberId );
	     
	      
	      HttpSession session = req.getSession();
	      MemberVO loginUserr = (MemberVO)session.getAttribute("loginUser");
	      
	      
	      
	      
	      if( Integer.toString( loginUserr.getMemberId()).equals(memberId)  ) {
	    	  // 로그인한 사용자가 자신의 정보를 수정하는 경우
	    	  
	    	 // request.setAttribute("userid", userid);

		      //super.setRedirect(false);
	    	  super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.jsp");
	    	  
	    	   
				
		      //super.setViewPage("/WEB-INF/member/memberEdit.jsp");
		     
	     }
	      
		/*
		if (session.getAttribute("loginUser") != null) {
			//로그인 했을 경우
			
			
			//---
			

		      int userid = Integer.parseInt( req.getParameter("check_password_pw") ) ;
		      
		     // HttpSession session = req.getSession();
		      MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
		      
		      if(loginuser.getMemberId()==userid) {
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
				MemberDAO mdao = new MemberDAO_imple();
				
				req.setAttribute("userid", userid);

				super.setRedirect(false);
				super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.jsp");
				
				
			} else {
				//post 로 들어온 경우 에러
				
			}
			 
		} else {
			// 로그인하지 않았을 경우
			
		}

		*/
	}

}
