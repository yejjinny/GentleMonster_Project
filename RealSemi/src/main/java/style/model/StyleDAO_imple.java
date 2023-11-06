package style.model;

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
import style.domain.StyleVO;

/**
 * 작성자 신예진 
 */
public class StyleDAO_imple implements StyleDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public StyleDAO_imple() {

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
	
	// 스타일 정보 취득
	@Override
	public List<StyleVO> getStyleList() throws SQLException {
		List<StyleVO> styleList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select "
					+ "styleId, fk_productDetailId, instaId, imageFile, "
					+ "productGroupName || ' ' || frameColorENG as productName, mainImageFile, price "
					+ "from tbl_style s "
					+ "join tbl_productDetail pd on s.fk_productDetailId = pd.productDetailId "
					+ "join tbl_productGroup pg on pd.fk_productgroupid = pg.productGroupId "
					+ "join tbl_frameColor fc on pd.fk_framecolorid = fc.framecolorid";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				StyleVO svo = new StyleVO();
				svo.setStyleId(rs.getInt("styleId"));
				svo.setProductDetailId(rs.getInt("fk_productDetailId"));
				svo.setInstaId(rs.getString("instaId"));
				svo.setImageFile(rs.getString("imageFile"));
				svo.setPrice(rs.getLong("price"));
				svo.setProductName(rs.getString("productName"));
				svo.setMainImageFile(rs.getString("mainImageFile"));

				styleList.add(svo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return styleList;
	}

}
