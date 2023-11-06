package frame.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import cart.domain.CartVO;
import frame.domain.FrameVO;

/**
 * 작성자 신예진
 */
public class FrameDAO_imple implements FrameDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public FrameDAO_imple() {

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
	
	// 프레임 정보 취득
	@Override
	public List<FrameVO> getFrameList() throws SQLException {
		List<FrameVO> frameList = new ArrayList<>();
		try {
			conn = ds.getConnection();

			String sql = "select frameId, frameName from tbl_frame order by frameId";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FrameVO fvo = new FrameVO();
				fvo.setFrameId(rs.getInt("frameId"));
				fvo.setFrameName(rs.getString("frameName"));
				frameList.add(fvo);
			} // end of while(rs.next())

		} finally {
			close();
		}
		return frameList;
	}

}
