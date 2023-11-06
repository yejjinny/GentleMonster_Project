package member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.domain.MemberVO;

import member.model.MemberDAO;
import member.model.MemberDAO_imple;
/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		HttpSession session = req.getSession();

		 
		String method=req.getMethod();  
		
		if("POST".equalsIgnoreCase(method)) {
			
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		      
			int memberId = loginUser.getMemberId();
			
			String email = req.getParameter("email");
			int gender= Integer.parseInt(req.getParameter("gender") )  ;
			
			 
			
		
		 
		
		
	 
			
			 if(session.getAttribute("loginUser") != null) {
		    	  // 로그인한 사용자가 자신의 정보를 수정하는 경우
				 try {
					 
					 	MemberVO member=new MemberVO(memberId, email,gender  ); //생성자
						
						MemberDAO mdao = new MemberDAO_imple();
						
						int n = mdao.updateEditMember(member);
						
						if(n==1) {
							//------------------------------------------
							loginUser.setMemberId(memberId);
							loginUser.setEmail(email);
							loginUser.setGender(gender);
							 
							
						 
							  
							//밑의 코드는 안해도 되는데 혹시나 싶어 다시 set.
							  loginUser.setPwd(loginUser.getPwd());
							  
							  loginUser.setFamilyName(loginUser.getFamilyName()); 
							  loginUser.setLastName(loginUser.getLastName());
							  loginUser.setBirth(loginUser.getBirth());
							  
							  //-----
							  loginUser.setGrade(loginUser.getGrade());
							  loginUser.setIsDeleted(loginUser.getIsDeleted());
							  loginUser.setRegisterDay(loginUser.getRegisterDay());
							  loginUser.setUpdateDay(loginUser.getUpdateDay());
							  loginUser.setFullName(loginUser.getFullName());
							  loginUser.setRno(loginUser.getRno());
						  
							  session.setAttribute("loginUser", loginUser);
							  
							  //--------------------------------
							 boolean isExists =true; 
							  
							   
							   
							   JSONObject jsonObj= new JSONObject();  
							   jsonObj.put("isExists", isExists); 
							   
							   
							   String json= jsonObj.toString();  
							   
							  req.setAttribute("json", json);
							   
							 
							  //super.setRedirect(false); 
							  super.setViewPage("/jsp/common/jsonview.jsp");
							
							 
							
							
						}
						
					}catch(SQLException e) {
						
						 
						e.printStackTrace();
					}
					
				 
			 } 
			 else {
				// 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
				  
		    	  String message="다른 사용자의 정보 변경을 불가합니다!!";
				   String loc="javascript:history.back()";
				   
				   req.setAttribute("message", message);
				   req.setAttribute("loc", loc);
				   
				   super.setRedirect(false);
				   super.setViewPage("/jsp/common/msg.jsp");
			    	 
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
