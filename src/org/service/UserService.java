package org.service;

import org.model.User;

public interface UserService {
	public User validateUser(String username,String password);//��֤�û����������Ƿ���ȷ
	public void registerUser(User user);//ע���û�
	public boolean findUser(String username);//�����û�����ѯ���û��Ƿ��Ѿ�����
	public void updateUser(User user);//�����û���Ϣ
}
