package material.model;

import java.sql.SQLException;
import java.util.List;

import material.domain.MaterialVO;

/**
 * 작성자 신예진 
 */
public interface MaterialDAO {
	
	// 소재 정보 취득
	List<MaterialVO> getMaterialList() throws SQLException;

}
