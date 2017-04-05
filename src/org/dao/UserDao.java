package org.dao;

import org.model.User;

public interface UserDao {
	public User validateUser(String username,String password);
	public void registerUser(User user);
	public boolean findUser(String username);
	public void updateUser(User user);
}
