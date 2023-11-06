package category.domain;

/**
 * 작성자 신예진
 */
public class CategoryVO {
	private int categoryId;           // 카테고리Id (1: 선글라스, 2: 안경 등) 
	private String categoryName;      // 카테고리명
	
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	
}
