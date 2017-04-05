package org.test;

import org.model.User;
import org.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext	context=new FileSystemXmlApplicationContext("/WebRoot/WEB-INF/classes/applicationContext.xml");
		UserService userService=(UserService) context.getBean("UserService");
		User user=new User();
		user.setUsername("aaaaaaa");
		user.setPassword("123123213");
		user.setAddress("111111111111111");
		user.setEmail("123333333");
		userService.registerUser(user);
		user.setEmail("22222222222");
		userService.updateUser(user);
		
		
		
		
		/*        OrderService orderService=(OrderService) context.getBean("OrderService");
        List orderList=orderService.seeOrder(1);
        Iterator it=orderList.iterator();
        while(it.hasNext()){
        	
        	Orders orders=(Orders) it.next();
        	System.out.println(orders.getOrderid()+""+orders.getUser().getUserid());
            Set orderitems=orders.getOrderitems();
            Iterator it1=orderitems.iterator();
            while(it1.hasNext()){
            	Orderitem orderitem=(Orderitem) it1.next();
            	Book book=orderitem.getBook();
            System.out.println(book.getBookname());
            }
        }*/
		/*		BookService bookService=(BookService)context.getBean("BookService");
		List books=bookService.getLatestBooks();
		Iterator it=books.iterator();
		while(it.hasNext()){
			Book book=(Book)it.next();
			System.out.println(book.getPdate());
		}*/
/*		List list=BookService.getRequiredBookbyHql("from Book where bookname like '%C%'");
		Iterator it= list.listIterator();
		while(it.hasNext()){
			Book book=(Book)it.next();
			System.out.println(book.getBookname()+"   "+book.getPrice());
			
		}*/
/*		
		CatalogService catalogService=(CatalogService) context.getBean("CatalogService");	
		List list=catalogService.getAllCatalogs();
		Catalog catalog=(Catalog)list.get(0);*/
/*		Set set=catalog.getBooks();
		System.out.println(set.size());*/
		/*Iterator it=set.iterator();
		while(it.hasNext()){
			Book book=(Book)it.next();
			System.out.println(book.getBookname());
		}*/
		
	}

}
