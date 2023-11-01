package material.model;

import java.sql.SQLException;
import java.util.List;

import material.domain.MaterialVO;

public interface MaterialDAO {
	
	// 소재 정보 취득용 _예진
	List<MaterialVO> getMaterialList() throws SQLException;

}
