package store.domain;

public class StoreVO {

	private int storeId; 			// 매장아이디	
	private String storeName; 		// 매장이름
	private int fk_countryId; 		// 국가아이디
	private int fk_storeCategoryId; // 매장카테고리아이디
	private String cityEng; 		// 매장도시(영문)
	private String cityKor; 		// 매장도시(한글)
	private String address; 		// 매장주소
	private String tel; 			// 매장연락처
	private String openingHours; 	// 매장영업시간
	private String description; 	// 매장소개
	private String mainImageFile; 	// 대표사진경로
	private String isDeleted; 		// 삭제여부
	private String registerday; 	// 등록일
	private String updateday; 		// 업데이트일
	
	
	public int getStoreId() {
		return storeId;
	}
	public void setStoreId(int storeId) {
		this.storeId = storeId;
	}
	public String getStoreName() {
		return storeName;
	}
	public void setStoreName(String storeName) {
		this.storeName = storeName;
	}
	public int getFk_countryId() {
		return fk_countryId;
	}
	public void setFk_countryId(int fk_countryId) {
		this.fk_countryId = fk_countryId;
	}
	public int getFk_storeCategoryId() {
		return fk_storeCategoryId;
	}
	public void setFk_storeCategoryId(int fk_storeCategoryId) {
		this.fk_storeCategoryId = fk_storeCategoryId;
	}
	public String getCityEng() {
		return cityEng;
	}
	public void setCityEng(String cityEng) {
		this.cityEng = cityEng;
	}
	public String getCityKor() {
		return cityKor;
	}
	public void setCityKor(String cityKor) {
		this.cityKor = cityKor;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getOpeningHours() {
		return openingHours;
	}
	public void setOpeningHours(String openingHours) {
		this.openingHours = openingHours;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(String mainImageFile) {
		this.mainImageFile = mainImageFile;
	}
	public String getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(String isDeleted) {
		this.isDeleted = isDeleted;
	}
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
		this.registerday = registerday;
	}
	public String getUpdateday() {
		return updateday;
	}
	public void setUpdateday(String updateday) {
		this.updateday = updateday;
	}
	

}


