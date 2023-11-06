package material.domain;

/**
 * 작성자 신예진
 */
public class MaterialVO {
	private int materialId;          // 소재Id
	private String materialName;     // 소재명
	
	public int getMaterialId() {
		return materialId;
	}
	public void setMaterialId(int materialId) {
		this.materialId = materialId;
	}
	public String getMaterialName() {
		return materialName;
	}
	public void setMaterialName(String materialName) {
		this.materialName = materialName;
	}
	
}
