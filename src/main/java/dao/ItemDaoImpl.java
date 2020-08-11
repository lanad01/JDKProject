package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.Cart;
import model.Item;
@Repository
public class ItemDaoImpl implements ItemDao {
	@Autowired
	private SqlSession session;
	
	public List<Item> findAll() {
		List<Item> list = session.selectList("user.getItemList");
		return list;
	}
	public Item findById(Integer id) {
		Item item=session.selectOne("user.getItem",id);
		return item;
	}
	public Cart getCart() {	
		return new Cart();
	}

}















