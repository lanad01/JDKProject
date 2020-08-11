package dao;

import model.User;

public interface UserDao {
	void entryUser(User user);
	User findByIdAndPwd(User user);
}
