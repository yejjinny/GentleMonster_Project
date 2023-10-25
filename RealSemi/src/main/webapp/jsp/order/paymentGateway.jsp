<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
String ctx_Path = request.getContextPath();
//    /MyMVC
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>

<script type="text/javascript">

$(document).ready(function() {
	//	여기 링크를 꼭 참고하세용 http://www.iamport.kr/getstarted
   var IMP = window.IMP;     // 생략가능
   IMP.init('imp41442787');  // 중요!!  포트원(구 아임포트)에 가입시 부여받은 "가맹점 식별코드". 
	
   // 결제요청하기
   IMP.request_pay({
       pg : 'kakaopay', // 결제방식 PG사 구분
       pay_method : 'card',	// 결제 수단
       merchant_uid : 'merchant_' + new Date().getTime(), // 가맹점에서 생성/관리하는 고유 주문번호
       name : '${requestScope.productName}'+' 결제',	 // 코인충전 또는 order 테이블에 들어갈 주문명 혹은 주문 번호. (선택항목)원활한 결제정보 확인을 위해 입력 권장(PG사 마다 차이가 있지만) 16자 이내로 작성하기를 권장
       amount : 100,  
       /* amount : ${requestScope.productPrice},   */
       buyer_email : '${requestScope.email}', // 구매자 email
       buyer_name : '${requestScope.name}',	  // 구매자 이름 
       buyer_tel : '${requestScope.tel}',  // 구매자 전화번호 (필수항목)
       buyer_addr : '',  
       buyer_postcode : '',
       m_redirect_url : ''  // 휴대폰 사용시 결제 완료 후 action : 컨트롤러로 보내서 자체 db에 입력시킬것!
   },
   function(rsp) {
	   if ( rsp.success ) { // 카드결제가 성공되었다면  
		   
		   console.log("결제 success");
		   window.opener.goOrder_DB_Update();
 
 			
		    self.close(); // 자신의 팝업창을 닫는 것이다.
			
        } else { // 카드결제가 실패되었다면
        	alert("결제에 실패하였습니다.");
        	location.href="<%=ctx_Path%>/index.gm";
       }

   }); // end of IMP.request_pay()----------------------------

}); // end of $(document).ready()-----------------------------

</script>
</head>

<body>
</body>
</html>
