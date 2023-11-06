package address.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-주소록 Controller
 */
public class AddressBookDeleteAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		HttpSession session = req.getSession();
		
		String method=req.getMethod(); //"GET" 또는 "POST"
		if("POST".equalsIgnoreCase(method)) {
			
			
			String addressbookid = req.getParameter("addressbookid");
			 
			
			
			AddressDAO dao= new AddressDAO_imple();
			
			
			
			
			try {
				int result = dao.updateIsDeletedAddr(addressbookid);
				
				if(result==1) { //삭제 업데이트가 완
					
					boolean isExists =true; 
					    
					   
					   
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
