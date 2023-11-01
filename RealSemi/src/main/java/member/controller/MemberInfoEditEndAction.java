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

public class MemberInfoEditEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		HttpSession session = req.getSession();

		//session.setAttribute("loginUser", loginUser);
		String method=req.getMethod(); //"GET" 또는 "POST"
		
		if("POST".equalsIgnoreCase(method)) {
			
			MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
		      
			int memberId = loginUser.getMemberId();
			
			String email = req.getParameter("email");
			int gender= Integer.parseInt(req.getParameter("gender") )  ;
			
			//System.out.println("확인용email_test : "+email);
			//System.out.println("확인용gender : "+gender);
			//System.out.println("loginUser.getMemberId()r : "+ Integer.toString( loginUser.getMemberId()  )   );
			
			
		
		 
		
		
		
		//loginUser.getEmail().equals(email)
			
			 if(session.getAttribute("loginUser") != null) {
		    	  // 로그인한 사용자가 자신의 정보를 수정하는 경우
				 try {
					 
					 	MemberVO member=new MemberVO(memberId, email,gender  );
						
						MemberDAO mdao = new MemberDAO_imple();
						
						int n = mdao.updateEditMember(member);
						
						if(n==1) {
							
							loginUser.setMemberId(memberId);
							loginUser.setEmail(email);
							loginUser.setGender(gender);
							
							 boolean isExists =true;//=mado.selectPwdCheck(memberId,pwd);
							   //System.out.println("json isExists-->"+ isExists ); 
							   
							   
							   JSONObject jsonObj= new JSONObject(); //{}
							   jsonObj.put("isExists", isExists); 
							   //{"isExists":true } 혹은{"isExists":false }
							   
							   String json= jsonObj.toString(); //문자열형태인 "{"isExists":true }"
							   //혹은"{"isExists":false }" 으로 만들어준다 //System.out.println("확인용-- json--<"+ json);
							   
							   //System.out.println("json-->"+json );
							  req.setAttribute("json", json);
							  //req.setAttribute("json", jsonObj);
							 
							  //super.setRedirect(false); 
							  super.setViewPage("/jsp/common/jsonview.jsp");
							
							//session 에 저장된 loginuser 를 변경된 사용자의 정보값으로 변경해야 한다.
							
							/*
							 * 
							 * HttpSession session = request.getSession(); MemverVO loginuser = (MemverVO)
							 * session.getAttribute("loginuser");
							 * 
							 * loginuser.setName(name); loginuser.setPwd(pwd); loginuser.setEmail(email);
							 * loginuser.setMobile(mobile); loginuser.setPostcode(postcode);
							 * loginuser.setAddress(address); loginuser.setDetailaddress(detailaddress);
							 * loginuser.setExtraaddress(extraaddress);
							 * 
							 */
							//message="회원정보 수정 성공";
							//loc=request.getContextPath() +  "/index.up";//시작페이지로 이동한다.
							
							
							
						}
						
					}catch(SQLException e) {
						
						//message="SQL구문 에러발생";
						//loc=  "javascript:history.back()";//자바스크립트를 이용한 이전페이지로 이동
						
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
		
		//-------------------------
		/*
		 * if(loginUser.getEmail().equals(email)) { // 로그인한 사용자가 자신의 정보를 수정하는 경우
		 * 
		 * 
		 * } else { // 로그인한 사용자가 다른 사용자의 정보를 수정하려고 시도하는 경우
		 * 
		 * }
		 */
		 
		//----------------------------

		   //MemberDAO mado= new MemberDAO_imple();
		   
			/*
			 * 
			 * boolean isExists =false;//=mado.selectPwdCheck(memberId,pwd);
			 * //System.out.println("json isExists-->"+ isExists );
			 * 
			 * 
			 * JSONObject jsonObj= new JSONObject(); //{} jsonObj.put("isExists", isExists);
			 * //{"isExists":true } 혹은{"isExists":false }
			 * 
			 * String json= jsonObj.toString(); //문자열형태인 "{"isExists":true }"
			 * //혹은"{"isExists":false }" 으로 만들어준다 //System.out.println("확인용-- json--<"+
			 * json);
			 * 
			 * //System.out.println("json-->"+json ); req.setAttribute("json", json);
			 * //req.setAttribute("json", jsonObj);
			 * 
			 * //super.setRedirect(false); super.setViewPage("/jsp/common/jsonview.jsp");
			 * 
			 * 
			 */
		  
		  
		  //------------------------------------------------
	/*	  
		   
		  
		  
			try {
				int n = mdao.updateEditMember(member);
				
				if(n==1) {
					
					loginUser.setMemberId(memberId);
					loginUser.setEmail(email);
					loginUser.setGender(gender);
					
					 boolean isExists =true;//=mado.selectPwdCheck(memberId,pwd);
					   //System.out.println("json isExists-->"+ isExists ); 
					   
					   
					   JSONObject jsonObj= new JSONObject(); //{}
					   jsonObj.put("isExists", isExists); 
					   //{"isExists":true } 혹은{"isExists":false }
					   
					   String json= jsonObj.toString(); //문자열형태인 "{"isExists":true }"
					   //혹은"{"isExists":false }" 으로 만들어준다 //System.out.println("확인용-- json--<"+ json);
					   
					   //System.out.println("json-->"+json );
					  req.setAttribute("json", json);
					  //req.setAttribute("json", jsonObj);
					 
					  //super.setRedirect(false); 
					  super.setViewPage("/jsp/common/jsonview.jsp");
					
					//session 에 저장된 loginuser 를 변경된 사용자의 정보값으로 변경해야 한다.
					
					/*
					 * 
					 * HttpSession session = request.getSession(); MemverVO loginuser = (MemverVO)
					 * session.getAttribute("loginuser");
					 * 
					 * loginuser.setName(name); loginuser.setPwd(pwd); loginuser.setEmail(email);
					 * loginuser.setMobile(mobile); loginuser.setPostcode(postcode);
					 * loginuser.setAddress(address); loginuser.setDetailaddress(detailaddress);
					 * loginuser.setExtraaddress(extraaddress);
					 * 
					 
					//message="회원정보 수정 성공";
					//loc=request.getContextPath() +  "/index.up";//시작페이지로 이동한다.
					
					
					
				}
				
			}catch(SQLException e) {
				
				//message="SQL구문 에러발생";
				//loc=  "javascript:history.back()";//자바스크립트를 이용한 이전페이지로 이동
				
				e.printStackTrace();
			}
			 
		  */
			/*
			 * 
			 * if (session.getAttribute("loginUser") != null) {
			 * 
			 * super.setViewPage(
			 * "/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
			 * 
			 * }
			 */
		
		//super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");

	}

}
