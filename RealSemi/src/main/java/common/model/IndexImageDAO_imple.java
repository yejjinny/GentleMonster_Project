package common.model;

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

import product.domain.ProductVO;

public class IndexImageDAO_imple implements IndexImageDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public IndexImageDAO_imple() {

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
	public List<ProductVO> getIndexImageList() throws SQLException {

		List<ProductVO> indexImageList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select "
					+ "productDetailId, mainImageFile "
					+ "from tbl_productDetail "
					+ "where isIndex = 1 and isDeleted = 0";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setProductDetailId(rs.getInt("productDetailId"));
				pvo.setMainImageFile(rs.getString("mainImageFile"));
				
				indexImageList.add(pvo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return indexImageList;
	}

}
