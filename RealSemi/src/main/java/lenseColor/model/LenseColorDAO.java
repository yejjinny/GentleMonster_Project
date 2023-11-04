package lenseColor.model;

import java.sql.SQLException;
import java.util.List;

import lenseColor.domain.LenseColorVO;

public interface LenseColorDAO {
	
	// 렌즈 컬러 정보 취득용 _ 예진
	List<LenseColorVO> getLenseColorList() throws SQLException;

}
