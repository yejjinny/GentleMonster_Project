package address.model;

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

import address.domain.AddressBookVO;
 

public class AddressDAO_imple implements AddressDAO {


	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;


	// 생성자
	public AddressDAO_imple() {

		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi_oracle");

			/* aes = new AES256(SecretMyKey.KEY); */
			// SecretMyKey.KEY 은 우리가 만든 암호화/복호화 키이다.

		} catch (NamingException e) {
			e.printStackTrace();
		} /*
			 * catch (UnsupportedEncodingException e) { e.printStackTrace(); }
			 */

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

	
	
	//멤버아이디를 통해 등록된 주소가 있으면 주소 목록 리스트
	@Override
	public List<AddressBookVO> selectAddressLists(Map<String, String> paraMap) throws SQLException {
		

		List<AddressBookVO> AddressList =  new ArrayList<>();
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " select addressbookid, fk_memberid ,familyname  "
					+ "        ,lastname,tel, address, detailaddress, postcode "
					+ "        ,isdefaultaddr, isdeleted, registerday "
					+ "from tbl_addressbook "
					+ "where fk_memberId=?  and isdeleted='0' " ;
			 
			 pstmt=conn.prepareStatement(sql);
			 
			 pstmt.setString(1, paraMap.get("memberId"));

			 
			rs=pstmt.executeQuery();
			
			while( rs.next() ) {
				
				
				AddressBookVO avo=new AddressBookVO();
				
				avo.setAddressBookId(rs.getInt("addressbookid"));
				avo.setFk_memberId( rs.getInt("fk_memberid"));
				 
				avo.setFamilyName(rs.getString("familyname"));
				
				avo.setLastName(rs.getString("lastname") );
				
				avo.setTel( rs.getString("tel"));
				 
				avo.setAddress( rs.getString("address"));
				 
				avo.setDetailAddress(rs.getString("detailaddress") );
				avo.setPostCode( rs.getString("postcode"));
				 
				avo.setIsDefaultAddr(  rs.getString("isdefaultaddr") );
				 
				avo.setIsDeleted( rs.getString("isdeleted"));
				
				avo.setRegisterDay(rs.getString("registerday") );
				
				 
				AddressList.add(avo);
				
				 
				
			} //end of while( rs.next() ) -----------------------------
			 
			
			
		}finally {
			
			close();
		}
		
		return AddressList;
		
		
	} //end of  List<AddressBookVO> selectAddressLists(Map<String, String> paraMap)-----

	
	//기본 배송지 업데이트
	@Override
	public int updateDefaultAddress(Map<String, String> paraMap) throws SQLException {
		 
		

		//---------------------------
		int result=0;
		boolean isExists =false;
		
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " select addressbookid "
					+ " from tbl_addressbook "
					+ " where fk_memberId=? and isdefaultaddr=? " ;
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("fk_memberid")  );  
			pstmt.setString(2, "1" );
			
			rs=pstmt.executeQuery();
			
			isExists = rs.next();  
			
			//---------------------
			if(isExists ) { //기본배송지가 존재하는 경우
				
				 
				int defaultAddr=rs.getInt("addressbookid");
				
				  sql= " update tbl_addressbook set isdefaultaddr=0  "
				  		+ " where fk_memberid=? and addressbookid=? ";
						  
				 
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("fk_memberid")  ); 
				pstmt.setInt(2, defaultAddr );
				
				pstmt.executeUpdate();
		
				 
				 
				
			}
			
			sql= " update tbl_addressbook set isdefaultaddr=1  "
			  		+ " where fk_memberid=? and addressbookid=? ";
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("fk_memberid")  ); 
			pstmt.setString(2,  paraMap.get("addressbookid") );
			
			result = pstmt.executeUpdate();
			
		}finally {
			
			
			close();
		}
		
		
		
		
		return result;
		
	} //end of int updateDefaultAddress(Map<String, String> paraMap) -----

	//배송지 수정 페이지에서 기존 값 가져오는 메소드
	@Override
	public AddressBookVO selectEditAddrView(String addressbookid) throws SQLException {
		
		

		AddressBookVO avo=null;
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " select addressbookid, fk_memberid ,familyname  "
					+ "        ,lastname,tel, address, detailaddress, postcode "
					+ "        ,isdefaultaddr, isdeleted, registerday "
					+ " from tbl_addressbook "
					+ " where addressbookid=?  " ;
			 
			 pstmt=conn.prepareStatement(sql);
			 
			 pstmt.setString(1, addressbookid);

			 
			rs=pstmt.executeQuery();
			
			if( rs.next() ) {
				
				
				avo=new AddressBookVO();
				
				avo.setAddressBookId(rs.getInt("addressbookid"));
				avo.setFk_memberId( rs.getInt("fk_memberid"));
				 
				avo.setFamilyName(rs.getString("familyname"));
				
				avo.setLastName(rs.getString("lastname") );
				
				avo.setTel( rs.getString("tel"));
				 
				avo.setAddress( rs.getString("address"));
				 
				avo.setDetailAddress(rs.getString("detailaddress") );
				avo.setPostCode( rs.getString("postcode"));
				 
				avo.setIsDefaultAddr(  rs.getString("isdefaultaddr") );
				 
				avo.setIsDeleted( rs.getString("isdeleted"));
				
				avo.setRegisterDay(rs.getString("registerday") );
				
				 
				 
				
			} //end of while( rs.next() ) -----------------------------
			 
			
			
		}finally {
			
			close();
		}
		
		return avo;
	}// end of AddressBookVO selectEditAddrView(String addressbookid) ----

	
	//기존의 주소를 수정하는 메소드
	@Override
	public int updateEditAddress(Map<String, String> paraMap) throws SQLException {
		
		

		String isdefaultaddr=paraMap.get("isdefaultaddr");
		
		//---------------------------
		int result=0;
		boolean isExists =false;
		String sql="";
		
		try {
			
			conn=ds.getConnection();
			
			
			if( isdefaultaddr.equals("1")) { //수정하려는 주소를 기본배송지로 설정하고 싶은 경우
				
				sql= " select addressbookid "
						+ " from tbl_addressbook "
						+ " where fk_memberId=? and isdefaultaddr=? " ;
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("fk_memberid")  );  
				pstmt.setString(2, "1" );
				
				rs=pstmt.executeQuery();
				
				isExists = rs.next();  
				
				//---------------------
				if(isExists ) { //기본배송지가 존재하는 경우
					
					 
					int defaultAddr=rs.getInt("addressbookid");
					
					  sql= " update tbl_addressbook set isdefaultaddr=0  "
					  		+ " where fk_memberid=? and addressbookid=? ";
							  
					 
					pstmt= conn.prepareStatement(sql);
					
					pstmt.setString(1, paraMap.get("fk_memberid")  ); 
					pstmt.setInt(2, defaultAddr );
					
					pstmt.executeUpdate();
			
					 
					 
					
				}
				
				
			} //end of if----

			
			
			
			sql= " update tbl_addressbook set familyname=? ,lastname=?, tel=? "
					+ "        ,postcode=?, address=?, detailaddress=?, isdefaultaddr=? "
					+ "where fk_memberid=? and addressbookid=?";
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("familyname")  ); 
			pstmt.setString(2,  paraMap.get("lastname") );
			pstmt.setString(3,  paraMap.get("tel") );
			pstmt.setString(4,  paraMap.get("postcode") );
			pstmt.setString(5,  paraMap.get("address") );
			pstmt.setString(6,  paraMap.get("detailaddress") );
			pstmt.setString(7,  paraMap.get("isdefaultaddr") );
			pstmt.setString(8,  paraMap.get("fk_memberid") );
			pstmt.setString(9,  paraMap.get("addressbookid") );
			
			result = pstmt.executeUpdate();
			
		}finally {
			
			
			close();
		}
		
		
		
		
		return result;
	} // end of int updateEditAddress(Map<String, String> paraMap)

	//주소 삭제 누르면 isdeleted 에 1을 넣는 메소드
	@Override
	public int updateIsDeletedAddr(String addressbookid) throws SQLException {
		
		


		 
		
		//---------------------------
		int result=0;
		 
		String sql="";
		
		try {
			
			conn=ds.getConnection();
			
			 

			
			
			
			sql= " update tbl_addressbook  set isdeleted='1' "
					+ "where addressbookid=? ";
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1, addressbookid ); 
			 
			result = pstmt.executeUpdate();
			
		}finally {
			
			
			close();
		}
		
		
		
		
		return result;
		
	}// end of int updateIsDeletedAddr(String addressbookid)

	
	//새로운 주소 insert하는 메소드
	@Override
	public int insertNewAddress(Map<String, String> paraMap) throws SQLException {
		 

		int result=0;
		
		String sql="";
		boolean isExists =false;
		
		try {
			
			conn=ds.getConnection();
			
			
			if( paraMap.get("isdefaultaddr").equals("1")) { //수정하려는 주소를 기본배송지로 설정하고 싶은 경우
				
				sql= " select addressbookid "
						+ " from tbl_addressbook "
						+ " where fk_memberId=? and isdefaultaddr=? " ;
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("memberId")  );  
				pstmt.setString(2, "1" );
				
				rs=pstmt.executeQuery();
				
				isExists = rs.next(); 
				
				//---------------------
				if(isExists ) { //기본배송지가 존재하는 경우
					
					 
					int defaultAddr=rs.getInt("addressbookid");
					
					  sql= " update tbl_addressbook set isdefaultaddr=0  "
					  		+ " where fk_memberid=? and addressbookid=? ";
							  
					 
					pstmt= conn.prepareStatement(sql);
					
					pstmt.setString(1, paraMap.get("memberId")  ); 
					pstmt.setInt(2, defaultAddr );
					
					pstmt.executeUpdate();
			
					 
				 
					
				}
				
				
			} //end of if----

			
			//--------------------
			  sql=" insert into tbl_addressbook(  addressbookid, fk_memberid ,familyname  "
					+ "        ,lastname,tel, address, detailaddress, postcode "
					+ "        ,isdefaultaddr, isdeleted, registerday ) "
					+ " values( seq_addressbook.nextval, ?, ?, ?, ?, ?, ?, ?, ?,'0',sysdate ) ";
			
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setString(1,  paraMap.get("memberId") );
			pstmt.setString(2, paraMap.get("familyname")  ); 
			pstmt.setString(3,  paraMap.get("lastname") );
			pstmt.setString(4,  paraMap.get("tel") );
		
			pstmt.setString(5,  paraMap.get("address") );
			pstmt.setString(6,  paraMap.get("detailaddress") );
			pstmt.setString(7,  paraMap.get("postcode") );
			pstmt.setString(8,  paraMap.get("isdefaultaddr") );
			
			 
			
			
			result = pstmt.executeUpdate();
			
		}
		finally {
			
			
			close();
		}
		
		
		
		
		return result;
		
		
	} // end of int insertNewAddress(Map<String, String> paraMap) 

	//기본배송지 조회후 존재하면 기본배송지 정보 리턴하는 메소드
	@Override
	public AddressBookVO selectDefaultAddress(int memberId) throws SQLException {
		AddressBookVO avo=null;
		
		try {
			
			conn=ds.getConnection();
			
			String sql= " select addressbookid, fk_memberid ,familyname  "
					+ "        ,lastname,tel, address, detailaddress, postcode "
					+ "        ,isdefaultaddr, isdeleted, registerday "
					+ " from tbl_addressbook "
					+ " where fk_memberid=? and isdefaultaddr='1' and isdeleted='0' " ;
			 
			 pstmt=conn.prepareStatement(sql);
			 
			 pstmt.setInt(1, memberId);

			 
			rs=pstmt.executeQuery();
			
			if( rs.next() ) {
				
				 
				
				avo=new AddressBookVO();
				
				avo.setAddressBookId(rs.getInt("addressbookid"));
				avo.setFk_memberId( rs.getInt("fk_memberid"));
				 
				avo.setFamilyName(rs.getString("familyname"));
				
				avo.setLastName(rs.getString("lastname") );
				
				avo.setTel( rs.getString("tel"));
				 
				avo.setAddress( rs.getString("address"));
				 
				avo.setDetailAddress(rs.getString("detailaddress") );
				avo.setPostCode( rs.getString("postcode"));
				 
				avo.setIsDefaultAddr(  rs.getString("isdefaultaddr") );
				 
				avo.setIsDeleted( rs.getString("isdeleted"));
				
				avo.setRegisterDay(rs.getString("registerday") );
				
				 
				 
				
			} //end of while( rs.next() ) -----------------------------
			 
			
			
		}finally {
			
			close();
		}


		return avo;
	} //end of AddressBookVO selectDefaultAddress(int memberId)
	
	
	
	
	
	
	/* 예진 추가 -----------------------------------------------------------------------------------------------------------------*/
	@Override
	public int updateDefaultAddr(AddressBookVO avo) throws SQLException {
		int num = 0;
		try {
			conn = ds.getConnection();
			
			// 기존에 기본주소로 되어있을 수 있으니 일반주소로 변경한다
			String sql = "update tbl_addressbook set isDefaultAddr = 0 where fk_memberId = ? and isDefaultAddr = 1";

			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, avo.getFk_memberId());

			num = pstmt.executeUpdate();


			// pstmt 재사용 위해 파라미터 제거
			pstmt.clearParameters();

			if (avo.getAddressBookId() != 0) {
				// 유저가 값을 따로 변경하지 않아 addressBookId를 설정 했을 경우

				sql = "update tbl_addressbook set isDefaultAddr = 1 where addressBookId = ?";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, avo.getAddressBookId());

				num = pstmt.executeUpdate();
			} else {
				// 유저가 값을 변경해 addressBookId를 설정 못했을 경우

				sql = "Insert into TBL_ADDRESSBOOK values (seq_addressbook.nextval, ?, ?, ?, ?, ?, ?, ?, 1, 0, default)";

				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, avo.getFk_memberId());
				pstmt.setString(2, avo.getFamilyName());
				pstmt.setString(3, avo.getLastName());
				pstmt.setString(4, avo.getTel());
				pstmt.setString(5, avo.getAddress());
				pstmt.setString(6, avo.getDetailAddress());
				pstmt.setString(7, avo.getPostCode());

				num = pstmt.executeUpdate();
			}

		} finally {
			close();
		}

		return num;

	}
	
	
	/* 예진 추가 -----------------------------------------------------------------------------------------------------------------*/
}
