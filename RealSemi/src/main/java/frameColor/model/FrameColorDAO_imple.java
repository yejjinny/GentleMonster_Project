package frameColor.model;

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

import frame.domain.FrameVO;
import frameColor.domain.FrameColorVO;

/**
 * 작성자 신예진
 */
public class FrameColorDAO_imple implements FrameColorDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public FrameColorDAO_imple() {

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
	
	// 프레임컬러 정보 취득
	@Override
	public List<FrameColorVO> getFrameColorList() throws SQLException {
		List<FrameColorVO> frameColorList = new ArrayList<>();
		try {
			conn = ds.getConnection();

			String sql = "select frameColorId, frameColorKor from tbl_frameColor order by frameColorId";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				FrameColorVO fcvo = new FrameColorVO();
				fcvo.setFrameColorId(rs.getInt("frameColorId"));
				fcvo.setFrameColorKor(rs.getString("frameColorKor"));
				frameColorList.add(fcvo);
			} // end of while(rs.next())

		} finally {
			close();
		}
		return frameColorList;
	}

}
