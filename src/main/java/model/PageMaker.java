package model;

public class PageMaker {
	//총게시글의 숫자와 현재의 페이지를 얻어와야해
	private int totalBbsCnt;
	
	public int getTotalBbsCnt() {
		return totalBbsCnt;
	}

	public void setTotalBbsCnt(int totalBbsCnt) {
		this.totalBbsCnt = totalBbsCnt;
	}
	private int totalPage;
	private int startPage;
	private int endPage;
	private int tempEndPage;
	private int currentPage;
	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	private int displayPageNum=10;
	private boolean prev;
	
	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTempEndPage() {
		return tempEndPage;
	}

	public void setTempEndPage(int tempEndPage) {
		this.tempEndPage = tempEndPage;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	private boolean next;
	
	public void calcData() {
		totalPage=this.totalBbsCnt/10+1;
		this.setTotalPage(totalPage);
		// 147개의 글 현재 페이지는 11
		endPage=(int)(Math.ceil(this.currentPage/(double)displayPageNum)*displayPageNum);
		this.setEndPage(endPage);
		
		startPage=(endPage-displayPageNum)+1; // 10-10+1=1
		this.setStartPage(startPage);
		
		
		tempEndPage=(int)(Math.ceil(totalBbsCnt/10)+1); // 147/10= 15
		
		this.setTempEndPage(tempEndPage);
		if(endPage > tempEndPage) {
			endPage=tempEndPage; // 138개의 글이라 14개의 페이지가 나와야하는데 20개가 나오면 안되잖아
		}
		prev=startPage==1 ? false : true; // startPage가 1이라면 이전 키가 비활성화
		this.setPrev(prev);
		next=endPage*10 >= totalBbsCnt ? false:true; // endpage 14*10 > 138 => false
		this.setNext(next);
	}
	
}
