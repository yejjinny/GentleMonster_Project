package store.domain;

public class StoreImgVO {

	private int storeDetailImageId; // 매장디테일이미지ID
	private int fk_storeId; // 매장ID
	private String imageFile; // 매장디테일사진경로
	// POSITION; // 사진위치 
	private String type;
	
	
	
	public int getStoreDetailImageId() {
		return storeDetailImageId;
	}
	public void setStoreDetailImageId(int storeDetailImageId) {
		this.storeDetailImageId = storeDetailImageId;
	}
	public int getFk_storeId() {
		return fk_storeId;
	}
	public void setFk_storeId(int fk_storeId) {
		this.fk_storeId = fk_storeId;
	}
	public String getimageFile() {
		return imageFile;
	}
	public void setimageFile(String imagefile) {
		this.imageFile = imagefile;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
	
	
}
