package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemberInfoViewAllAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		String method=req.getMethod(); //"GET" 또는 "POST"
		
		if("GET".equalsIgnoreCase(method)) {
		 super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
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
