package org.service;

import java.util.List;

import org.model.Orders;

public interface OrderService {
	public Orders saveOrder(Orders order);//���涩��
	public List seeOrder(Integer userid);//�鿴���ж���
}
