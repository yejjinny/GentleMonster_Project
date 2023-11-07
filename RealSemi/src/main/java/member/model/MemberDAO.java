package member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.domain.MemberVO;

public interface MemberDAO {
	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리) _ 민경
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;

	// 회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드 _ 예인
	boolean selectPwdCheck(Map<String, String> paraMap) throws SQLException;

	// 회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드 _ 예인
	boolean selectPwdCheck(String memberId, String pwd) throws SQLException;

	// 회원정보 수정 _ 예인
	int updateEditMember(MemberVO member) throws SQLException;

	// 회원탈퇴 _ 예인
	int updateIsDeletedMember(int memberId) throws SQLException;

	// 회원 비밀번호 일치하는지 확인하고, 일치하면 비밀번호 변경하는 메소드 _ 예인
	int updateMemberPwd(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기를 통해 이메일 인증 후 비밀번호를 변경할 때 사용 _ 예인
	int updateMemberPwdKey(Map<String, String> paraMap) throws SQLException;

	// 관리자_회원목록 페이지 갯수 취듯 _ 예진
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 관리자_회원목록 취득 _ 예진
	List<MemberVO> getMemberList(int currentPageNo) throws SQLException;

	// 관리자_회원목록 검색 _ 예진
	List<MemberVO> searchMember(Map<String, String> paraMap) throws SQLException;

	// 회원가입을 해주는 메소드 (tbl_member 테이블에 insert) _ 민경
	int registerMember(MemberVO member) throws SQLException;

	// 비밀번호 찾기(이메일을 입력받아서 해당 사용자가 존재하지는 유무를 알려준다) _ 민경
	boolean isUserExist(Map<String, String> paraMap) throws SQLException;

	// email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면
	// false 를 리턴한다) _ 민경
	boolean emailDuplicateCheck(String email) throws SQLException;

	// 관리자_회원목록 회원 상세정보 취득 _ 예진
	MemberVO getMemberOne(String memberId) throws SQLException;

}
