package member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.domain.AddressBookVO;
import order.domain.OrderVO;

public class AddressBookDAO_imple implements AddressBookDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public AddressBookDAO_imple() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi_oracle");

		} catch (NamingException e) {
			e.printStackTrace();
		}

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
	public int updateDefaultAddr(AddressBookVO avo) throws SQLException {
		int num = 0;
		try {
			conn = ds.getConnection();

			// 기존에 기본주소로 되어있는 걸 일반주소로 변경한다
			String sql = "update tbl_addressbook set isDefaultAddr = 0 where fk_memberId = ? and isDefaultAddr = 1";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, avo.getFk_memberId());

			num = pstmt.executeUpdate();

			if (num == 1) {
				// 기존 기본주소가 일반주소로 변경된 경우
				// pstmt 재사용 위해 파라미터 제거
				pstmt.clearParameters();

				if (avo.getAddressBookId() != 0) {
					// 유저가 값을 따로 변경하지 않아 addressBookId를 설정 했을 경우
					
					sql = "update tbl_addressbook set isDefaultAddr = 1 where addressBookId = ?";

					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, avo.getAddressBookId());

					num = pstmt.executeUpdate();
				} else {
					// 유저가 값을 변경해 addressBookId를 설정 못했을 경우
					
					sql = "Insert into TBL_ADDRESSBOOK values (seq_addressbook.nextval, ?, ?, ?, ?, ?, ?, ?, 1, 0, default)";

					pstmt = conn.prepareStatement(sql);

					pstmt.setInt(1, avo.getFk_memberId());
					pstmt.setString(2, avo.getFamilyName());
					pstmt.setString(3, avo.getLastName());
					pstmt.setString(4, avo.getTel());
					pstmt.setString(5, avo.getAddress());
					pstmt.setString(6, avo.getDetailAddress());
					pstmt.setString(7, avo.getPostCode());

					num = pstmt.executeUpdate();
				}

			} else {
				// 기존 기본주소가 일반주소로 변경되지 않았을 경우
				num = 0;
			}

		} finally {
			close();
		}

		return num;

	}

}
