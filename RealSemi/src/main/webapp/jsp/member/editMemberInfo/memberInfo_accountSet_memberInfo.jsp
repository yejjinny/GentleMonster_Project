<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String ctxPath = request.getContextPath();
//    /tempSemi
%>




<%-- header meta 관련--%>
<jsp:include page="../../common/header_meta.jsp" />

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/memberInfo_accountSet_memberInfo.css" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/css/member/editMemberInfo/changePwd.css" />



<title>GENTLE MONSTER Official Site</title>
<%-- header --%>
<jsp:include page="../../common/header.jsp" />
<script type="text/javascript" src="<%=ctxPath%>/js/member/editMemberInfo/memberInfo_accountSet_memberInfo.js"></script>



<%-- 본문 --%>
<div class="container_sq">

	 
	<div class="account_setting contentswrap center_wrap account edit kr container-1350">

		<!-- 회원정보 Category 시작-->
		<div class="topnav">
			<div class="topnav-left">
				<div class="page_menu_item link_item font--kr font--15 font--bd">
					<a class="title" href="<%=ctxPath%>/member/memberInfoViewAll.gm">회원정보</a>
				</div>
			</div>
			<ul class="page_menu_items page_menu_pc_items">
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/member/memberInfoViewAll.gm" class="font--kr font--15 font--rg"> 전체보기 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/wish/wish.gm" class="font--kr font--15 font--rg"> 위시리스트 </a>
				</li>
				<li class="page_menu_item link_item  selected">
					<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--15 font--rg" data-category="account" data-action="account_setting" data-label=""> 계정 설정 </a>
				</li>
				<li class="page_menu_item link_item  ">
					<a href="<%=ctxPath%>/order/orderList.gm" class="font--kr font--15 font--rg"> 주문 </a>
				</li>
			</ul>
			<div class="topnav-right">
				<div class="page_menu_item link_item">
					<a class="font--kr font--15 font--rg" data-category="account" data-action="logout_click" data-label="" href="<%= ctxPath%>/register/logout.gm">로그아웃</a>
				</div>
			</div>
		</div>
		<!-- 회원정보 Category 끝-->


		<!-- 계정설정 본문 시작 -->
		<div class="contentswrap_top center_wrap">
			<div class="edit-wrap text_l">
				<div class="page_nav">
					<p class="title font--kr font--15 font--bd">계정 설정</p>
					<div class="page_menu_list">
						<ul class="page_menu_items page_menu_pc_items">
							<li class="page_menu_item link_item font--13 selected">
								<a href="<%=ctxPath%>/member/memberInfoEdit.gm" class="font--kr font--13 font--rg"> 회원정보 </a>
							</li>
							<!-- todo: move when develop layout -->
							<li class="page_menu_item link_item font--13 ">
								<a href="<%=ctxPath%>/address/addressBook.gm" class="font--kr font--13 font--rg"> 주소록 </a>
							</li>
							<li class="page_menu_item link_item font--13 ">
								<a href="<%=ctxPath%>/member/memberToChangePwd.gm" class="font--kr font--13 font--rg"> 비밀번호 변경 </a>
							</li>
						</ul>
					</div>
				</div>
				<div class="center-content account-detail-content">
				 
					<form name="EditToFrm"    > 
						<div class="account-detail-text">
							<input type="hidden" name="memberIdd" value ="${sessionScope.loginUser.memberId}"/>
							<p class="font--kr font--13 font--rg">성별: ${sessionScope.loginUser.genderVal}</p>
							<p class="font--kr font--13 font--rg">성: ${sessionScope.loginUser.familyName}</p>
							<p class="font--kr font--13 font--rg">이름: ${sessionScope.loginUser.lastName}</p>
							<p class="font--kr font--13 font--rg">생년월일: ${sessionScope.loginUser.birthYear}-${sessionScope.loginUser.birthMonth}-${sessionScope.loginUser.birthDay}</p>
							<p class="font--kr font--13 font--rg">이메일: ${sessionScope.loginUser.email}</p>
						</div>
				 	</form> 
					<div class="button-group">
					 	<button id="btnEdit" type="button" class="btn btn-black font--kr font--13 font--rg" onclick="goMemberInfo('<%=ctxPath%>')">수정하기</button> 
						 
					
					</div>
					<div class="button-group">
				 		   <button data-toggle="modal" data-target="#memberDeleteModal" type="button" class="btn btn-black font--kr font--13 font--rg">회원탈퇴</button>
						    
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 계정설정 본문 끝 -->

</div>


		 
		
		<!-- Modal -->
		<!-- Modal 구성 요소는 현재 페이지 상단에 표시되는 대화 상자/팝업 창입니다. -->
		<div class="modal fade" id="memberDeleteModal">
		  <div class="modal-dialog modal-dialog-centered">
		  <!-- .modal-dialog-centered 클래스를 사용하여 페이지 내에서 모달을 세로 및 가로 중앙에 배치합니다. -->
		    <div class="modal-content">
		      
		      <!-- Modal header -->
		      <div class="modal-header">
		      	<h2 class="title font--kr font--15 font--bd">회원탈퇴 안내</h2>
		       <!--  <h5 class="modal-title">회원탈퇴 안내</h5> -->
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		      </div>
		      
		      <!-- Modal body -->
		      <div class="modal-body">
			     <!--  <p class="list-title font--kr font--13 font--rg">회원탈퇴 전 유의사항을 확인해 주세요</p> -->
			      
			      
			      <ul class="list list-group list-group-flush    ">
			      		<li class="font--kr font--13 font--rg m-2    ">회원탈퇴 전 유의사항을 확인해 주세요</li>
						<li class="font--kr font--13 font--rg m-2    ">부정 이용을 방지하기 위하여 회원탈퇴 후 48시간 이내로 재가입이 불가합니다.  (단, 간편가입 회원은 즉시 재가입 가능합니다.)</li>
						<li class="font--kr font--13 font--rg m-2   ">탈퇴 즉시 개인정보가 삭제되고 어떠한 방법으로도 복원할 수 없습니다.</li>
						<li class="font--kr font--13 font--rg m-2   ">교환/반품/환불 및 사후처리(A/S) 등을 위하여 전자상거래 등에서의 소비자보호에 관한 법률에 의거해 일정 기간동안 보관 후 파기됩니다.</li>
					</ul>
					
					<input type="hidden" id="addrDefaultCheck" name="addrDefaultCheck" value="0"/>	
										 
					<div style="display:flex">
				
						<!-- <div style="  border:solid 2px black;   border-radius: 5px;   display:inline-block;   ">
							<button type="button" id="btnDefault" style="background-color: white;   height:100%; color:white;    " >버튼</button>
							
						</div> -->
					 
						 <div>
						 	 
							<span class="font--kr font--13 font--rg  m-2 ">위 유의사항을 모두 확인하였고, 회원탈퇴에 동의합니다.</span>																						 
						 </div>																							 								  
					</div>

				 
					
					
					
		       </div>
		      
		      <!-- Modal footer -->
		      <div class="modal-footer">
		      	<div class="section-row">
		      	
		      		<button type="button"   data-dismiss="modal" class="btn btn-white btn-close font--kr font--13 font--rg">취소</button>
		        	<button type="button"  id="talCheck" class="btn btn-white margin_l10 font--kr font--13 font--rg">확인</button>
		    
		    		 
		      	</div>
		       </div>
		       
		    </div>
		  </div>
		</div>
		







 


 










<%-- footer --%>
<jsp:include page="../../common/footer.jsp" />