package model;

import org.hibernate.validator.constraints.NotEmpty;

public class Bbs { // 포인트는 테이블 따로 둡시다
	private Integer seqno;
	@NotEmpty(message="제목을 입력하세요")
	private String title;
	private Integer user_no;
	private String register_date;
	@NotEmpty(message="글 내용을 입력하세요")
	private String content;
	private String bbstype;
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getUser_no() {
		return user_no;
	}
	public void setUser_no(Integer user_no) {
		this.user_no = user_no;
	}
	public String getRegister_date() {
		return register_date;
	}
	public void setRegister_date(String register_date) {
		this.register_date = register_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getBbstype() {
		return bbstype;
	}
	public void setBbstype(String bbstype) {
		this.bbstype = bbstype;
	}
}
