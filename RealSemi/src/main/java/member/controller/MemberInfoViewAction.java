package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		String method=req.getMethod();  
		
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
