package product.domain;

public class ProductDetailImageVO {
	private int productDetailId;
	private String imageFile;
	private int position;
	
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
