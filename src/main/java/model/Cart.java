package model;

import java.util.LinkedList;
import java.util.List;

public class Cart {
	private List<ItemSet> itemList=new LinkedList<ItemSet>();
	public List<ItemSet> getItemList(){ //itemList의 getter메서드
		return itemList;
	}
	public boolean isEmpty() { //장바구니 유무 확인
		if(this.itemList==null || this.itemList.isEmpty()) {
			return true; // 비어있으면 true가 리턴
		}
		return false;
	}
	public void clearAll() { // 장바구니 비우기 
		this.itemList=new LinkedList<ItemSet>();
	}
	public void push(ItemSet itemSet) { //장바구니 추가
		boolean itemAlreadyInCart=false; // 이미 있는 물건인지 검사
		Item pushedItem=itemSet.getItem(); // 상품 객체 전체 호출
		int pushedItemId=pushedItem.getItem_id();//상품번호 호출
		//장바구니에 담을 상품벊가 기 존재하는 검사
		for(ItemSet cartItemSet: this.itemList) {
			Item cartItem = cartItemSet.getItem(); //장바구니의 상품을 불러옴
			int cartItemId=cartItem.getItem_id().intValue(); //상품번호
			if(cartItemId==pushedItemId) { //중복된 상품이 존재하는 경우
				cartItemSet.addQuantity(itemSet.getQuantity());//갯수증가 addQuantity(갯수 증가 메소드)
				itemAlreadyInCart=true;//이미 있는 상품인 경우 true 입력.
				break; 
			}
		}
		if(!itemAlreadyInCart) {
			this.itemList.add(itemSet);
		}
	} //itemSet을 장바구니 list<ItemSet>에 저장합니다.
	
}
