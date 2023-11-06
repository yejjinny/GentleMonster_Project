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
		
	     
	      
	      HttpSession session = req.getSession();
	      MemberVO loginUserr = (MemberVO)session.getAttribute("loginUser");
	      
	      String memberId = req.getParameter("memberIdd"); 
			//System.out.println("toad: "+ memberId );
	      

			String method=req.getMethod(); //"GET" 또는 "POST"
			
			if("POST".equalsIgnoreCase(method)) { 
				
				 if( Integer.toString( loginUserr.getMemberId()).equals(memberId)  ) {
			    	  // 로그인한 사용자가 자신의 정보를 수정하는 경우
			    	  
			    	 // request.setAttribute("userid", userid);

				      //super.setRedirect(false);
			    	  super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify01.jsp");
			    	 
			    	   
						
				      //super.setViewPage("/WEB-INF/member/memberEdit.jsp");
				     
			     }
			      
				
			}  
			else {
				// POST 방식이 아니라면
				
				String message = "비정상적인 경로로 들어왔습니다.";
			      String loc = "javascript:history.back()";
			      
			      req.setAttribute("message", message);
			      req.setAttribute("loc", loc);
			      
			   //   super.setRedirect(false);
			      super.setViewPage("/jsp/common/msg.jsp");
			}
	      
	     
		
	}

}
