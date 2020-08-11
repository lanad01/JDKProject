package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.User;
@Repository
public class UserDaoImpl implements UserDao {
	@Autowired  //종속객체는 UserDaoImpl이다 거기에 Repository 붙이면 SqlSession이 주입된다.
//	환경설정 파일에 
//	<context:component-scan base-package="dao,controller"></context:component-scan>
//	<bean id="userDao" class="dao.UserDaoImpl"
//	p:session-ref="sqlSession"></bean>
	private SqlSession session;
	public User findByIdAndPwd(User user) {
		User usr = session.selectOne("user.getUser",user);
		return usr;
		
	}
	public void entryUser(User user) {
		session.insert("user.putUser",user);
	}

}













