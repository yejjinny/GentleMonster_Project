package address.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import address.domain.AddressBookVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
 

public class AddressBookEditViewAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		String method=req.getMethod(); //"GET" 또는 "POST"
		if("POST".equalsIgnoreCase(method)) {
			
			
			String addressbookid =req.getParameter("addressbookid");
			//System.out.println(" addressbookid =>"+addressbookid);
			
			AddressDAO dao= new AddressDAO_imple();
			
			AddressBookVO editAvo= dao.selectEditAddrView(addressbookid);
			//MemverVO loginuser=  mdao.selectOneMember(paraMap);
			
			if(editAvo != null ) {
				
				
				req.setAttribute("editAvo", editAvo);
				
				System.out.println("성공");
				
				super.setRedirect(false);
				super.setViewPage("/jsp/member/addressBook/EditAddressBook.jsp");
				 
			
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
