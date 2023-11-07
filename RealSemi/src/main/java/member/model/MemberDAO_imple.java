package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.domain.MemberVO;
import util.security.AES256;
import util.security.Sha256;

public class MemberDAO_imple implements MemberDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	private AES256 aes;

	// 생성자
	public MemberDAO_imple() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi_oracle");

			/* aes = new AES256(SecretMyKey.KEY); */
			// SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.

		} catch (NamingException e) {
			e.printStackTrace();
		} /*
			 * catch (UnsupportedEncodingException e) { e.printStackTrace(); }
			 */

	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/*
	 * 예인 추가
	 * -----------------------------------------------------------------------------
	 * --------------------------
	 */
	// 회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	@Override
	public boolean selectPwdCheck(Map<String, String> paraMap) throws SQLException {

		boolean isExists = false;

		try {

			conn = ds.getConnection();

			String sql = " select pwd " + " from tbl_member " + " where memberId= ?  and pwd= ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("memberId"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));

			rs = pstmt.executeQuery();

			isExists = rs.next();

		} finally {

			close();
		}

		return isExists;

	} // end of boolean selectPwdCheck(Map<String, Integer> paraMap)------------

	// 회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	@Override
	public boolean selectPwdCheck(String memberId, String pwd) throws SQLException {

		boolean isExists = false;

		try {

			conn = ds.getConnection();

			String sql = " select pwd  " + " from tbl_member  " + " where memberId=? and pwd=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);
			pstmt.setString(2, pwd);

			rs = pstmt.executeQuery();

			isExists = rs.next();

		} finally {

			close();
		}

		return isExists;

	} // end of boolean selectPwdCheck(String memberId, String pwd) ------------

	// 회원정보 수정
	@Override
	public int updateEditMember(MemberVO member) throws SQLException {

		int result = 0;

		try {

			conn = ds.getConnection();

			String sql = " update tbl_member set email=? , gender=? , updateday=sysdate " + " where memberId=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getEmail());
			pstmt.setInt(2, member.getGender());
			pstmt.setInt(3, member.getMemberId());

			result = pstmt.executeUpdate();

		}

		finally {

			close();
		}

		return result;

	}// end of int updateEditMember(MemberVO member) ----

	// 회원 비밀번호 일치하는지 확인하고, 일치하면 비밀번호 변경하는 메소드
	@Override
	public int updateMemberPwd(Map<String, String> paraMap) throws SQLException {

		int result = 0;
		boolean isUserExist = false;
		String sql = "";

		try {

			conn = ds.getConnection();

			sql = " select pwd " + " from  tbl_member " + " where memberId=? and pwd=? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("memberId"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("reg_mb_password_old")));

			rs = pstmt.executeQuery();

			isUserExist = rs.next(); // 존재하면 true가 반환됨.

			if (isUserExist) { // 사용자가 입력한 비밀번호가 현재 로그인한 사용자비밀번호와 같다면

				sql = " update tbl_member set pwd=? , updateday=sysdate " + "where memberId=? ";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, Sha256.encrypt(paraMap.get("password")));
				pstmt.setString(2, paraMap.get("memberId"));

				result = pstmt.executeUpdate();
			} else { // 사용자가 입력한 비밀번호가 현재 로그인한 사용자비밀번호와 같지 않다면

				result = 0;
			}

		} finally {
			close();
		}

		return result;

	} // end ofint updateMemberPwd(Map<String, String> paraMap)------------

	// 회원탈퇴
	@Override
	public int updateIsDeletedMember(int memberId) throws SQLException {

		int result = 0;

		try {

			conn = ds.getConnection();

			String sql = " update tbl_member set isdeleted='1' " + "where memberId=?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberId);

			result = pstmt.executeUpdate();

		}

		finally {

			close();
		}

		return result;

	} // end of int updateIsDeletedMember(int memberId) throws

	// 비밀번호 찾기를 통해 이메일 인증 후 비밀번호를 변경할 때 사용 _ 예인
	@Override
	public int updateMemberPwdKey(Map<String, String> paraMap) throws SQLException {

		int result = 0;

		String sql = "";

		try {

			conn = ds.getConnection();

			sql = " update tbl_member set pwd=?" + "where email=? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Sha256.encrypt(paraMap.get("password")));
			pstmt.setString(2, paraMap.get("email"));

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;

	}// end of int updateMemberPwdKey(Map<String, String> paraMap)
	/*
	 * 예인 추가
	 * -----------------------------------------------------------------------------
	 * --------------------------
	 */

	// 예진 추가_ 관리자 회원목록 정보
	// ------------------------------------------------------------------------------------------

	// 관리자_회원목록 총 페이지 수 취득
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {

		int totalPage = 0;

		try {
			conn = ds.getConnection();

			String sql = "select ceil( count(*) / 10 ) from tbl_member where grade != 2 ";

			String colName = paraMap.get("colName");
			String searchKeyword = paraMap.get("value");

			if ((colName != null && !colName.trim().isEmpty())
					&& (searchKeyword != null && !searchKeyword.trim().isEmpty())) {

				sql += " and " + colName + " like '%' || ? || '%' ";
			}

			pstmt = conn.prepareStatement(sql);

			if ((colName != null && !colName.trim().isEmpty())
					&& (searchKeyword != null && !searchKeyword.trim().isEmpty())) {
				pstmt.setString(1, searchKeyword);
			}

			rs = pstmt.executeQuery();

			rs.next();

			totalPage = rs.getInt(1);

		} finally {
			close();
		}

		return totalPage;

	}

	// 관리자_회원목록 내용 취득
	@Override
	public List<MemberVO> getMemberList(int pageNum) throws SQLException {
		List<MemberVO> memberList = new ArrayList<>();

		try {
			conn = ds.getConnection();
			String sql = "select " + " rno, memberId, fullName, email, gender, isDeleted " + "from " + "(" + "select "
					+ "row_number() over (order by memberId) as rno, memberId, familyName || lastName as fullName, email, gender, isDeleted "
					+ "from  tbl_member " + "where grade != '2' " + ") "
					+ "where rno between ((? * 10) - 9) and (? * 10)";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, pageNum);
			pstmt.setInt(2, pageNum);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setRno(rs.getLong("rno"));
				mvo.setMemberId(rs.getInt("memberId"));
				mvo.setFullName(rs.getString("fullName"));
				mvo.setEmail(rs.getString("email"));
				mvo.setGender(rs.getInt("gender"));
				mvo.setIsDeleted(rs.getInt("isDeleted"));

				memberList.add(mvo);
			} // while of while(rs.next())-----------------

		} finally {
			close();
		}

		return memberList;
	}

	// 관리자_회원목록 검색결과 취득
	@Override
	public List<MemberVO> searchMember(Map<String, String> paraMap) throws SQLException {
		List<MemberVO> memberList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String colName = paraMap.get("colName");

			String searchKeyword = paraMap.get("value");

			if ("gender".equalsIgnoreCase(colName)) {
				// 유저가 성별을 검색하고자 했다면

				if ("남성".equals(searchKeyword))
					searchKeyword = "1";

				if ("여성".equals(searchKeyword))
					searchKeyword = "2";

				if ("선택 안함".equals(searchKeyword))
					searchKeyword = "3";
			}

			if ("isDeleted".equalsIgnoreCase(colName)) {
				// 유저가 탈퇴여부를 검색하고자 했다면

				if ("정상".equals(searchKeyword))
					searchKeyword = "0";

				if ("탈퇴".equals(searchKeyword))
					searchKeyword = "1";

			}

			String order = paraMap.get("order");

			String sql = "select " + "rno, memberId, fullName, email, gender, isDeleted " + "from " + "( " + "select "
					+ "row_number() over (order by " + order + ") as rno, "
					+ "memberId, familyName || lastName as fullName, email, gender, isDeleted " + "from  tbl_member "
					+ "where grade != '2' ";

			if ("gender".equalsIgnoreCase(colName) && "".equals(searchKeyword)) {
				sql += "and " + colName + " IS NULL " + ") " + "where rno between ((? * 10) - 9 ) and (? * 10)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, Integer.parseInt(paraMap.get("pageNum")));
				pstmt.setInt(2, Integer.parseInt(paraMap.get("pageNum")));

			} else {

				sql += "and " + colName + " like '%'|| ? ||'%' " + ") "
						+ "where rno between ((? * 10) - 9) and (? * 10)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, searchKeyword);
				pstmt.setInt(2, Integer.parseInt(paraMap.get("pageNum")));
				pstmt.setInt(3, Integer.parseInt(paraMap.get("pageNum")));
			}

			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberVO mvo = new MemberVO();
				mvo.setRno(rs.getLong("rno"));
				mvo.setMemberId(rs.getInt("memberId"));
				mvo.setFullName(rs.getString("fullName"));
				mvo.setEmail(rs.getString("email"));
				mvo.setGender(rs.getInt("gender"));
				mvo.setIsDeleted(rs.getInt("isDeleted"));

				memberList.add(mvo);
			} // while of while(rs.next())-----------------

		} finally {
			close();
		}

		return memberList;
	}

	// 관리자_회원목록 회원 상세정보 취득
	@Override
	public MemberVO getMemberOne(String memberId) throws SQLException {
		MemberVO mvo = new MemberVO();

		try {
			conn = ds.getConnection();

			String sql = "select " + "memberId, email, " + "familyName || lastName as fullName, "
					+ "to_char(birth, 'yyyy/mm/dd') as birth, "
					+ "to_char(registerDay, 'yyyy/mm/dd') as registerDay, gender " + "from tbl_member "
					+ "where memberId = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, memberId);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				mvo.setMemberId(rs.getInt("memberId"));
				mvo.setEmail(rs.getString("email"));
				mvo.setFullName(rs.getString("fullName"));
				mvo.setBirth(rs.getString("birth"));
				mvo.setRegisterDay(rs.getString("registerDay"));
				mvo.setGender(rs.getInt("gender"));
			}

		} finally {
			close();
		}

		return mvo;

	}

	// end of 예진 추가_ 관리자 회원목록 정보
	// ------------------------------------------------------------------------------------

	/*
	 * 민경 추가
	 * -----------------------------------------------------------------------------
	 * ------------------------
	 */
	// 회원가입을 해주는 메소드 (tbl_member 테이블에 insert)_ 민경
	@Override
	public int registerMember(MemberVO member) throws SQLException {

		int result = 0;

		try {
			conn = ds.getConnection();

			String sql = " insert into tbl_member(memberid, email, pwd, gender, familyName, lastName, birth, grade, isdeleted, registerday) "
					+ " values(seq_member.nextval, ?, ?, ?, ?, ?, ?, 1, 0 , sysdate) ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, Sha256.encrypt(member.getPwd())); // 암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			pstmt.setInt(3, member.getGender());
			pstmt.setString(4, member.getFamilyName());
			pstmt.setString(5, member.getLastName());
			pstmt.setString(6, member.getBirth());

			result = pstmt.executeUpdate();

		} finally {
			close();
		}

		return result;
	}

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리) _ 민경
	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {

		MemberVO member = null;

		try {
			conn = ds.getConnection();

			String sql = " SELECT memberid, email, gender, familyname, lastname, birth, grade, isdeleted, registerday "
					+ " FROM tbl_member " + " where isDeleted = 0 and email = ? and pwd = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("email"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")));
			/* pstmt.setString(2, paraMap.get("pwd")); */

			rs = pstmt.executeQuery();

			if (rs.next()) {
				// System.out.println("!!!!!!!!비밀번호 암호화"+Sha256.encrypt(paraMap.get("pwd")));
				// System.out.println("!!!!!!!!이메일 암호화"+aes.encrypt(paraMap.get("email")));
				member = new MemberVO();

				member.setMemberId(rs.getInt(1));
				/* member.setEmail( aes.decrypt(rs.getString(2)) ); // 복호화 */
				member.setEmail(rs.getString(2)); // 복호화
				member.setGender(rs.getInt(3));
				member.setFamilyName(rs.getString(4));
				member.setLastName(rs.getString(5));
				member.setBirth(rs.getString(6));
				member.setGrade(rs.getInt(7));
				member.setIsDeleted(rs.getInt(8));
				member.setRegisterDay(rs.getString(9));

			} // end of if(rs.next())-------------------

			/*
			 * } catch(GeneralSecurityException | UnsupportedEncodingException e) {
			 * e.printStackTrace();
			 */

		} finally {
			close();
		}

		return member;
	}// end of public MemberVO selectOneMember(Map<String, String> paraMap) throws
		// SQLException------

	// 비밀번호 찾기(이메일을 입력받아서 해당 사용자가 존재하지는 유무를 알려준다) _ 민경
	@Override
	public boolean isUserExist(Map<String, String> paraMap) throws SQLException {

		boolean isUserExist = false;

		try {
			conn = ds.getConnection();

			String sql = " select email " + " from tbl_member " + " where isDeleted = 0 and email = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("email"));

			rs = pstmt.executeQuery();

			isUserExist = rs.next();

		} finally {
			close();
		}

		return isUserExist;

	}// end of public boolean isUserExist(Map<String, String> paraMap) throws
		// SQLException----------

	// email 중복검사 (tbl_member 테이블에서 email 이 존재하면 true 를 리턴해주고, email 이 존재하지 않으면
	// false 를 리턴한다) _ 민경
	@Override
	public boolean emailDuplicateCheck(String email) throws SQLException {

		boolean isExists = false;

		try {
			conn = ds.getConnection();

			String sql = " select email " + " from tbl_member " + " where email = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);

			rs = pstmt.executeQuery();

			isExists = rs.next(); // 행이 있으면(중복된 email) true,
									// 행이 없으면(사용가능한 email) false

		} finally {
			close();
		}

		return isExists;
	}// end of public boolean emailDuplicateCheck(String email) throws
		// SQLException------
	/*
	 * 민경 추가
	 * -----------------------------------------------------------------------------
	 * ------------------------
	 */

}
