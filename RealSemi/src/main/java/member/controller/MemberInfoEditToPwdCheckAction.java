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

public class MemberInfoEditToPwdCheckAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub
		//String userid =req.getParameter("userid");
		//String userid =(String) req.getAttribute("userid");
		HttpSession session = req.getSession();
		
		//((MemberVO) session.getAttribute("loginUser")).getPwd();
		//System.out.println("확이뇨 : "+((MemberVO) session.getAttribute("loginUser")).getMemberId());
		//String userid =(String) req.getAttribute("userid");
		//System.out.println("확인: "+userid);
		
		
		String check_password_pw =req.getParameter("check_password_pw");
		 MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		 
		 
		 
		//System.out.println("확인 loginUser.getMemberId(): "+loginUser.getMemberId() );
		//System.out.println("확인: "+check_password_pw);
		
		

		//Map<String, Integer> paraMap = new HashMap<>();
		//paraMap.put("memberId", loginUser.getMemberId());
		//paraMap.put("pwd", pwd);
		 
		/*
		 * Map<String, String> paraMap = new HashMap<>(); paraMap.put("memberId",
		 * Integer.toString(loginUser.getMemberId() ) ); paraMap.put("pwd",
		 * check_password_pw);
		 * 
		 * MemberDAO mdao= new MemberDAO_imple();
		 */
		//System.out.println("memberId: "+Integer.toString(loginUser.getMemberId() ));
		//boolean IsMemberInfoEditPwdCheck = mdao.selectPwdCheck(paraMap);
		
		//super.setRedirect(false);
		super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo_modify02.jsp");
		
		
	}

}
