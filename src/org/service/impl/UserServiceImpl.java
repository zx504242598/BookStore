package org.service.impl;

import org.dao.UserDao;
import org.model.User;
import org.service.UserService;

public class UserServiceImpl implements UserService {
	private UserDao userDao;
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public User validateUser(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.validateUser(username, password);
	}

	@Override
	public void registerUser(User user) {
		// TODO Auto-generated method stub
		userDao.registerUser(user);
	}

	@Override
	public boolean findUser(String username) {
		// TODO Auto-generated method stub
		return userDao.findUser(username);
	}

	@Override
	public void updateUser(User user) {
		userDao.updateUser(user);
	}

}
