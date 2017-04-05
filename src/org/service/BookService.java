package org.service;

import java.util.List;

import org.model.Book;

public interface BookService {
	public List getBookbyCatalogid(Integer catalogid);//�������id�õ����������ͼ��
	public int getTotalbyCatalog(Integer catalogid);//�õ�ĳ�����͵�ͼ�����Ŀ
	public List getRequiredBookbyHql(String hql);//����ͼ��
	public Book getBookbyId(Integer bookid);//����ͼ��id�õ�ͼ��
	public List getLatestBooks();//����ʱ���Ⱥ�����ͼ��
}