package product.domain;

public class ProductVO {

	private int productDetailId;	 // 상품정보아이디
	private int fk_productGroupId;   // 상품대분류아이디
	private int fk_frameColorEng; 	 // 프레임컬러아이디
	private String gender;			 // 젠더
	private int isMirror;		     // 미러여부
	private String description; 	 // 소개
	private int isTint;			     // 틴트여부
	private int isGift;			     // 선물추천여부
	private int isBlueLight;		 // 블루라이트차단여부
	private int stock;				 // 재고
	private int isDeleted; 		     // 삭제여부
	private int isIndex;			 // 인덱스상품여부
	private String mainImageFile;	 // 대표사진경로
	private String registerDay;		 // 등록일
	private String updateDay;		 // 업데이트일
	private String productGroupName; // 상품그룹명
	private String frameColoreng;    // 프레임컬러영문
	private int lenseColorId;		 // 렌즈컬러아이디
	private Long price;				 // 가격	
	private String  productName;	 // 상품명
	private int count;				 // 개수
	private int isWish;              // 위시리스트등록여부 예진추가 + 게터세터
	private String silhouette;       // 실루엣 예진추가 + 게터세터
	private String detail;           // 디테일 예진추가 + 게터세터
	private double frameSize;        // 프레임 사이즈 예진추가 + 게터세터
	private double templeLength;     // 템플 길이  예진추가 + 게터세터
	private double lenseWidthSize;   // 렌즈 폭 사이즈  예진추가 + 게터세터
	private double lenseHeightSize;  // 렌즈 높이 사이즈  예진추가 + 게터세터
	private double bridge;           // 브릿지 사이즈  예진추가 + 게터세터
	private int categoryId;          // 카테고리아이디 예친추가 + 게터세터
	private int frameId;             // 프레임아이디 예진추가 + 게터세터
	private int materialId;          // 소재아이디 예진추가 + 게터세터
	private int fk_frameId;			 // 프레임아이디 명진추가
	private int quantity;			 // 판매수
	private Long rno;				 // 가상번호
	
	public int getProductDetailId() {
		return productDetailId;
	}
	public void setProductDetailId(int productDetailId) {
		this.productDetailId = productDetailId;
	}
	public int getFk_productGroupId() {
		return fk_productGroupId;
	}
	public void setFk_productGroupId(int fk_productGroupId) {
		this.fk_productGroupId = fk_productGroupId;
	}
	public int getFk_frameColorEng() {
		return fk_frameColorEng;
	}
	public void setFk_frameColorEng(int fk_frameColorEng) {
		this.fk_frameColorEng = fk_frameColorEng;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getIsMirror() {
		return isMirror;
	}
	public void setIsMirror(int isMirror) {
		this.isMirror = isMirror;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public int getIsTint() {
		return isTint;
	}
	public void setIsTint(int isTint) {
		this.isTint = isTint;
	}
	public int getIsGift() {
		return isGift;
	}
	public void setIsGift(int isGift) {
		this.isGift = isGift;
	}
	public int getIsBlueLight() {
		return isBlueLight;
	}
	public void setIsBlueLight(int isBlueLight) {
		this.isBlueLight = isBlueLight;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(int isDeleted) {
		this.isDeleted = isDeleted;
	}
	public int getIsIndex() {
		return isIndex;
	}
	public void setIsIndex(int isIndex) {
		this.isIndex = isIndex;
	}
	public String getMainImageFile() {
		return mainImageFile;
	}
	public void setMainImageFile(String mainImageFile) {
		this.mainImageFile = mainImageFile;
	}
	public String getRegisterDay() {
		return registerDay;
	}
	public void setRegisterDay(String registerDay) {
		this.registerDay = registerDay;
	}
	public String getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}
	public String getProductGroupName() {
		return productGroupName;
	}
	public void setProductGroupName(String productGroupName) {
		this.productGroupName = productGroupName;
	}
	public String getFrameColoreng() {
		return frameColoreng;
	}
	public void setFrameColoreng(String frameColoreng) {
		this.frameColoreng = frameColoreng;
	}
	public int getLenseColorId() {
		return lenseColorId;
	}
	public void setLenseColorId(int lenseColorId) {
		this.lenseColorId = lenseColorId;
	}
	public Long getPrice() {
		return price;
	}
	public void setPrice(Long price) {
		this.price = price;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getIsWish() {
		return isWish;
	}
	public void setIsWish(int isWish) {
		this.isWish = isWish;
	}
	public String getSilhouette() {
		return silhouette;
	}
	public void setSilhouette(String silhouette) {
		this.silhouette = silhouette;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public double getFrameSize() {
		return frameSize;
	}
	public void setFrameSize(double frameSize) {
		this.frameSize = frameSize;
	}
	public double getTempleLength() {
		return templeLength;
	}
	public void setTempleLength(double templeLength) {
		this.templeLength = templeLength;
	}
	public double getLenseWidthSize() {
		return lenseWidthSize;
	}
	public void setLenseWidthSize(double lenseWidthSize) {
		this.lenseWidthSize = lenseWidthSize;
	}
	public double getLenseHeightSize() {
		return lenseHeightSize;
	}
	public void setLenseHeightSize(double lenseHeightSize) {
		this.lenseHeightSize = lenseHeightSize;
	}
	public double getBridge() {
		return bridge;
	}
	public void setBridge(double bridge) {
		this.bridge = bridge;
	}
	public int getCategoryId() {
		return categoryId;
	}
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}
	public int getFrameId() {
		return frameId;
	}
	public void setFrameId(int frameId) {
		this.frameId = frameId;
	}
	public int getMaterialId() {
		return materialId;
	}
	public void setMaterialId(int materialId) {
		this.materialId = materialId;
	}
	public int getFk_frameId() {
		return fk_frameId;
	}
	public void setFk_frameId(int fk_frameId) {
		this.fk_frameId = fk_frameId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Long getRno() {
		return rno;
	}
	public void setRno(Long rno) {
		this.rno = rno;
	}
	
	
	
}