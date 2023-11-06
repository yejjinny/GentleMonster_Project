package category.model;

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
import category.domain.CategoryVO;

/**
 * 작성자 신예진
 */
public class CategoryDAO_imple implements CategoryDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public CategoryDAO_imple() {

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
	
	// 카테고리 정보 취득
	@Override
	public List<CategoryVO> getCategoryList() throws SQLException {
		List<CategoryVO> categoryList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select categoryId, categoryName from tbl_category order by categoryId";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CategoryVO cvo = new CategoryVO();
				cvo.setCategoryId(rs.getInt("categoryId"));
				cvo.setCategoryName(rs.getString("categoryName"));
				categoryList.add(cvo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return categoryList;
	}

}
