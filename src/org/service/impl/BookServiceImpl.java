package org.service.impl;

import java.util.List;

import org.dao.BookDao;
import org.model.Book;
import org.service.BookService;

public class BookServiceImpl implements BookService {
	private BookDao bookDao;
	public void setBookDao(BookDao bookDao) {
		this.bookDao = bookDao;
	}
	@Override
	public List getBookbyCatalogid(Integer catalogid) {
		
		return bookDao.getBookbyCatalogid(catalogid);
	}
	@Override
	public int getTotalbyCatalog(Integer catalogid) {
		
		return bookDao.getTotalbyCatalog(catalogid);
	}
	@Override
	public List getRequiredBookbyHql(String hql) {
		return bookDao.getRequiredBookbyHql(hql);
	}
	@Override
	public Book getBookbyId(Integer bookid) {
		
		return bookDao.getBookbyId(bookid);
	}
	@Override
	public List getLatestBooks() {
		
		return bookDao.getLatestBooks();
	}

}
