package org.dao.impl;

import java.util.List;

import org.dao.BaseDao;
import org.dao.CatalogDao;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class CatalogDaoImpl extends BaseDao implements CatalogDao {

	@Override
	public List getAllCatalogs() {
		Session session=getSession();
		Transaction ts=session.beginTransaction();
		Query query=session.createQuery("from Catalog");
		List catalogs=query.list();
		ts.commit();
		session.close();
		return catalogs;
	}

}
