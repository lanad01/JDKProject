package model;

public class Reply {
	private Integer repno; // 리플의 일련번호
	private Integer repgroupno; // 대댓글을 위한 그룹넘버
	private Integer seqno; // 게시글의 번호 - 조인용
	private Integer user_no; // 유저번호
	private String register_date; //댓글 등록 시간
	private String content; // 댓글 내용
	public Integer getRepno() {
		return repno;
	}
	public void setRepno(Integer repno) {
		this.repno = repno;
	}
	public Integer getRepgroupno() {
		return repgroupno;
	}
	public void setRepgroupno(Integer repgroupno) {
		this.repgroupno = repgroupno;
	}
	public Integer getSeqno() {
		return seqno;
	}
	public void setSeqno(Integer seqno) {
		this.seqno = seqno;
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
	
	
}
