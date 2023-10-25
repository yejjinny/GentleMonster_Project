package member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.domain.MemberVO;
import util.security.Sha256;

public class MemberDAO_imple implements MemberDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;


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

	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException {
		return null;
	}

	//회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	@Override
	public boolean selectPwdCheck(Map<String, String> paraMap) throws SQLException {
		
		boolean isExists =false;
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " select pwd "
					+ " from tbl_member "
					+ " where memberId= ?  and pwd= ? " ;
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("memberId") );
			pstmt.setString(2, Sha256.encrypt( paraMap.get("pwd")) );
			//pstmt.setString(1, aes.encrypt( email )); //평문인 email을 받아서 암호화 시킨다. 그후 비교하기 위해
			
			rs=pstmt.executeQuery();
			
			isExists = rs.next(); //행이 있으면(중복된 userid)  true 
						//행이 없으면(사용가능한 userid)  false
			
			
			
		}
		finally {
			
			close();
		}
		
		return isExists;
		
		
		

	} //end of  boolean selectPwdCheck(Map<String, Integer> paraMap)------------

	
	//회원정보 수정하기전 로그인한 유저 비번과 입력한 비번 검사결과 리턴시켜주는 메소드
	@Override
	public boolean selectPwdCheck(String memberId, String pwd) throws SQLException {

		boolean isExists = false;
		
		try {
			
			conn = ds.getConnection();
			
			String sql= " select pwd  "
					  + " from tbl_member  "
					  + " where memberId=? and pwd=? " ;
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId); 
			pstmt.setString(2, pwd);
			//pstmt.setString(2, Sha256.encrypt(pwd));
			//pstmt.setString(1, aes.encrypt( email )); //평문인 email을 받아서 암호화 시킨다. 그후 비교하기 위해
			
			rs=pstmt.executeQuery();
			
			isExists = rs.next(); //행이 있으면(중복된 userid)  true 
						//행이 없으면(사용가능한 userid)  false
			//System.out.println("확인 isExists : "+isExists );
			
			
		}
		finally {
			
			close();
		}
		
		return isExists;
		
	} //end of boolean selectPwdCheck(String memberId, String pwd) ------------

	
	//회원정보 수정
	@Override
	public int updateEditMember(MemberVO member) throws SQLException {
		

		int result=0;
		
		
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " update tbl_member set email=? , gender=? "
					+ " where memberId=? ";
					  
			 
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, member.getEmail() );
			pstmt.setInt(2, member.getGender()); 
			pstmt.setInt(3, member.getMemberId()); 
			//pstmt.setString(2, Sha256.encrypt( member.getPwd()  ) ); //암호를 SHA256 알고리즘으로 단방향 암호화 시킨다.
			
			/*
			 * 
			 * pstmt.setString(3, aes.encrypt(member.getEmail() ) ); //이메일을 AES256알고리즘으로 양방향
			 * 시킨다. pstmt.setString(4, aes.encrypt(member.getMobile() ) ); //휴대번호을
			 * AES256알고리즘으로 양방향 시킨다. pstmt.setString(5, member.getPostcode() );
			 * pstmt.setString(6, member.getAddress() ); pstmt.setString(7,
			 * member.getDetailaddress()); pstmt.setString(8, member.getExtraaddress() );
			 * pstmt.setString(9, member.getUserid() );
			 * 
			 */
			result = pstmt.executeUpdate();
			
		}
		
		/*
		 * catch(GeneralSecurityException | UnsupportedEncodingException e ) {
		 * 
		 * e.printStackTrace(); }
		 */
		finally {
			
			
			close();
		}
		
		
		
		
		return result;
		
		
		
	}// end of int updateEditMember(MemberVO member) ----

	
}
