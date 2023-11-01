package category.model;

import java.sql.SQLException;
import java.util.List;

import category.domain.CategoryVO;

public interface CategoryDAO {
	
	// 카테고리 정보 취득 _ 예진
	List<CategoryVO> getCategoryList() throws SQLException;

}
