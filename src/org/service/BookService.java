package org.service;

import java.util.List;

import org.model.Book;

public interface BookService {
	public List getBookbyCatalogid(Integer catalogid);//根据类别id得到该类的所有图书
	public int getTotalbyCatalog(Integer catalogid);//得到某种类型的图书的数目
	public List getRequiredBookbyHql(String hql);//搜索图书
	public Book getBookbyId(Integer bookid);//根据图书id得到图书
	public List getLatestBooks();//根据时间先后排序图书
}