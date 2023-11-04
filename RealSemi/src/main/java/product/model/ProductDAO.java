package product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import frameColor.domain.FrameColorVO;
import lenseColor.domain.LenseColorVO;
import material.domain.MaterialVO;
import product.domain.ProductDetailImageVO;
import product.domain.ProductVO;



public interface ProductDAO {

	// 상품전체보기 메소드 (대표사진, 이름, 가격) _ 명진 추가
	List<ProductVO> getProductList(Map<String, Integer> paraMap) throws SQLException;

	// 선글라스 개수 메소드 _ 명진 추가
	List<ProductVO> getSunglassesCount() throws SQLException;

	// 상품의 상세정보 취득 _ 예진 추가
	ProductVO getProductDetail(Map<String, Integer> paraMap) throws SQLException;

	// 상품의 상세사진 취득 _ 예진 추가
	List<ProductDetailImageVO> getProductDetailImageList(Map<String, Integer> paraMap) throws SQLException;
	
	// 상품의 다른 색상 상품 취득 _ 예진 추가
	List<ProductVO> getOtherProductList(Map<String, Integer> paraMap) throws SQLException;
	
	// 상품의 이름 정보만 취득 _ 예진 추가
	List<ProductVO> getProductNameList(String categoryId) throws SQLException;
	
	// 상품의 그룹 정보만 취득 _ 예진 추가
	ProductVO getProductGroupDetail(String productGroupId) throws SQLException;
	
	// 상품등록 _ 이미 있는 상품그룹에 컬러를 추가할 때 _ 예진 추가
	int insertProductDetail(Map<String, String> paraMap, List<ProductDetailImageVO> detailImageList) throws SQLException;
	
	// 상품등록 _ 새로운 상품그룹을 생성해 상품을 추가할 때 _ 예진 추가
	int insertProductGroupAndDetail(Map<String, String> paraMap, List<ProductDetailImageVO> detailImageList) throws SQLException;
	
	// 상품의 그룹과 디테일 정보 취득 _ 예진 추가
	ProductVO getProductGroupAndDetail(Map<String, String> paraMap) throws SQLException;

	// 필터 결과 갖고오기 _ 명진 추가
	List<ProductVO> getfilterlist(Map<String, String> paraMap, Map<String, String[]> paraArrMap) throws SQLException ;
	
	// 프레임컬러 가져오기 _ 명진 추가
	List<FrameColorVO> getFrameColor(Map<String, Integer> paraMap) throws SQLException;

	// 렌즈컬러렌즈 이름 가져오기 _ 명진 추가
	List<LenseColorVO> getLenseColor(Map<String, Integer> paraMap) throws SQLException;

	// 소재 이름 가져오기 _ 명진 추가
	List<MaterialVO> getMaterial(Map<String, Integer> paraMap) throws SQLException;

	// 프레임,틴트,선물 카테고리 알아오기 _ 명진 추가
	List<ProductVO> searchCategoryList(Map<String, String> paraMap2, Map<String, Integer> paraMap) throws SQLException;

	// 베스트셀러 카테고리 _ 명진 추가
	List<ProductVO> getBestSeller(Map<String, Integer> paraMap) throws SQLException;

}
