package order.domain;

public class OrderVO {
	private String orderId;          //주문번호 (주문id)
	private int addressBookId;       //주소록id
	private int fk_memberId;         //회원id
	private String familyName;       //성
	private String lastName;         //이름
	private String fullName;         //풀네임
	private String tel;              //전화번호
	private String address;          //주소
	private String detailAddress;    //상세주소
	private String postCode;         //우편번호
	private int isDefaultAddr;       //기본배송지 여부
	private String productName;      //상품명
	private long price;              //가격
	private int quantity;            //수량
	private long amount;              //총 금액
	private String mainImageFile;    //대표사진이미지
	
	
	public int getAddressBookId() {
		return addressBookId;
	}
	public void setAddressBookId(int addressBookId) {
		this.addressBookId = addressBookId;
	}
	public int getFk_memberId() {
		return fk_memberId;
	}
	public void setFk_memberId(int fk_memberId) {
		this.fk_memberId = fk_memberId;
	}
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getDetailAddress() {
		return detailAddress;
	}
	public void setDetailAddress(String detailAddress) {
		this.detailAddress = detailAddress;
	}
	public String getPostCode() {
		return postCode;
	}
	public void setPostCode(String postCode) {
		this.postCode = postCode;
	}
	public int getIsDefaultAddr() {
		return isDefaultAddr;
	}
	public void setIsDefaultAddr(int isDefaultAddr) {
		this.isDefaultAddr = isDefaultAddr;
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
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	
	
}
