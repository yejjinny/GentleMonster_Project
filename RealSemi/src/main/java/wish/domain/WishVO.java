package wish.domain;

public class WishVO {

	private int wishId; 				// 위시리스트ID
	private int memberId; 				// 회원ID
	private int productDetailId; 		// 상품디테일ID
	private String productName;       	// 상품명
	private long price;               	// 가격
	private String mainImageFile;     	// 대표사진이미지

	
	/////////////////////////////////////////////////////
	
	
	public int getWishId() {
		return wishId;
	}
	public void setWishId(int wishId) {
		this.wishId = wishId;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public int getProductdetailId() {
		return productDetailId;
	}
	public void setProductdetailId(int productdetailId) {
		this.productDetailId = productdetailId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(String mainImageFile) {
		this.mainImageFile = mainImageFile;
	}
	
	
	
	


}


