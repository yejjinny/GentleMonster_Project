package member.domain;

public class MemberVO {
	private int memberId;              // 회원아이디
	private String email;              // 이메일 (AES-256 암호화/복호화 대상)
	private String pwd;                // 비밀번호 (SHA-256 암호화 대상)
	private int gender;                // 성별   남자:1  / 여자:2
	private String familyName;         // 성
	private String lastName;           // 이름
	private String birth;              // 생년월일
	private int grade;                 // 등급   일반회원:1 / 관리자:2 
	private int isDeleted;             // 탈퇴유무      0 : 정상  /  1 : 탈퇴
	private String registerDay;        // 가입일자 
	private String updateDay;          // 업데이트일자 
	
	
	//-----------예인추가
	//회원수정시 생성자
	public MemberVO(int memberId, String email, int gender) {
		
		this.memberId =memberId;
		this.email=email;
		this.gender=gender;
		
	}
	//---------------------------
	public  MemberVO() {
		
	}
	//---------
	
	
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
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
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	public String getUpdateDay() {
		return updateDay;
	}
	public void setUpdateDay(String updateDay) {
		this.updateDay = updateDay;
	}
	
	//---예인추가
	public String getBirthYear() {
		return birth.substring(0,4);
	}
	public String getBirthMonth() {
		return birth.substring(4,6);
	}
	public String getBirthDay() {
		return birth.substring(6,8);
	}
	//--
	public String getGenderVal() {
		
		if(gender==1) {
			
			return "남성";
			
		}
		else {
			
			return "여성";
		}
		
	}
}
