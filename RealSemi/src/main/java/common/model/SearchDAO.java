package common.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import product.domain.ProductVO;

public interface SearchDAO {
	
	// 유저의 검색결과값을 돌려준다
	List<ProductVO> searchKeyword(Map<String, String> paraMap) throws SQLException;

}
