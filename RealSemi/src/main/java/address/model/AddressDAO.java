package address.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import address.domain.AddressBookVO;

public interface AddressDAO {

	//멤버아이디를 통해 등록된 주소가 있으면 주소 목록 리스트
	List<AddressBookVO> selectAddressLists(Map<String, String> paraMap)throws SQLException;

	//기본 배송지 업데이트
	int updateDefaultAddress(Map<String, String> paraMap)throws SQLException;

	//배송지 수정 페이지에서 기존 값 가져오는 메소드
	AddressBookVO selectEditAddrView(String addressbookid)throws SQLException;

	//기존의 주소를 수정하는 메소드
	int updateEditAddress(Map<String, String> paraMap)throws SQLException;

	//주소 삭제 누르면 isdeleted 에 1을 넣는 메소드
	int updateIsDeletedAddr(String addressbookid)throws SQLException;

	//새로운 주소 insert하는 메소드
	int insertNewAddress(Map<String, String> paraMap)throws SQLException;

	
	//기본배송지 조회후 존재하면 기본배송지 정보 리턴하는 메소드
	AddressBookVO selectDefaultAddress(int memberId)throws SQLException;

	//기본 주소로 업데이트 _ 예진
	int updateDefaultAddr(AddressBookVO avo) throws SQLException;

}
