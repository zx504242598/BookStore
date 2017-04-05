package org.dao;

import java.util.List;

import org.model.Orders;

public interface OrderDao {
	public Orders saveOrder(Orders order);
	public List seeOrder(Integer userid);
}
