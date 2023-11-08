package wish.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import wish.domain.WishVO;

/*
작성자 김민경
*/
public interface WishDAO {

	// 위시리스트의 상품 전체개수 알아오기
	int totalWishCount(int fk_memberid) throws SQLException;

	// 위시리스트 가져오기
	List<WishVO> getWishList(Map<String, Integer> paraMap) throws SQLException;
	
	// 삭제하기 버튼을 눌렀을 경우
	int deleteWishItem(Map<String, String> paraMap) throws SQLException;
	
	// 위시리스트에 담기 버튼을 눌렀을 경우
	int addWishItem(Map<String, String> paraMap) throws SQLException;

	

}
