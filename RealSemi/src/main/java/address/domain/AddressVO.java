package address.domain;

public class AddressVO {
	
	
	private int addressbookid; //주소록 id
	private int fk_memberid; //회원 id
	private String familyname; //성
	private String lastname; //이름
	private String tel; //전화번호
	private String address; //주소
	private String detailaddress; //상세주소
	private String postcode; //우편번호
	private String isdefaultaddr; //기본배송지여부-> 0: 기본배송지아님 ..1:기본배송지
	private String isdeleted; //삭제여부 0: 삭제안함 .. 1:삭제함
	private String registerday; //등록일
	
	//---------------------------------------
	public int getAddressbookid() {
		return addressbookid;
	}
	public void setAddressbookid(int addressbookid) {
		this.addressbookid = addressbookid;
	}
	public int getFk_memberid() {
		return fk_memberid;
	}
	public void setFk_memberid(int fk_memberid) {
		this.fk_memberid = fk_memberid;
	}
	public String getFamilyname() {
		return familyname;
	}
	public void setFamilyname(String familyname) {
		this.familyname = familyname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
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
	public String getDetailaddress() {
		return detailaddress;
	}
	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}
	public String getPostcode() {
		return postcode;
	}
	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}
	public String getIsdefaultaddr() {
		return isdefaultaddr;
	}
	public void setIsdefaultaddr(String isdefaultaddr) {
		this.isdefaultaddr = isdefaultaddr;
	}
	public String getIsdeleted() {
		return isdeleted;
	}
	public void setIsdeleted(String isdeleted) {
		this.isdeleted = isdeleted;
	}
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}


}
