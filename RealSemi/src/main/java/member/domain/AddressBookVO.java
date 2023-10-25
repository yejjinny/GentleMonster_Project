package member.domain;

public class AddressBookVO {
	private int addressBookId;              // 주소록id
	private int fk_memberId;                // 멤버id
	private String familyName;              // 성
	private String lastName;                // 이름
	private String tel;                     // 전화번호
	private String address;                 // 주소
	private String detailAddress;           // 상세주소
	private String postCode;                // 우편번호
	private int isDefaultAddr;              // 기본주소여부
	private int isDeleted;                  // 삭제여부
	private String registerDay;             // 가입일자 
	
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
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getRegisterDay() {
		return registerDay;
	}
	public void setRegisterDay(String registerDay) {
		this.registerDay = registerDay;
	}
}
