package order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import member.domain.MemberVO;
import order.domain.OrderVO;

/**
 * 작성자 신예진 
 */
public interface OrderDAO {
	// 결제하기 버튼 클릭시 배송지 선택을 위해 유저가 등록해뒀던 주소정보를 return
	List<OrderVO> getAddressBookList(Map<String, Integer> paraMap) throws SQLException;

	// 유저가 고른 주소록 정보를 return
	OrderVO getAddressOne(Map<String, Integer> paraMap) throws SQLException;

	// 유저가 결제한 정보를 Order, OrderDetail테이블에 insert
	String insertOrderData(Map<String, Object> paraMap) throws SQLException;

	// 유저의 주문 정보를 읽어온다
	OrderVO getOrderCompleteList(Map<String, String> paraMap) throws SQLException;

	// 관리자_주문목록 페이지 갯수 취득
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 관리자_주문목록 취득
	List<OrderVO> getOrderList(int currentPageNo) throws SQLException;

	// 관리자_주문목록 검색
	List<OrderVO> searchOrder(Map<String, String> paraMap) throws SQLException;
	
	// 유저_주문내역 페이지
	int getPersonalTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 유저_주문내역 리스트 취득
	List<OrderVO> getPersonalOrderList(Map<String, String> paraMap) throws SQLException;
	
	// 유저_주문내역 상세용 OrderVO 취득
	OrderVO getPersonalOrderOne(Map<String, String> paraMap) throws SQLException;
	
	// 유저_주문내역 상세용 주문 상품 리스트 취득
	List<OrderVO> getPersonalOrderDetail(Map<String, String> paraMap) throws SQLException;
	
	// 유저_회원정보 주문내역 취득
	List<OrderVO> getOrderListInfo(int memberId) throws SQLException;
}
