package product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import product.domain.ProductVO;



public interface ProductDAO {

	// 상품전체보기 메소드 (대표사진, 이름, 가격)
	List<ProductVO> getProductList(Map<String, Integer> paraMap) throws SQLException;

	// 선글라스 개수 메소드
	List<ProductVO> getsunglassesCount(Map<String, Integer> paraMap) throws SQLException;

	// 선글라스 전체 개수 알아오기
	public int allViewList(String fk_productGroupId)   throws SQLException ;


}
