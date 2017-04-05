package org.action;

import java.util.List;
import java.util.Map;

import org.model.Book;
import org.service.BookService;
import org.service.CatalogService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class BookAction extends ActionSupport {
	private CatalogService catalogService;
	private BookService bookService;
	private String bookname;
	private String bookid;
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	private Integer catalogid;

	public void setCatalogid(Integer catalogid) {
		this.catalogid = catalogid;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	
	public void setCatalogService(CatalogService catalogService) {
		this.catalogService = catalogService;
	}
	
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public String catalogs() throws Exception{
		List catalogs=catalogService.getAllCatalogs();
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("catalogs", catalogs);
		return SUCCESS;
	}
	public String searchBook() throws Exception{
		if(bookname!=null&&bookname.length()!=0){
			String hql=new String("from Book where bookname like '%"+bookname+"%'");
			List books=bookService.getRequiredBookbyHql(hql);
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("books", books);
			return SUCCESS;
		}
		return NONE;
	}
	public String readBook() throws Exception{
		int id=Integer.parseInt(bookid);
		if(bookid!=null&&bookid.length()!=0){
		Book book=bookService.getBookbyId(id);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("book", book);
		return SUCCESS;
		}
		return NONE;
	}
	public String browseBook() throws Exception{
		List books=bookService.getBookbyCatalogid(catalogid);
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("books", books);
		return SUCCESS;
	}
	public String latestBooks() throws Exception{
		List books=bookService.getLatestBooks();
		if(books!=null&&books.size()!=0){
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("books", books);
		return SUCCESS;
		}
		return NONE;
	}
}
	
