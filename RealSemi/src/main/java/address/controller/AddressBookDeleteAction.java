package address.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;

public class AddressBookDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		HttpSession session = req.getSession();
		
		String method=req.getMethod(); //"GET" 또는 "POST"
		if("POST".equalsIgnoreCase(method)) {
			
			
			String addressbookid = req.getParameter("addressbookid");
			//System.out.println("addressbookid=>" +addressbookid);
			
			
			AddressDAO dao= new AddressDAO_imple();
			
			
			
			
			try {
				int result = dao.updateIsDeletedAddr(addressbookid);
				
				if(result==1) { //삭제 업데이트가 완
					
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
					  
				}
				
				
			}catch(SQLException e) {
				
				//message="SQL구문 에러발생";
				//loc=  "javascript:history.back()";//자바스크립트를 이용한 이전페이지로 이동
				
				e.printStackTrace();
			}
			
		}
		 else {
				//POST 방식이 아니라면
				
				String message = "비정상적인 경로로 들어왔습니다.";
			      String loc = "javascript:history.back()";
			      
			      req.setAttribute("message", message);
			      req.setAttribute("loc", loc);
			      
			   //   super.setRedirect(false);
			      super.setViewPage("/jsp/common/msg.jsp");
		 }
		
		
		

	}

}
