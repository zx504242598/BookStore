package org.service.impl;

import java.util.List;

import org.dao.OrderDao;
import org.model.Orders;
import org.service.OrderService;

public class OrderServiceImpl implements OrderService {
	private OrderDao orderDao;
	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}
	@Override
	public Orders saveOrder(Orders order) {
		
		return orderDao.saveOrder(order);
	}
	@Override
	public List seeOrder(Integer userid) {
		return orderDao.seeOrder(userid);
	}

}
