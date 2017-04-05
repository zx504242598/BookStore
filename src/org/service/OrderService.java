package org.service;

import java.util.List;

import org.model.Orders;

public interface OrderService {
	public Orders saveOrder(Orders order);//保存订单
	public List seeOrder(Integer userid);//查看所有订单
}
