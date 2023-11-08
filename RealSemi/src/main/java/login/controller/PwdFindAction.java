package login.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;
import my.util.GoogleMail;

/*
작성자 김민경
로그인 Controller 비밀번호 찾기
*/
public class PwdFindAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		String method = request.getMethod(); 
		HttpSession session = request.getSession();
		
		if("POST".equalsIgnoreCase(method)) { // 비밀번호 찾기 모달창에서 "찾기" 버튼을 클릭했을 경우
			
			String email = request.getParameter("email"); 
			
			MemberDAO mdao = new MemberDAO_imple();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("email", email);
			
			boolean isUserExist = mdao.isUserExist(paraMap);
			boolean sendMailSuccess = false; // 메일이 정상적으로 전송되었는지 유무를 알아오기 위한 용도 
			String certification_code = ""; // 인증키는 영문소문자 5글자 + 숫자 7글자 로 만들겠습니다.
			if(isUserExist) { // 회원으로 존재하는 경우
				
				Random rnd = new Random(); // 인증키를 랜덤하게 생성하도록 한다.
				
				char randchar = ' ';
				for(int i=0; i<5; i++) {
				 /*
				    min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
				    int rndnum = rnd.nextInt(max - min + 1) + min;
				       영문 소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.  	
				 */	
					randchar = (char) (rnd.nextInt('z' - 'a' + 1) + 'a');
					certification_code += randchar;
				}// end of for---------------------
				
				int randnum = 0;
				for(int i=0; i<7; i++) {
				 /*
				    min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
				    int rndnum = rnd.nextInt(max - min + 1) + min;
				       영문 소문자 'a' 부터 'z' 까지 랜덤하게 1개를 만든다.  	
				 */	
					randnum = rnd.nextInt(9 - 0 + 1) + 0;
					certification_code += randnum;
				}// end of for---------------------
				
				
				GoogleMail mail = new GoogleMail();
			
				try {
					mail.send_certification_code("비밀번호 재설정 인증코드", paraMap.get("email"), certification_code);
					sendMailSuccess = true; // 메일 전송 성공했음을 기록함.
					
				} catch(Exception e) {
					e.printStackTrace();
					sendMailSuccess = false; // 메일 전송 실패했음을 기록함.
				}
				
			} // end of if(isUserExist)-------------------
			
			request.setAttribute("isUserExist", isUserExist);
			request.setAttribute("email", email);
			request.setAttribute("sendMailSuccess", sendMailSuccess);
			session.setAttribute("certification_code", certification_code); 
			session.setAttribute("userEmail", paraMap.get("email"));
			
		}// end of if("POST".equalsIgnoreCase(method)){}------
		
		request.setAttribute("method", method);
		
		super.setRedirect(false);
		super.setViewPage("/jsp/register/pwdFind.jsp");		
		
	}


		
}


