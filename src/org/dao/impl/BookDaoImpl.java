package org.dao.impl;

import java.util.Iterator;
import java.util.List;

import org.dao.BaseDao;
import org.dao.BookDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Book;

public class BookDaoImpl extends BaseDao  implements BookDao {

	@Override
	public List getBookbyCatalogid(Integer catalogid) {
		Session session =getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Book where catalogid=?");
		query.setParameter(0, catalogid);
		List books=query.list();
		ts.commit();
		session.close();
		return books;
	}

	@Override
	public int getTotalbyCatalog(Integer catalogid) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Book where catalogid=?");
		query.setParameter(0, catalogid);
		List books=query.list();
		ts.commit();
		session.close();
		return books.size();
	}

	@Override
	public List getRequiredBookbyHql(String hql) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery(hql);
		List books=query.list();
		ts.commit();
		session.close();
		return books;
	}

	@Override
	public Book getBookbyId(Integer bookid) {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Book where bookid=?");
		query.setParameter(0, bookid);
		List book=query.list();
		ts.commit();
		session.close();
		return (Book)book.get(0);
	}

	@Override
	public List getLatestBooks() {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Book order by pdate desc");
		query.setMaxResults(5);
		List list=query.list();
		ts.commit();
		session.close();

		return list;
		
	}

}
