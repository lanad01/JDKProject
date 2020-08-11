package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dao.ItemDao;
import model.Cart;
import model.Item;
import model.ItemSet;
import model.User;

@Controller
public class CartController {
	@Autowired
	private ItemDao itemDao;
	@RequestMapping(value="/cart/cartConfirm.html")
	public ModelAndView confirm() {
		//장바구니 확인을 눌럿을 때 호출
		return null;
	}
	@RequestMapping(value="/cart/cartClear.html")
	public ModelAndView clear(HttpSession session) {
		//장바구니 비우기를 눌렀을 때 호출
		Cart cart=(Cart)session.getAttribute("CART_KEY");
		if(cart==null) {
			cart=itemDao.getCart();
		}
		cart.clearAll();
		ModelAndView mav=new ModelAndView("cart/cart");
		User user=(User)session.getAttribute("USER_KEY");
		if(user !=null) { // 로그인한경우 
			mav.addObject("loginUser",user);
		}
		mav.addObject("message","카트를 비웠습니다.");
		return mav;
	}
	
	@RequestMapping(value="/cart/cartAdd.html")
	public ModelAndView add(Integer itemId, Integer quantity, HttpSession session) {
		//장바구니 담기를 눌렀을 때 호출되는 메서드
		//할일 : itemId로 DB에서 상품정보를 검색한다  findById (DAO ItemDAOImpl에 있다)
		Item item=itemDao.findById(itemId);
		// 검색결과가 존재하면 Cart에 해당 상품 정보를 저장
		//Cart를 세션에 저장한다.
		Cart cart = (Cart)session.getAttribute("CART_KEY");
		if(cart == null) {//로그인 후 처음 장바구니에 상품을 담는 경우
//			cart = new Cart(); new가 아니라 Dao Autowired를 활용하자
			cart=itemDao.getCart();
		}
		cart.push(new ItemSet(item,quantity));//장바구니에 상품+갯수 지정
		session.setAttribute("CART_KEY", cart); // 장바구니를 세션에 저장
		session.setAttribute("ITEM_KEY", item); // 담은 상품을 세션에 저장
		session.setAttribute("NUMBER", quantity); // 담은 상품 개수
		//장바구니에 상품을 담은 결과JSP 
		ModelAndView mav=new ModelAndView("redirect:/cart/result.html"); 
		// 이 안에 jsp뿐(index/index 처럼)만 아니라 다시 콘트롤러 쪽으로 돌릴 수 있다
		return mav;
	}
	@RequestMapping(value="/cart/result.html")
	public ModelAndView result(HttpSession session) { //결과작업을 여기서한다. redirect가 붙었으니 같은 redirect가 붙는다
		Cart cart = (Cart)session.getAttribute("CART_KEY");
		Item item = (Item)session.getAttribute("ITEM_KEY"); // 담은 상품을 세션에 저장
		int quantity = (Integer)session.getAttribute("NUMBER");
		User user = (User)session.getAttribute("USER_KEY");
		ModelAndView mav = new ModelAndView("cart/cart");
		if (user != null) {
			mav.addObject("loginUser",user);
		}
		mav.addObject("message",item.getItem_name()+"을(를)"+quantity+"개 카트에 담았습니다.");
		mav.addObject("cart",cart);
		return mav;
	}
}
