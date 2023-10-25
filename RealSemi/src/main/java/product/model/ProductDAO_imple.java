package product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import product.domain.ProductVO;
import product.model.ProductDAO;

public class ProductDAO_imple implements ProductDAO {

	
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ProductDAO_imple() {
		
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
	
	// 상품전체보기 메소드
	@Override
	public List<ProductVO> getProductList(Map<String, Integer> paraMap) throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		 
		try {
			conn = ds.getConnection();
			
				String sql = " select "
						+ " productDetailId, "
						+ " productGroupName||' '||frameColorEng as productName, pd.isbluelight,fk_productgroupid, "
						+ " price, "
						+ " mainImageFile, "
						+ " nvl2(wishid, 1, 0) as isWish "
						+ " from "
						+ " tbl_productGroup pg "
						+ " join tbl_productDetail pd on pg.productGroupId = pd.fk_productGroupId "
						+ " join tbl_frameColor fc on fc.frameColorId = pd.fk_frameColorId "
						+ " left join (select * from tbl_wishList where fk_memberId = ? ) w on pd.productDetailId = w.fk_productDetailId "
						+ " where pg.FK_CATEGORYID = ? "
						+ " order by pg.registerday ";
			
			pstmt = conn.prepareStatement(sql);
			
			
			
			if (paraMap.get("memberId") == null ) {
				pstmt.setString(1, "");
			}
			else {
				pstmt.setInt(1, paraMap.get("memberId"));
			}
			
			pstmt.setInt(2, paraMap.get("categoryId"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO provo = new ProductVO();
				provo.setProductDetailId(rs.getInt(1));
				provo.setProductName(rs.getString(2));
				provo.setIsBlueLight(rs.getInt(3));
				provo.setFk_productGroupId(rs.getInt(4));
				provo.setPrice(rs.getLong(5));
				provo.setMainImageFile(rs.getString(6));
				provo.setIsWish(rs.getInt(7));
				
				// System.out.println("test => " + provo.getIsWish());
				
				
				productList.add(provo);
			}// end of while(rs.next())-----------------
			
			
		} finally {
			close();
		}
		
		return productList;
	}//end of 	public List<ProductVO> getProductList() throws SQLException {}--------

	
	
	// 선글라스 개수 메소드
	@Override
	public List<ProductVO> getsunglassesCount(Map<String, Integer> paraMap) throws SQLException {
		
		  List<ProductVO> sunglassesCount = new ArrayList<>(); // List로 초기화
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql =  " SELECT pg.productGroupId, COUNT(*) "
	         			+ " FROM tbl_productGroup pg "
	         			+ " JOIN tbl_productDetail pd ON pg.productGroupId = pd.fk_productgroupId "
	         			+ " WHERE pg.productGroupId = ? "
	         			+ " GROUP BY pg.productGroupId ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, paraMap.get("categoryId"));
	         
	         rs = pstmt.executeQuery();
	         

				while(rs.next()) {
					
					ProductVO provo = new ProductVO();
					provo.setFk_productGroupId(rs.getInt(1));
					provo.setCount(rs.getInt(2));
					
					
					sunglassesCount.add(provo);
				}// end of while(rs.next())-----------------
				
	         
	         
	      } finally {
	         close();
	      }
	      
	      return sunglassesCount;
		
		
		
		
	}

	// 선글라스 전체 개수 알아오기
	@Override
	public int allViewList(String fk_productGroupId)   throws SQLException {
		
		int sunglassesnumber = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = "select count(*) "
	         		    + " from tbl_productDetail "
	         		    + " where FK_PRODUCTGROUPID = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, fk_productGroupId);
	         
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         
	         sunglassesnumber = rs.getInt(1);
					
	         
	         
	         
	      } finally {
	         close();
	      }
	      
	      return sunglassesnumber;
	}


}
