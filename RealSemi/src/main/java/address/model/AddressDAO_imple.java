package address.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

import address.domain.*;
import util.security.Sha256;
 

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
	public List<AddressVO> selectAddressLists(Map<String, String> paraMap) throws SQLException {
		

		List<AddressVO> AddressList =  new ArrayList<>();
		
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
				
				
				AddressVO avo=new AddressVO();
				
				avo.setAddressbookid(rs.getInt("addressbookid"));
				avo.setFk_memberid( rs.getInt("fk_memberid"));
				 
				avo.setFamilyname(rs.getString("familyname"));
				
				avo.setLastname(rs.getString("lastname") );
				
				avo.setTel( rs.getString("tel"));
				 
				avo.setAddress( rs.getString("address"));
				 
				avo.setDetailaddress(rs.getString("detailaddress") );
				avo.setPostcode( rs.getString("postcode"));
				 
				avo.setIsdefaultaddr(  rs.getString("isdefaultaddr") );
				 
				avo.setIsdeleted( rs.getString("isdeleted"));
				
				avo.setRegisterday(rs.getString("registerday") );
				
				 
				AddressList.add(avo);
				
				//System.out.println("rs.getString(\"familyname\") :=>"+rs.getString("familyname"));
				//System.out.println("확인ㅇ용: =>"+avo.getAddress());
				
			} //end of while( rs.next() ) -----------------------------
			 
			
			
		}finally {
			
			close();
		}
		
		return AddressList;
		
		
	} //end of  List<AddressVO> selectAddressLists(Map<String, String> paraMap)-----

	
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
			
			isExists = rs.next(); //행이 있으면(중복된 userid)  true 
						//행이 없으면(사용가능한 userid)  false
			
			//---------------------
			if(isExists ) { //기본배송지가 존재하는 경우
				
				//conn=ds.getConnection();
				int defaultAddr=rs.getInt("addressbookid");
				
				  sql= " update tbl_addressbook set isdefaultaddr=0  "
				  		+ " where fk_memberid=? and addressbookid=? ";
						  
				 
				pstmt= conn.prepareStatement(sql);
				
				pstmt.setString(1, paraMap.get("fk_memberid")  ); 
				pstmt.setInt(2, defaultAddr );
				
				pstmt.executeUpdate();
		
				 
				//result = pstmt.executeUpdate();
				
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
	public AddressVO selectEditAddrView(String addressbookid) throws SQLException {
		
		

		AddressVO avo=null;
		
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
				
				
				avo=new AddressVO();
				
				avo.setAddressbookid(rs.getInt("addressbookid"));
				avo.setFk_memberid( rs.getInt("fk_memberid"));
				 
				avo.setFamilyname(rs.getString("familyname"));
				
				avo.setLastname(rs.getString("lastname") );
				
				avo.setTel( rs.getString("tel"));
				 
				avo.setAddress( rs.getString("address"));
				 
				avo.setDetailaddress(rs.getString("detailaddress") );
				avo.setPostcode( rs.getString("postcode"));
				 
				avo.setIsdefaultaddr(  rs.getString("isdefaultaddr") );
				 
				avo.setIsdeleted( rs.getString("isdeleted"));
				
				avo.setRegisterday(rs.getString("registerday") );
				
				 
				 
				
			} //end of while( rs.next() ) -----------------------------
			 
			
			
		}finally {
			
			close();
		}
		
		return avo;
	}// end of AddressVO selectEditAddrView(String addressbookid) ----

	
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
				
				isExists = rs.next(); //행이 있으면(중복된 userid)  true 
							//행이 없으면(사용가능한 userid)  false
				
				//---------------------
				if(isExists ) { //기본배송지가 존재하는 경우
					
					//conn=ds.getConnection();
					int defaultAddr=rs.getInt("addressbookid");
					
					  sql= " update tbl_addressbook set isdefaultaddr=0  "
					  		+ " where fk_memberid=? and addressbookid=? ";
							  
					 
					pstmt= conn.prepareStatement(sql);
					
					pstmt.setString(1, paraMap.get("fk_memberid")  ); 
					pstmt.setInt(2, defaultAddr );
					
					pstmt.executeUpdate();
			
					 
					//result = pstmt.executeUpdate();
					
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
				
				isExists = rs.next(); //행이 있으면(중복된 userid)  true 
							//행이 없으면(사용가능한 userid)  false
				
				//---------------------
				if(isExists ) { //기본배송지가 존재하는 경우
					
					//conn=ds.getConnection();
					int defaultAddr=rs.getInt("addressbookid");
					
					  sql= " update tbl_addressbook set isdefaultaddr=0  "
					  		+ " where fk_memberid=? and addressbookid=? ";
							  
					 
					pstmt= conn.prepareStatement(sql);
					
					pstmt.setString(1, paraMap.get("memberId")  ); 
					pstmt.setInt(2, defaultAddr );
					
					pstmt.executeUpdate();
			
					 
					//result = pstmt.executeUpdate();
					
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

}
