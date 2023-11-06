package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoPwdCheck extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {



		 
		String method= req.getMethod(); 
		
		 if("POST".equalsIgnoreCase(method)) {
			
			String pwd=req.getParameter("pwd");
			 
			String memberId=req.getParameter("memberId");
			 
			
			 Map<String, String> paraMap= new HashMap<>();
			 paraMap.put("pwd", pwd);
			 paraMap.put("memberId", memberId);
			 
			 
			   MemberDAO mado= new MemberDAO_imple();
			   
			  
			   boolean isExists=mado.selectPwdCheck(paraMap);
			  
			   
			   
			   JSONObject jsonObj= new JSONObject();  
			   jsonObj.put("isExists", isExists); 
			  
			   
			   String json= jsonObj.toString();  
			  
			  req.setAttribute("json", json);
			  
			 
			  //super.setRedirect(false); 
			  super.setViewPage("/jsp/common/jsonview.jsp");
			  
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
