package member.model;

import java.sql.SQLException;
import java.util.Map;

import member.domain.MemberVO;

public interface MemberDAO {
	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;

	//회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	boolean selectPwdCheck(Map<String, String> paraMap)throws SQLException;
	
	
	//회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	boolean selectPwdCheck(String memberId, String pwd)throws SQLException;

	//회원정보 수정
	int updateEditMember(MemberVO member)throws SQLException;

	
	
}
