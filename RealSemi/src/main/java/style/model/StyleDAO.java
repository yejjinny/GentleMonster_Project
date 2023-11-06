package style.model;

import java.sql.SQLException;
import java.util.List;

import style.domain.StyleVO;

/**
 * 작성자 신예진 
 */
public interface StyleDAO {
	
	// 스타일 리스트 취득
	List<StyleVO> getStyleList() throws SQLException;

}
