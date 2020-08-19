package dao;

import model.User;

public interface LoginDao {
	User findByIdAndPwd(User user);
}
