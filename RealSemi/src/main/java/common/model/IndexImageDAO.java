package common.model;

import java.sql.SQLException;
import java.util.List;

import product.domain.ProductVO;

/**
 * 작성자 신예진
 */
public interface IndexImageDAO {
	
	// 인덱스에 보여줄 상품 취득
	List<ProductVO> getIndexImageList() throws SQLException;

}
