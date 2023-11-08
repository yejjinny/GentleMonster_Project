package wish.model;

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

import wish.domain.WishVO;

/*
작성자 김민경
*/
public class WishDAO_imple implements WishDAO {

	private DataSource ds;   
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public WishDAO_imple() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi_oracle");
		    
		} catch(NamingException e) {
			e.printStackTrace();
		}
		
	}
		
		
	// 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}


	// 위시리스트의 상품 전체개수 알아오기 
	@Override
	public int totalWishCount(int fk_memberid) throws SQLException {
		
		int totalWishCount = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select count(*) "
					   + " from tbl_wishlist "
					   + " where fk_memberid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, fk_memberid);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalWishCount = rs.getInt(1);		
			
		} finally {
			close();
		}
		
		return totalWishCount;
		
	}// end of public int totalWishCount() throws SQLException -----------------


	// 위시리스트 가져오기
	@Override
	public List<WishVO> getWishList(Map<String, Integer> paraMap) throws SQLException {
		
		List<WishVO> wishList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = " select wishId, fk_productDetailId, productGroupName||' '||frameColorEng as productName, price, mainImageFile, stock "
					   + " from tbl_wishlist w "
					   + " join tbl_member m on w.fk_memberId = m.memberId "
					   + " join tbl_productDetail pd on w.fk_productDetailId = pd.productDetailId "
					   + " join tbl_productGroup pg on pg.productGroupId = pd.fk_productGroupId "
					   + " join tbl_framecolor f on pd.fk_framecolorid = f.framecolorid "
					   + " where w.fk_memberId = ? "
					   + " order by w.registerday ";
			
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, paraMap.get("memberId"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				WishVO wvo = new WishVO();
				wvo.setWishId(rs.getInt("wishid"));
				wvo.setProductDetailId(rs.getInt("fk_productDetailId"));
				wvo.setProductName(rs.getString("productName"));
				wvo.setPrice(rs.getLong("price"));
				wvo.setMainImageFile(rs.getString("mainImageFile"));
				wvo.setStock(rs.getInt("stock"));
				
				wishList.add(wvo);
			} // end of while(rs.next())

		} finally {
			close();
		}

		return wishList;
	}// end of public List<WishVO> getWishList(Map<String, Integer> paraMap) throws SQLException -------


	// 삭제하기 버튼을 눌렀을 경우
	@Override
	public int deleteWishItem(Map<String, String> paraMap) throws SQLException {
		
		int num = 0;
		try {
			if(paraMap.get("productDetailId") == null) {
				conn = ds.getConnection();
	
				String sql = " delete from tbl_wishlist "
						   + " where wishId = ? ";
				
				pstmt = conn.prepareStatement(sql);
	
				pstmt.setString(1, paraMap.get("wishId"));
				
	
				num = pstmt.executeUpdate();
			}
			else {
				conn = ds.getConnection();

				String sql = " delete from tbl_wishlist "
						   + " where fk_memberId = ? and fk_productDetailId = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("memberId"));
				pstmt.setString(2, paraMap.get("productDetailId"));

				num = pstmt.executeUpdate();	
			}

		} finally {
			close();
		}

		return num;
	}// end of public int deleteWishItem(Map<String, String> paraMap) throws SQLException --------


	// 위시리스트에 담기 버튼을 눌렀을 경우
	@Override
	public int addWishItem(Map<String, String> paraMap) throws SQLException {
		
		int num = 0;
		
		try {
			
			conn = ds.getConnection();

			// 이미 같은 상품이 위시리스트에 등록되어있는지 확인용
			String sql = " select wishId "
					   + " from tbl_wishlist "
					   + " where fk_memberId = ? and fk_productDetailId = ? ";

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, paraMap.get("memberId"));
			pstmt.setString(2, paraMap.get("productDetailId"));
			
			rs = pstmt.executeQuery();

			// pstmt 재사용 위해 파라미터 제거
			pstmt.clearParameters();

			if (!rs.next()) {
				// 위시리스트에 존재하지 않는 경우 위시리스트에 추가함

				sql = "insert into tbl_wishlist values(seq_wishlist.nextval, ?, ?, 0, default)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, paraMap.get("memberId"));
				pstmt.setString(2, paraMap.get("productDetailId"));

				num = pstmt.executeUpdate();
			}

		} finally {
			close();
		}

		return num;
	}// end of public int addWishItem(Map<String, String> paraMap) throws SQLException ----------------
	
}
