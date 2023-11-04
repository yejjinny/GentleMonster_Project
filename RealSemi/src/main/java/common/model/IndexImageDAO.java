package common.model;

import java.sql.SQLException;
import java.util.List;

import product.domain.ProductVO;

public interface IndexImageDAO {

	List<ProductVO> getIndexImageList() throws SQLException;

}
