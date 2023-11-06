package lenseColor.domain;

/**
 * 작성자 신예진
 */
public class LenseColorVO {
	private int lenseColorId;        // 렌즈컬러Id
	private String lenseColorEng;    // 렌즈컬러 영문
	private String lenseColorKor;    // 렌즈컬러 한글
	
	public int getLenseColorId() {
		return lenseColorId;
	}
	public void setLenseColorId(int lenseColorId) {
		this.lenseColorId = lenseColorId;
	}
	public String getLenseColorEng() {
		return lenseColorEng;
	}
	public void setLenseColorEng(String lenseColorEng) {
		this.lenseColorEng = lenseColorEng;
	}
	public String getLenseColorKor() {
		return lenseColorKor;
	}
	public void setLenseColorKor(String lenseColorKor) {
		this.lenseColorKor = lenseColorKor;
	}
	
	
}
