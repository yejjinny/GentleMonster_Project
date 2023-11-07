package store.model;

import java.sql.SQLException;
import java.util.*;

import store.domain.StoreImgVO;
import store.domain.StoreVO;

public interface StoreDAO {

	// 스토어(스토어) 개수 알아오기
	int totalStoreCount(String countryid) throws SQLException;

	// 스토어(백화점/면세점) 개수 알아오기
	int totalDepStoreCount(String countryid) throws SQLException;

	// 스토어리스트(스토어) 가져오기
	List<StoreVO> getStoreList(String countryid) throws SQLException;

	// 스토어리스트(백화점/면세점) 가져오기
	List<StoreVO> getDepStoreList(String countryid) throws SQLException;

	// 스토어리스트(스토어) 상세사진 가져오기
	List<StoreImgVO> getStoreImgList(String countryid) throws SQLException;

}
