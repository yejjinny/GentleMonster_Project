package frameColor.domain;

/**
 * 작성자 신예진
 */
public class FrameColorVO {
	private int frameColorId;         // 프레임컬러Id
	private String frameColorEng;     // 프레임컬러 영문
	private String frameColorKor;     // 프레임컬러 한글
	
	public int getFrameColorId() {
		return frameColorId;
	}
	public void setFrameColorId(int frameColorId) {
		this.frameColorId = frameColorId;
	}
	public String getFrameColorEng() {
		return frameColorEng;
	}
	public void setFrameColorEng(String frameColorEng) {
		this.frameColorEng = frameColorEng;
	}
	public String getFrameColorKor() {
		return frameColorKor;
	}
	public void setFrameColorKor(String frameColorKor) {
		this.frameColorKor = frameColorKor;
	}
	
	
}
