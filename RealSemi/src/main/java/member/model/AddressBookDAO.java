package member.model;

import java.sql.SQLException;

import member.domain.AddressBookVO;

public interface AddressBookDAO {

	//기본 주소로 업데이트
	int updateDefaultAddr(AddressBookVO avo) throws SQLException;

}
