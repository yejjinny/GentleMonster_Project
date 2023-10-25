package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import member.model.MemberDAO;
import member.model.MemberDAO_imple;

public class MemberInfoPwdCheck extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {



		 
		String method= req.getMethod();//get 또는 post 가 나옴
		
		 if("POST".equalsIgnoreCase(method)) {
			
			String pwd=req.getParameter("pwd");
			// $("input#userid").val()  의 값을 받아온다.
			String memberId=req.getParameter("memberId");
			
			System.out.println("확인용 pwd java-->"+pwd );
			System.out.println("확인용 memberId java-->"+memberId );
			 
			   MemberDAO mado= new MemberDAO_imple();
			   
			   boolean isExists=mado.selectPwdCheck(memberId,pwd);
			   System.out.println("json isExists-->"+ isExists ); 
			   
			   
			   JSONObject jsonObj= new JSONObject(); //{}
			   jsonObj.put("isExists", isExists); 
			   //{"isExists":true } 혹은{"isExists":false }
			   
			   String json= jsonObj.toString(); //문자열형태인 "{"isExists":true }"
			   //혹은"{"isExists":false }" 으로 만들어준다 //System.out.println("확인용-- json--<"+ json);
			   
			   System.out.println("json-->"+json );
			  req.setAttribute("json", json);
			  //req.setAttribute("json", jsonObj);
			 
			  //super.setRedirect(false); 
			  super.setViewPage("/jsp/common/jsonview.jsp");
			  
		 }
		

	}

}
