package org.dao.impl;

import java.util.List;

import org.dao.BaseDao;
import org.dao.UserDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.User;

public class UserDapImpl extends BaseDao implements UserDao {

	@Override
	public User validateUser(String username, String password) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from User where username=? and password=?");
		query.setParameter(0, username);
		query.setParameter(1, password);
		List list=query.list();
		ts.commit();
		session.close();
		if(list.size()!=0){
			
			return (User)list.get(0); 
		}
		return null;
		
	}

	@Override
	public void registerUser(User user) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		session.save(user);
		ts.commit();
		session.close();
	}

	@Override
	public boolean findUser(String username) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from User where username=?");
		query.setParameter(0, username);
		List list=query.list();
		ts.commit();
		session.close();
		if(list.size()==1){
			return true;
		}
		
		return false;
	}

	@Override
	public void updateUser(User user) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		session.update(user);
		ts.commit();
		session.close();
	}

}
