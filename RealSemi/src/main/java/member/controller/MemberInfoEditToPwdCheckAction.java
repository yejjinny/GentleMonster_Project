package member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import member.domain.MemberVO;

import member.model.MemberDAO;
import member.model.MemberDAO_imple;
import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-회원정보 Controller
 */
public class MemberInfoEditToPwdCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 
		HttpSession session = req.getSession();
		
		 

		//안쓰는 클래스
		String method=req.getMethod();  
			
		String check_password_pw =req.getParameter("check_password_pw");
		 MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");

		
		//super.setRedirect(false);
		super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify02.jsp");
		
		 
		
	}

}
