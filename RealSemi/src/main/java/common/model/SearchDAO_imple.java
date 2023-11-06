package common.model;

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

import product.domain.ProductVO;

/**
 * 작성자 신예진
 */
public class SearchDAO_imple implements SearchDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public SearchDAO_imple() {

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
	
	// 유저의 검색어를 토대로 한 검색 결과 취득
	@Override
	public List<ProductVO> searchKeyword(Map<String, String> paraMap) throws SQLException {
		List<ProductVO> productList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select "
					+ "productDetailId, "
					+ "productGroupName||' '||frameColorEng as productName, price, mainImageFile, pd.isBlueLight, "
					+ "nvl2(wishId, 1, 0) as isWish "
					+ "from "
					+ "tbl_productGroup pg "
					+ "join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
					+ "join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
					+ "left join (select * from tbl_wishList where fk_memberId = ?  and isDeleted = 0) w on pd.productDetailId = w.fk_productDetailId "
					+ "where (productGroupName like '%'|| ? ||'%'  or frameColorEng like '%'|| ? ||'%') and pd.isDeleted = 0 and  pg.isDeleted = 0 "
					+ "order by pg.registerday ";
			
			pstmt = conn.prepareStatement(sql);
			
			if(!paraMap.get("memberId").isEmpty()) {
				pstmt.setString(1, paraMap.get("memberId"));
			}else {
				pstmt.setString(1, "");
			}
			
			pstmt.setString(2, paraMap.get("search"));
			pstmt.setString(3, paraMap.get("search"));
			

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setProductDetailId(rs.getInt("productDetailId"));
				pvo.setProductName(rs.getString("productName"));
				pvo.setIsBlueLight(rs.getInt("isBlueLight"));
				pvo.setPrice(rs.getLong("price"));
				pvo.setMainImageFile(rs.getString("mainImageFile"));
				pvo.setIsWish(rs.getInt("isWish"));

				productList.add(pvo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return productList;
	}

}
