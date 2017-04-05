package org.dao.impl;

import java.util.List;

import org.dao.BaseDao;
import org.dao.OrderDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Orders;

public class OrderDaoImpl extends BaseDao implements OrderDao {

	@Override
	public Orders saveOrder(Orders order) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		session.save(order);
		ts.commit();
		session.close();
		return order;
	}

	@Override
	public List seeOrder(Integer userid) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
	    Query query=session.createQuery("from Orders where userid=? order by orderdate desc");
	    query.setParameter(0, userid);
	    List orders=query.list();
	    ts.commit();
	    /*session.close();*/
		return orders;
	}

}
