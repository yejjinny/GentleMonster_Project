package cart.domain;

public class CartVO {
	private int cartId;               //카트아이디
	private int productDetailId;      //상품디테일아이디
	private String productName;       //상품명
	private long price;               //가격
	private int quantity;             //수량
	private String mainImageFile;     //대표사진이미지
	private int stock;                //재고
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public int getProductDetailId() {
		return productDetailId;
	}
	public void setProductDetailId(int productDetailId) {
		this.productDetailId = productDetailId;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(String mainImageFile) {
		this.mainImageFile = mainImageFile;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	
}
