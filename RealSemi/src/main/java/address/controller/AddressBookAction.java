package address.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import member.domain.MemberVO;
import address.domain.*;
import address.model.*;

 

public class AddressBookAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {
		 

		
		 ///super.setViewPage("/jsp/member/addressBook/noAddressBook.jsp");
		HttpSession session = req.getSession();
		String method=req.getMethod(); //"GET" 또는 "POST"
		
		MemberVO loginUser = (MemberVO)session.getAttribute("loginUser");
	      
		int memberId = loginUser.getMemberId();
		
		 if (session.getAttribute("loginUser") != null) {
			 
			 if("GET".equalsIgnoreCase(method)) {
				 
				//super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");
				 
				 Map<String, String> paraMap= new HashMap<>();
				 paraMap.put("memberId", Integer.toString(memberId));
				 
				 AddressDAO dao= new AddressDAO_imple();
				 
				 List<AddressVO> addressList= dao.selectAddressLists(paraMap);
				 
				 if( addressList.size()==0 ) { //등록된 주소가 없을경우
					 
					 super.setRedirect(false);
					 super.setViewPage("/jsp/member/addressBook/noAddressBook.jsp");
					 
				 }
				 else { //등록된 주소가 있을 경우
					 
					 req.setAttribute("addressList", addressList);
					 
					 super.setRedirect(false);
					 super.setViewPage("/jsp/member/addressBook/addressBook.jsp");
					 
				 }
			 }
			 else {
					// GET 방식이 아니라면
					
					String message = "비정상적인 경로로 들어왔습니다.";
				      String loc = "javascript:history.back()";
				      
				      req.setAttribute("message", message);
				      req.setAttribute("loc", loc);
				      
				   //   super.setRedirect(false);
				      super.setViewPage("/jsp/common/msg.jsp");
				}
			 
			 
			 
			
		 }
		 else {
			   //로그인을 안했으면
			   String message="주소록을 볼려면 먼저 로그인을 하세요!!";
			   String loc="javascript:history.back()";
			   
			   req.setAttribute("message", message);
			   req.setAttribute("loc", loc);
			   
			   super.setRedirect(false);
			   super.setViewPage("/jsp/common/msg.jsp");
			   
			   
		  }
		
		
		

		//session.setAttribute("loginUser", loginUser);
		
		//AddressVO loginUser = (AddressVO)session.getAttribute("loginUser");
	      
		 //회원가입 할 때 주소를 작성하지 않으므로
		//회원가입 후 첫 로그인시에 주소록에는 아무 내용이 없다.
		 //로그인 후 계정설정- 주소록 클릭시 gm 타고 액션으로 이동
		// 이 액션 에서 .. 멤버아이디를 가져와 회원 테이블과 주소록테이블을 조인해 값이 있는지 확인한다.
		// 셀렉해서 값이 있으면 주소록에 주소가 존재하는 것이다.
		// 그러므로 주소가 있는 주소록 뷰단페이지로 이동
		//이동한 뷰단페이지로 값을 넘겨줌?
		//주소록이 있는 뷰단페이지에서 
		// "수정" 누르면 기존 주소 입력되어진 상태의 주소창 으로 이동
		// "주소추가" 누르면 모든 값이 없는 추가 주소창 으로 이동
		
		//-------------------------------------------------------------------/
		//======주소록이 있는 뷰단페이지 ( "수정" "삭제" "기본 주소로 설정"  "다른 주소 추가하기") 
		// "수정" "누르면  gm연결 ..수정 뷰단페이지 연결  => 수정페이지는 로그인한 기존 주소값이 들어가 있어야한다.=> 저장 누르면 gm 연결=> 수정액션실행
		//"기본주소지로저장" 누르면 gm연결 => 기본주소지 업뎃하는 액션 실행
		//"다른 주소 추가하기" 누르면 gm연결 => 추가 뷰단페이지연결 (추가이므로 값이 없는 상태)->  저장누르면 gm연결-> 업뎃액션 실행 
		
		// 수정 액션에서 
		//주소 수정창에서 주소 검색해어 나온 결과를 클릭해야만 저장버튼이 눌려짐
		//기본주소지로 저장
		//수정 완료되면 "수정" 창에서 저장 누르면 수정된 주소록 목록페이지 띄움
		
		//삭제는 모달창 에서 확인 버튼 누르면 ? gm연결 .. 
		//삭제 액션 -> 삭제하면 삭제된 주소록 창 로딩
		//삭제 모달창에서 "취소" 누르면 주소목록페이지 새로고침됨  
		
		//------------------------------------------------------------------
		//없으면 주소가 없는 주소록 뷰단페이지로 이동
		 
		
	}

}
