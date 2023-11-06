package category.model;

import java.sql.SQLException;
import java.util.List;

import category.domain.CategoryVO;

/**
 * 작성자 신예진
 */
public interface CategoryDAO {
	
	// 카테고리 정보 취득
	List<CategoryVO> getCategoryList() throws SQLException;

}
