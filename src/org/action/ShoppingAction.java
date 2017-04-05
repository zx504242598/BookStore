package org.action;

import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.model.Book;
import org.model.Orderitem;
import org.model.Orders;
import org.model.User;
import org.service.BookService;
import org.service.OrderService;
import org.vo.Cart;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ShoppingAction extends ActionSupport {
	private int quantity;
	private Integer bookid;

	private BookService bookService;
	private OrderService orderService;
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public void setBookid(Integer bookid) {
		this.bookid = bookid;
	}
	public void setBookService(BookService bookService) {
		this.bookService = bookService;
	}
	public String addToCart() throws Exception{
		Book book=bookService.getBookbyId(bookid);
		Orderitem orderitem=new Orderitem();
		orderitem.setBook(book);
		orderitem.setQuantity(quantity);
		Map session=(Map)ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		if(cart==null){
			 cart=new Cart();
		}
		cart.addBook(bookid, orderitem);
		session.put("cart",cart);
		return SUCCESS;
	}
	public String updateCart() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		cart.updateCart(bookid, quantity);
		session.put("cart", cart);
		return SUCCESS;
	}
	public String deleteCart() throws Exception{
		Map session=(Map)ActionContext.getContext().getSession();
		Cart cart=(Cart)session.get("cart");
		cart.getItems().remove(bookid);
		if(cart.getItems().size()==0){
			session.remove("cart");
		}else session.put("cart", cart);
		return SUCCESS;
	}
	public String checkout() throws Exception{
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		Cart cart=(Cart)session.get("cart");
		if(user==null||cart==null){
			return ERROR;
		}
		Orders order=new Orders();
		order.setOrderdate(new Date());
		order.setUser(user);
		order.setAddress(user.getAddress());
		for(Iterator it= cart.getItems().values().iterator();it.hasNext();){
			Orderitem orderitem=(Orderitem)it.next();
			orderitem.setOrders(order);
			order.getOrderitems().add(orderitem);
		}
		orderService.saveOrder(order);
		System.out.println("µÿ÷∑:"+order.getAddress());
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("order", order);
		session.remove("cart");
		return SUCCESS;
	}
	public String alreadyBuy() throws Exception{
		Map session=ActionContext.getContext().getSession();
		User user=(User)session.get("user");
		if(user!=null){
	    List orderList=(List)orderService.seeOrder(user.getUserid());
	    Map request=(Map)ActionContext.getContext().get("request");
	    request.put("orderList", orderList);
		return SUCCESS;
	    	}
		return ERROR;
	}
}
