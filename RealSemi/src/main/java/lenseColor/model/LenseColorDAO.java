package lenseColor.model;

import java.sql.SQLException;
import java.util.List;

import lenseColor.domain.LenseColorVO;

/**
 * 작성자 신예진
 */
public interface LenseColorDAO {
	
	// 렌즈 컬러 정보 취득
	List<LenseColorVO> getLenseColorList() throws SQLException;

}
