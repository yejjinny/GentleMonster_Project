package address.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import address.domain.AddressVO;
import address.model.AddressDAO;
import address.model.AddressDAO_imple;
import common.controller.AbstractController;
import member.domain.MemberVO;

public class AddressBookAddEndAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		// TODO Auto-generated method stub

		
		HttpSession session = req.getSession();
		String method=req.getMethod(); //"GET" 또는 "POST"
		if("POST".equalsIgnoreCase(method)) {
			
			 if (session.getAttribute("loginUser") != null) {
				 
				 MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
			      
					int memberId = loginUser.getMemberId();
					
					 
					String familyname=req.getParameter("familyname").trim();
					String lastname=req.getParameter("lastname").trim();
					String tel=req.getParameter("tel");
					String postcode=req.getParameter("edit_pcode");
					String address=req.getParameter("address");
					String detailaddress=req.getParameter("detailaddress");
					String isdefaultaddr=req.getParameter("addrDefaultCheck");
					
					
					//System.out.println("확인용:addressbookid +>"+addressbookid);
					/*
					 * System.out.println("확인용:memberId +>"+memberId);
					 * 
					 * System.out.println("확인용:lname +>"+familyname);
					 * System.out.println("확인용:pname +>"+lastname);
					 * System.out.println("확인용:mb_tel +>"+tel);
					 * System.out.println("확인용:edit_pcode +>"+postcode);
					 * System.out.println("확인용:address1 +>"+address);
					 * System.out.println("확인용:address2 +>"+detailaddress);
					 * System.out.println("확인용:addrDefaultCheck +>"+isdefaultaddr);
					 * 
					 */
					 
					 Map<String, String> paraMap= new HashMap<>();
				 
					 paraMap.put("memberId",  Integer.toString(memberId));
					 paraMap.put("familyname", familyname);
					 paraMap.put("lastname", lastname);
					 paraMap.put("tel", tel);
					 paraMap.put("postcode", postcode);
					 paraMap.put("address", address);
					 paraMap.put("detailaddress", detailaddress);
					 paraMap.put("isdefaultaddr", isdefaultaddr);
					 
					 AddressDAO dao= new AddressDAO_imple();
					 
					
					 
					 int result = dao.insertNewAddress(paraMap);
					 
					 if(result==1) { //새로운 주소 추가에 성공한 경우
						// System.out.println("추가성공");
						 
						 Map<String, String> paraMapList= new HashMap<>();
						 paraMapList.put("memberId", Integer.toString(memberId));
							
						 List<AddressVO> addressList= dao.selectAddressLists(paraMapList);
						 
						 req.setAttribute("addressList", addressList);
						 
						 super.setRedirect(false);
						 super.setViewPage("/jsp/member/addressBook/addressBook.jsp");
					 }
				 
			 }
			 else {
				   //로그인을 안했으면
				   String message="주소록을 추가하려면 먼저 로그인을 하세요!!";
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
		
		
		 
		 
		  
	}

}
