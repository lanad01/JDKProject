package model;

public class Search {
	private String bbstype;
	private String keyword;
	private String searchkey;
	public String getSearchkey() {
		return searchkey;
	}
	public void setSearchkey(String searchkey) {
		this.searchkey = searchkey;
	}
	public String getBbstype() {
		return bbstype;
	}
	public void setBbstype(String bbstype) {
		this.bbstype = bbstype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
