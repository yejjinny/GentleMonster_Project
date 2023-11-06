package cart.model;

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

import cart.domain.CartVO;

/**
 * 작성자 신예진
 */
public class CartDAO_imple implements CartDAO {
	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public CartDAO_imple() {

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

	// 쇼핑백 버튼 및 쇼핑백 자세히 보기 버튼을 눌렀을 경우
	@Override
	public List<CartVO> getCartList(int memberId) throws SQLException {
		List<CartVO> cartList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select cartId, fk_productDetailId, productGroupName||' '||frameColorEng as productName,  price, quantity, mainImageFile, stock "
					+ "from " + "tbl_cart c " + "join tbl_member m on " + "c.fk_memberId = m.memberId "
					+ "join tbl_productDetail pd on " + "c.fk_productDetailId = pd.productDetailId "
					+ "join tbl_productGroup pg on " + "pg.productGroupId = pd.fk_productGroupId "
					+ "join tbl_framecolor f on " + "pd.fk_framecolorid = f.framecolorid " + "where c.fk_memberId = ? "
					+ "order by c.registerday";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, memberId);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				CartVO cvo = new CartVO();
				cvo.setCartId(rs.getInt("cartId"));
				cvo.setProductDetailId(rs.getInt("fk_productDetailId"));
				cvo.setProductName(rs.getString("productName"));
				cvo.setPrice(rs.getLong("price"));
				cvo.setQuantity(rs.getInt("quantity"));
				cvo.setStock(rs.getInt("stock"));
				cvo.setMainImageFile(rs.getString("mainImageFile"));

				cartList.add(cvo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return cartList;
	}

	// 삭제하기 버튼을 눌렀을 경우
	@Override
	public int deleteCartItem(Map<String, String> paraMap) throws SQLException {
		int num = 0;
		try {
			conn = ds.getConnection();

			String sql = "delete from tbl_cart where cartId = ?";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("cartId"));

			num = pstmt.executeUpdate();

		} finally {
			close();
		}

		return num;
	}
	
	// 수량 +- 버튼을 눌렀을 경우
	@Override
	public CartVO updateCartQty(Map<String, String> paraMap) throws SQLException {
		int num = 0;
		CartVO cvo = new CartVO();
		try {
			conn = ds.getConnection();
			String sql = "update tbl_cart set ";

			if ("add".equals(paraMap.get("action"))) {
				// 수량 플러스
				sql += "quantity = quantity + 1 ";
			} else {
				// 수량 마이너스
				sql += "quantity = quantity - 1 ";
			}

			sql += "where cartId = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("cartId"));

			num = pstmt.executeUpdate();

			if (num == 1) {
				// 무사히 업데이트가 되었을 경우
				pstmt.clearParameters();

				sql = "select cartId, quantity, price "
						+ "from tbl_cart c "
						+ "join tbl_productdetail pd on c.fk_productdetailid = pd.productdetailid "
						+ "join tbl_productGroup pg on pd.fk_productgroupid = pg.productgroupid "
						+ "where cartId = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("cartId"));
				rs = pstmt.executeQuery();

				if (rs.next()) {
					cvo.setCartId(rs.getInt("cartId"));
					cvo.setQuantity(rs.getInt("quantity"));
					cvo.setPrice(rs.getLong("price"));
				}
			}

		} finally {
			close();
		}

		return cvo;
	}
	
	// 쇼핑백에 추가하기 버튼을 눌렀을 경우
	@Override
	public int addCartItem(Map<String, String> paraMap) throws SQLException {
		int num = 0;
		try {
			conn = ds.getConnection();

			// 이미 같은 상품이 쇼핑백에 등록되어있는지 확인용
			String sql = "select cartId from tbl_cart where fk_memberId = ? and fk_productDetailId = ?";

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("memberId"));
			pstmt.setString(2, paraMap.get("productDetailId"));
			
			rs = pstmt.executeQuery();

			// pstmt 재사용 위해 파라미터 제거
			pstmt.clearParameters();

			if (rs.next()) {
				// 이미 쇼핑백에 같은 상품이 있으니 수량 업데이트 필요

				sql = "update tbl_cart set quantity = quantity + 1 where cartId = ?";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rs.getString("cartId"));

				num = pstmt.executeUpdate();

			} else {
				// 쇼핑백에 존재하지 않는 경우 추가함

				sql = "insert into tbl_cart values(seq_cart.nextval, ?, ?, 1, default)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, paraMap.get("memberId"));
				pstmt.setString(2, paraMap.get("productDetailId"));

				num = pstmt.executeUpdate();
			}

		} finally {
			close();
		}

		return num;
	}

}
