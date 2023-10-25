package member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class MemberInfoViewAllAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse res) throws Exception {


		 super.setViewPage("/jsp/member/editMemberInfo/memberInfo_accountSet_memberInfo.jsp");

	}

}
