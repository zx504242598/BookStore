package org.vo;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.model.Book;
import org.model.Orderitem;

public class Cart {
	private Map<Integer,Orderitem> items;
	public Cart(){
		if(items==null){
			items=new HashMap<Integer,Orderitem>();
		}
	}
	public void addBook(Integer bookid,Orderitem orderitem){
		//是否存在，如果存在，更改数量
		//如果不存在，添加到集合
		if(items.containsKey(bookid)){
		Orderitem _orderitem=(Orderitem)items.get(bookid);
		
		orderitem.setQuantity((_orderitem.getQuantity()+orderitem.getQuantity()));
		
		items.put(bookid, orderitem);
		
		}else{
				items.put(bookid, orderitem);
		}
	}
	//更新购物车书籍数量
	public void updateCart(Integer bookid,int quantity){
		Orderitem orderitem=(Orderitem)items.get(bookid);
		orderitem.setQuantity(quantity);
		
		items.put(bookid, orderitem);
	}
	//计算总价格
	public int getTotalPrice(){
		int totalPrice=0;
		for(Iterator it=items.values().iterator();it.hasNext();){
			Orderitem orderitem=(Orderitem)it.next();
			Book book=orderitem.getBook();
			int quantity=orderitem.getQuantity();
			totalPrice+=book.getPrice()*quantity;
		}
		return totalPrice;
		
	}
	public Map<Integer, Orderitem> getItems() { 
		return items;
	}
	public void setItems(Map<Integer, Orderitem> items) {
		this.items = items;
	}
	
}
