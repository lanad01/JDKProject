package model;

public class Search {
	private String bbstype;
	private String keyword;
	private String searchkey;
	private boolean search=false;
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
	public boolean isSearch() {
		return search;
	}
	public void setSearch(boolean search) {
		this.search = search;
	}
	
}
