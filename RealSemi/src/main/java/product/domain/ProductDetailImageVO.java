package product.domain;

/**
 * 작성자 신예진
 */
public class ProductDetailImageVO {
	private int productDetailId;      // 상품상세Id
	private String imageFile;         // 이미지파일 경로
	private int position;             // 순서
	
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}
	public int getProductDetailId() {
		return productDetailId;
	}
	public void setProductDetailId(int productDetailId) {
		this.productDetailId = productDetailId;
	}
	public String getImageFile() {
		return imageFile;
	}
	public void setImageFile(String imageFile) {
		this.imageFile = imageFile;
	}
	
	
}
