package member.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import member.domain.MemberVO;
import member.model.*;
import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-비밀번호 변경 Controller
 */
public class MemberChangePwdKeyAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {



		HttpSession session = req.getSession();
		String method=req.getMethod();  
		
		if (session.getAttribute("userEmail") != null) {
			
			if("POST".equalsIgnoreCase(method)) {
				
				
				String password = req.getParameter("password");
	
				String email= (String) session.getAttribute("userEmail");
				 
				
				MemberDAO mao= new MemberDAO_imple();
				
				 Map<String, String> paraMap= new HashMap<>();
				 
				 paraMap.put("password", password);
				 paraMap.put("email", email);
				
				
				try {
					int result  =  mao.updateMemberPwdKey(paraMap);
					 
					if(result==1) { //비번 변경 성공 시
						
						boolean isExists =true; 
						   
						   
						   
						   JSONObject jsonObj= new JSONObject();  
						   jsonObj.put("isExists", isExists); 
						    
						   
						   String json= jsonObj.toString();  
						  req.setAttribute("json", json);
						 
						 
						  //super.setRedirect(false); 
						  super.setViewPage("/jsp/common/jsonview.jsp");
						  
					}
					else { // 비번 업뎃 실패한경우
						

						boolean isExists =false; 
						   
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
				// POST 방식이 아니라면
				
				String message = "비정상적인 경로로 들어왔습니다.";
			      String loc = "javascript:history.back()";
			      
			      req.setAttribute("message", message);
			      req.setAttribute("loc", loc);
			      
			   //   super.setRedirect(false);
			      super.setViewPage("/jsp/common/msg.jsp");
			}
			
			
		}
		else {
			   //로그인을 안했으면
			   String message="비밀번호를 수정 하기 위해서는 먼저 이메일 인증을 하세요!!";
			   String loc="javascript:history.back()";
			   
			   req.setAttribute("message", message);
			   req.setAttribute("loc", loc);
			   
			   super.setRedirect(false);
			   super.setViewPage("/jsp/common/jsonview.jsp");
			   
			   
		   }
		

	}

}
