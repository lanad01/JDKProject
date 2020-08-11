package model;

public class ItemSet {
	public void addQuantity(Integer addQuantity) { //상품 갯수 증가 메서드
		int number=addQuantity.intValue();//정수로 바꾼다
		int current=this.getQuantity().intValue(); //현재의 개수를 정수로 바꾼다.
		this.setQuantity(new Integer(number+current)); //현재갯수 + 추가갯수
	}
	public void subQuantity(Integer addQuantity) {
		int number=addQuantity.intValue();//정수로 바꾼다
		int current=this.getQuantity().intValue(); //현재의 개수를 정수로 바꾼다.
		this.setQuantity(new Integer(number-current)); //현재갯수 + 추가갯수
	}
	private Item item;
	private Integer quantity; //개수
	public ItemSet(Item item, Integer quantity) { //생성자 초기화
		this.item=item; this.quantity=quantity;
	}
	public Item getItem() {
		return item;
	}
	public void setItem(Item item) {
		this.item = item;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	
}
