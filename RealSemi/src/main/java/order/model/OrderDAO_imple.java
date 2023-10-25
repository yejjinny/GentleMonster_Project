package order.model;

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
import member.domain.AddressBookVO;
import order.domain.OrderVO;

public class OrderDAO_imple implements OrderDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public OrderDAO_imple() {

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

	// 결제하기 버튼 클릭시 배송지 선택을 위해 유저가 등록해뒀던 주소정보를 return
	@Override
	public List<OrderVO> getAddressBookList(Map<String, Integer> paraMap) throws SQLException {
		List<OrderVO> addressBookList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select " + "addressbookId, a.familyName, a.lastName, address, isDefaultAddr "
					+ "from tbl_addressbook a " + "join tbl_member m on " + "a.fk_memberId = m.memberId "
					+ "where fk_memberId = ? and a.isDeleted = 0 " + "order by a.registerday";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paraMap.get("memberId"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO ovo = new OrderVO();
				ovo.setAddressBookId(rs.getInt("addressbookId"));
				ovo.setFamilyName(rs.getString("familyName"));
				ovo.setLastName(rs.getString("lastName"));
				ovo.setAddress(rs.getString("address"));
				ovo.setIsDefaultAddr(rs.getInt("isDefaultAddr"));
				addressBookList.add(ovo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return addressBookList;
	}

	@Override
	public OrderVO getAddressOne(Map<String, Integer> paraMap) throws SQLException {
		OrderVO ovo = new OrderVO();

		try {
			conn = ds.getConnection();

			String sql = "select "
					+ "addressbookId, fk_memberId, a.familyName, a.lastName, tel, address, detailAddress, "
					+ "postCode, isDefaultAddr " + "from tbl_addressbook a " + "join tbl_member m on "
					+ "a.fk_memberId = m.memberId " + "where fk_memberId = ? and a.isDeleted = 0 and addressbookId = ? "
					+ "order by a.registerday";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paraMap.get("memberId"));
			pstmt.setInt(2, paraMap.get("addressBookId"));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ovo.setAddressBookId(rs.getInt("addressbookId"));
				ovo.setFk_memberId(rs.getInt("fk_memberId"));
				ovo.setFamilyName(rs.getString("familyName"));
				ovo.setLastName(rs.getString("lastName"));
				ovo.setTel(rs.getString("tel"));
				ovo.setAddress(rs.getString("address"));
				ovo.setDetailAddress(rs.getString("detailAddress"));
				ovo.setPostCode(rs.getString("postCode"));
				ovo.setIsDefaultAddr(rs.getInt("isDefaultAddr"));
			}

		} finally {
			close();
		}

		return ovo;
	}

	@Override
	public String insertOrderData(Map<String, Object> paraMap) throws SQLException {
		String orderId = "";
		int num = 0;

		try {
			conn = ds.getConnection();

			// 주문번호는 프로시저, 잡, 시퀀스를 사용해서 날마다 초기화되고 날짜별로 더해지는 값이된다 ex)23102100001 이런식
			String sql = "insert into tbl_order values (ZBF_GET_BATCHKEY('now'), ?, 0, ?, 1, null, ?, ?, ?, ?, ?, default)";

			pstmt = conn.prepareStatement(sql);

			AddressBookVO avo = (AddressBookVO) paraMap.get("addressOne");
			List<CartVO> cartList = (List<CartVO>) paraMap.get("cartList");

			pstmt.setInt(1, avo.getFk_memberId());
			pstmt.setInt(2, (int) paraMap.get("amount"));
			pstmt.setString(3, avo.getFamilyName() + avo.getLastName());
			pstmt.setString(4, avo.getPostCode());
			pstmt.setString(5, avo.getAddress());
			pstmt.setString(6, avo.getDetailAddress());
			pstmt.setString(7, avo.getTel());

			num = pstmt.executeUpdate();

			if (num == 1) {
				// insert가 잘 되었다면
				pstmt.clearParameters();

				// 현재 insert한 주문번호 알아오기 시작
				sql = "select orderId from (select orderId from tbl_order where fk_memberId = ? order by orderId desc) where rownum = 1";

				// ZBF_GET_NOWBATCHKEY('now')
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, avo.getFk_memberId());
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					// 주문번호
					orderId = rs.getString(1);
				}
				

				if (!orderId.isEmpty()) {
					pstmt.clearParameters();

					for (CartVO cvo : cartList) {
						sql = "insert into tbl_orderDetail values (seq_orderdetail.nextval, ?, ?, ?, ?)";
						// 시퀀스 수정하기
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, orderId);
						pstmt.setInt(2, cvo.getProductDetailId());
						pstmt.setLong(3, cvo.getPrice());
						pstmt.setInt(4, cvo.getQuantity());

						num = pstmt.executeUpdate();
					}

					if (num == 1) {
						// order, orderDetail 테이블에 insert가 잘 되었다면 카트에 있던 값을 삭제해야한다
						sql = "delete from tbl_cart where cartId in (";

						for (int i = 0; i < cartList.size(); i++) {
							pstmt.clearParameters();
							sql += "?";
							if (i < cartList.size() - 1) {
								// cartList의 마지막 요소가 아니라면
								sql += ", ";
							}else {
								//마지막 요소라면
								sql += ")";
							}
							pstmt = conn.prepareStatement(sql);
							pstmt.setInt(1, cartList.get(i).getCartId());
							num = pstmt.executeUpdate();
						}
					}
				}
			}

		} finally {
			close();
		}

		return orderId;
	}

	@Override
	public OrderVO getOrderCompleteList(Map<String, String> paraMap) throws SQLException {
		OrderVO ovo = new OrderVO();

		try {
			conn = ds.getConnection();

			String sql = "select " + "orderId, name, tel, address, detailAddress, "
					+ "postCode, productGroupName ||' '|| frameColorEng as productName, "
					+ "od.price, od.quantity, amount, mainImageFile " + "from tbl_order o "
					+ "join tbl_orderDetail od on o.orderId = od.fk_orderId "
					+ "join tbl_productDetail pd on pd.productDetailId = od.fk_productDetailId "
					+ "join tbl_frameColor fc on pd.fk_frameColorId = fc.frameColorId "
					+ "join tbl_productGroup pg on pd.fk_productGroupId = pg.productGroupId " + "where orderId = ?";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("orderId"));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				ovo.setOrderId(rs.getString("orderId"));
				ovo.setFullName(rs.getString("name"));
				ovo.setTel(rs.getString("tel"));
				ovo.setAddress(rs.getString("address"));
				ovo.setDetailAddress(rs.getString("detailAddress"));
				ovo.setPostCode(rs.getString("postCode"));
				ovo.setProductName(rs.getString("productName"));
				ovo.setPrice(rs.getLong("price"));
				ovo.setAmount(rs.getLong("amount"));
				ovo.setQuantity(rs.getInt("quantity"));
				ovo.setMainImageFile(rs.getString("mainImageFile"));
			}

		} finally {
			close();
		}

		return ovo;
	}

}
