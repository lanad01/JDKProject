package model;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class User { 
	private Integer user_no;
	@NotEmpty(message="이름은 반드시 적어주세요")  //hibernate-validator 라이브러리 의존성 잡아줘야함
	private String name;
	@NotEmpty(message="닉네임은 반드시 적어주세요")
	private String nick;
	private String birth_date;
	private String gender;
	@NotEmpty(message="아이디는 반드시 적어주세요")
	private String id;
	@NotEmpty(message="비밀번호는 반드시 적어주세요")
	private String password;
	@NotEmpty(message="비밀번호 확인은 필수입니다.")
	private String pwdCheck;
	@NotEmpty(message="비밀번호 확인질문은 필수입니다.")
	private String quiz;
	@NotEmpty(message="비밀번호 확인답변은 필수입니다.")
	private String answer;
	private String email;
	private String area;
	private String picture_url;
	private MultipartFile picture;
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPwdCheck() {
		return pwdCheck;
	}
	public void setPwdCheck(String pwdCheck) {
		this.pwdCheck = pwdCheck;
	}
	public String getQuiz() {
		return quiz;
	}
	public void setQuiz(String quiz) {
		this.quiz = quiz;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public String getPicture_url() {
		return picture_url;
	}
	public void setPicture_url(String picture_url) {
		this.picture_url = picture_url;
	}
	public MultipartFile getPicture() {
		return picture;
	}
	public void setPicture(MultipartFile picture) {
		this.picture = picture;
	}
	
	
	
//	@NotEmpty
//	@NotNull
//	@Range(min=0, max=1000000, message="{min}보다 크고 {max}보다 작아야합니다.")
//	@Null Null여부 검사
//	@NotNull Null이 아닌지 검사
//	@AssertTrue true인지 검사
//	@AssertFalse False인지 검사
//	@Min 지정한 값보다 큰 지 검사
//	@Max 지정한 값보다 작은 지 검사
//	@Digits 지정한 자릿수 이내인지 검사
//	@Email 유효한 이메일 형식인지 검사
//	@Range 지정한 범위의 숫자인지 검사
//	@NotEmpty 빈 문자가 아닌지 검사
//	@Past 현재 날짜보다 가거의 날짜인지 검사
//	@Future 현재 날짜보다 미래의 날짜인지 검사
	
}
