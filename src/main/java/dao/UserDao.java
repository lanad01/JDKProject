package dao;

import model.User;

public interface UserDao {
	Integer findMaxUserNo();
	void entryUser(User user);
	User findByIdAndPwd(User user);
	User findByUserId(String id);
	void updateUser(User user);
	
}
