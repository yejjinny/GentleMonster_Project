package common.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import product.domain.ProductVO;

/**
 * 작성자 신예진
 */
public interface SearchDAO {
	
	// 유저의 검색어를 토대로 한 검색 결과 취득
	List<ProductVO> searchKeyword(Map<String, String> paraMap) throws SQLException;

}
