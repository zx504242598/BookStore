package org.dao;

import java.util.List;

import org.model.Book;

public interface BookDao {
	public List getBookbyCatalogid(Integer catalogid);//�������id�õ����������ͼ��
	public int getTotalbyCatalog(Integer catalogid);//�õ�ĳ�����͵�ͼ�����Ŀ
	public List getRequiredBookbyHql(String hql);//�����鼮
	public Book getBookbyId(Integer bookid);//����ͼ��id�õ�ͼ��
	public List getLatestBooks();//����ʱ���Ⱥ�����ͼ��
}
