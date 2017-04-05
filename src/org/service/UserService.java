package org.service;

import org.model.User;

public interface UserService {
	public User validateUser(String username,String password);//验证用户名和密码是否正确
	public void registerUser(User user);//注册用户
	public boolean findUser(String username);//根据用户名查询该用户是否已经存在
	public void updateUser(User user);//更新用户信息
}
