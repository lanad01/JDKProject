package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;
@Repository
public class UserDaoImpl implements UserDao {
	  //종속객체는 UserDaoImpl이다 거기에 Repository 붙이면 SqlSession이 주입된다.
//	환경설정 파일에 
//	<context:component-scan base-package="dao,controller"></context:component-scan>
//	<bean id="userDao" class="dao.UserDaoImpl"
//	p:session-ref="sqlSession"></bean>
	@Autowired
	private SqlSession session;
	public Integer findMaxUserNo() {
		return session.selectOne("user.getMaxUserNo");
	}
	public User findByIdAndPwd(User user) {
		User usr = session.selectOne("user.getUser",user);
		return usr;
		
	}
	public void entryUser(User user) {
		Integer userNo=this.findMaxUserNo();
		if(userNo==null) userNo=0; 
		userNo=userNo+1;
		user.setUser_no(userNo);
		session.insert("user.putUser",user);
	}
	

}













