package store.model;

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

import store.domain.StoreImgVO;
import store.domain.StoreVO;
import wish.domain.WishVO;

public class StoreDAO_imple implements StoreDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
		public StoreDAO_imple() {
			
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


		// 스토어(스토어) 개수 알아오기
		@Override
		public int totalStoreCount(String countryid) throws SQLException {
			
			int totalStoreCount = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select count(*) "
						   + " from tbl_store "
						   + " where fk_countryid = ? and fk_storecategoryid = 1 ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, countryid);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				totalStoreCount = rs.getInt(1);
				
			} finally {
				close();
			}
			
			return totalStoreCount;
			
		}// end of public int totalStoreCount(int countryid) throws SQLException ----------


		// 스토어(백화점/면세점) 개수 알아오기
		@Override
		public int totalDepStoreCount(String countryid) throws SQLException {
			
			int totalStoreCount = 0;
			
			try {
				conn = ds.getConnection();
				
				String sql = " select count(*) "
						   + " from tbl_store "
						   + " where fk_countryid = ? and fk_storecategoryid = 2 ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, countryid);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				totalStoreCount = rs.getInt(1);
				
			} finally {
				close();
			}
			
			return totalStoreCount;
			
		}// end of public int totalDepStoreCount(String countryid) throws SQLException --------


		// 스토어리스트(스토어) 가져오기
		@Override
		public List<StoreVO> getStoreList(String countryid) throws SQLException {
			
			List<StoreVO> storeList = new ArrayList<>();

			try {
				conn = ds.getConnection();
				
				String sql = " select storeid, storename, fk_countryid, fk_storecategoryid, cityeng, citykor, address, tel, openinghours, description, mainimagefile "
						   + " from tbl_store "
						   + " where fk_countryid = ? and fk_storecategoryid = 1 and ISDELETED = 0 "
						   + " order by STOREID ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, countryid);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					StoreVO svo = new StoreVO();
					
					svo.setStoreId(rs.getInt("storeid"));
					svo.setStoreName(rs.getString("storename"));
					svo.setFk_countryId(rs.getInt("fk_countryid"));
					svo.setFk_storeCategoryId(rs.getInt("fk_storecategoryid"));
					svo.setCityEng(rs.getString("cityeng"));
					svo.setCityKor(rs.getString("citykor"));
					svo.setAddress(rs.getString("address"));
					svo.setTel(rs.getString("tel"));
					svo.setOpeningHours(rs.getString("openinghours"));
					svo.setDescription(rs.getString("description"));
					svo.setMainImageFile(rs.getString("mainimagefile"));
					
					storeList.add(svo);
				} // end of while(rs.next())

			} finally {
				close();
			}

			return storeList;
		}// end of public List<StoreVO> getStoreList() throws SQLException ---------


		// 스토어리스트(백화점/면세점) 가져오기
		@Override
		public List<StoreVO> getDepStoreList(String countryid) throws SQLException {

			List<StoreVO> storeList = new ArrayList<>();

			try {
				conn = ds.getConnection();

				String sql = " select storeid, storename, fk_countryid, fk_storecategoryid, cityeng, citykor, address, tel, openinghours, description, mainimagefile "
						   + " from tbl_store "
						   + " where fk_countryid = ? and fk_storecategoryid = 2 and ISDELETED = 0 "
						   + " order by STOREID ";
				
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, countryid);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					StoreVO svo = new StoreVO();
					
					svo.setStoreId(rs.getInt("storeid"));
					svo.setStoreName(rs.getString("storename"));
					svo.setFk_countryId(rs.getInt("fk_countryid"));
					svo.setFk_storeCategoryId(rs.getInt("fk_storecategoryid"));
					svo.setCityEng(rs.getString("cityeng"));
					svo.setCityKor(rs.getString("citykor"));
					svo.setAddress(rs.getString("address"));
					svo.setTel(rs.getString("tel"));
					svo.setOpeningHours(rs.getString("openinghours"));
					svo.setDescription(rs.getString("description"));
					svo.setMainImageFile(rs.getString("mainimagefile"));
					
					storeList.add(svo);
				} // end of while(rs.next())

			} finally {
				close();
			}

			return storeList;
		}// end of public List<StoreVO> getDepStoreList(String countryid) throws SQLException ---------


		// 스토어리스트(스토어) 상세 이미지 가져오기
		@Override
		public List<StoreImgVO> getStoreImgList(String countryid) throws SQLException {
			
			List<StoreImgVO> storeImgList = new ArrayList<>();

			try {
				conn = ds.getConnection();
				
				String sql = " select STOREDETAILIMAGEID, FK_STOREID, IMAGEFILE, TYPE "
						   + " from TBL_STOREDETIALIMAGE "
						// + " where FK_STOREID = ? "
					//	+ " where FK_STOREID = 1 "
						   + " order by STOREDETAILIMAGEID ";
						  
				
				pstmt = conn.prepareStatement(sql);
				
			//	pstmt.setString(1, storeid);

				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					StoreImgVO simgvo = new StoreImgVO();
					
					simgvo.setStoreDetailImageId(rs.getInt("STOREDETAILIMAGEID"));
					simgvo.setFk_storeId(rs.getInt("FK_STOREID"));
					simgvo.setimageFile(rs.getString("imagefile"));
					simgvo.setType(rs.getString("type"));
					
					storeImgList.add(simgvo);
				} // end of while(rs.next())

			} finally {
				close();
			}

			return storeImgList;
		}// end of public List<StoreImgVO> getStoreImgList(String countryid) throws SQLException-------
	
}
