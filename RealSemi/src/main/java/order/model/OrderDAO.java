package order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import order.domain.OrderVO;

public interface OrderDAO {
	// 결제하기 버튼 클릭시 배송지 선택을 위해 유저가 등록해뒀던 주소정보를 return
	List<OrderVO> getAddressBookList(Map<String, Integer> paraMap) throws SQLException;
	
	// 유저가 고른 주소록 정보를 return
	OrderVO getAddressOne(Map<String, Integer> paraMap) throws SQLException;
	
	// 유저가 결제한 정보를 Order, OrderDetail테이블에 insert
	String insertOrderData(Map<String, Object> paraMap) throws SQLException;

	// 유저의 주문 정보를 읽어온다
	OrderVO getOrderCompleteList(Map<String, String> paraMap) throws SQLException;

}
