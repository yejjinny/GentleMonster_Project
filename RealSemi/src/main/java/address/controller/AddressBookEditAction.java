package address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressBookVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
/*
 * 작성자 윤예인
 * 계정설정-주소록 Controller
 */
public class AddressBookEditAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 

		HttpSession session = req.getSession();
		String method=req.getMethod(); //"GET" 또는 "POST"
		if("POST".equalsIgnoreCase(method)) {
			

			 if (session.getAttribute("loginUser") != null) {
			 

					String addressbookid=req.getParameter("addressbookid");
					String fk_memberid=req.getParameter("fk_memberid");
					String familyname=req.getParameter("familyname");
					String lastname=req.getParameter("lastname");
					String tel=req.getParameter("tel");
					String postcode=req.getParameter("edit_pcode");
					String address=req.getParameter("address");
					String detailaddress=req.getParameter("detailaddress");
					String isdefaultaddr=req.getParameter("addrDefaultCheck");
				 
					 Map<String, String> paraMap= new HashMap<>();
					 paraMap.put("addressbookid", addressbookid);
					 paraMap.put("fk_memberid", fk_memberid);
					 paraMap.put("familyname", familyname);
					 paraMap.put("lastname", lastname);
					 paraMap.put("tel", tel);
					 paraMap.put("postcode", postcode);
					 paraMap.put("address", address);
					 paraMap.put("detailaddress", detailaddress);
					 paraMap.put("isdefaultaddr", isdefaultaddr);
					 
					 AddressDAO dao= new AddressDAO_imple();
					 
					
					 
					 int result = dao.updateEditAddress(paraMap);
					 
					 if(result==1) { //기존 주소 수정에 성공한 경우
						 
						 
						 Map<String, String> paraMapList= new HashMap<>();
						 paraMapList.put("memberId", fk_memberid);
							
						 List<AddressBookVO> addressList= dao.selectAddressLists(paraMapList);
						 
						 req.setAttribute("addressList", addressList);
						 
						 super.setRedirect(false);
						 super.setViewPage("/jsp/member/addressBook/addressBook.jsp");
					 }
				  
				 
				 
			 }
			 else {
				   //로그인을 안했으면
				   String message="주소록을 수정하려면 먼저 로그인을 하세요!!";
				   String loc="javascript:history.back()";
				   
				   req.setAttribute("message", message);
				   req.setAttribute("loc", loc);
				   
				   super.setRedirect(false);
				   super.setViewPage("/jsp/common/msg.jsp");
				   
				   
			  }
			
		}
		else {
			// POST방식이 아니라면
			
			String message = "비정상적인 경로로 들어왔습니다.";
		      String loc = "javascript:history.back()";
		      
		      req.setAttribute("message", message);
		      req.setAttribute("loc", loc);
		      
		   //   super.setRedirect(false);
		      super.setViewPage("/jsp/common/msg.jsp");
		}
		
		 
	}

}
