package cart.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import cart.domain.CartVO;

public interface CartDAO {
	//쇼핑백 버튼 및 쇼핑백 자세히 보기 버튼을 눌렀을 경우
	List<CartVO> getCartList(int memberId) throws SQLException;
	
	//삭제하기 버튼을 눌렀을 경우
	int deleteCartItem(Map<String, String> paraMap) throws SQLException;

	//수량 +- 버튼을 눌렀을 경우
	CartVO updateCartQty(Map<String, String> paraMap) throws SQLException;
	
	//쇼핑백에 추가 버튼을 눌렀을 경우
	int addCartItem(Map<String, String> paraMap) throws SQLException;
}
