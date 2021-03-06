package com.simland.core.module.order.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.simland.core.base.Utils;
import com.simland.core.module.order.entity.Order;
import com.simland.core.module.order.entity.OrderItem;
import com.simland.core.module.order.entity.OrderStatus;
import com.simland.core.module.order.mapper.OrderItemMapper;
import com.simland.core.module.order.mapper.OrderMapper;
import com.simland.core.module.order.service.IOrderService;
import com.simland.core.module.shop.entity.Inventory;
import com.simland.core.module.shop.mapper.InventoryMapper;

@Service("orderService")
@Transactional(readOnly = true)
public class OrderServiceImpl implements IOrderService {

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private OrderItemMapper orderItemMapper;

	@Autowired
	private InventoryMapper inventoryMapper;

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer insertOrder(Order order) {
		return orderMapper.insertOrder(order);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer updateOrder(Order order) {
		return orderMapper.updateOrder(order);
	}

	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer deleteOrder(Integer id) {
		return orderMapper.deleteOrder(id);
	}

	public Order getOrder(Map<String, Object> param) {
		return (Order) orderMapper.getOrder(param);
	}

	public List<Order> getOrderList(Map<String, Object> param) {
		return orderMapper.getOrderList(param);
	}

	public Integer getOrderCount(Map<String, Object> param) {
		return (Integer) orderMapper.getOrderCount(param);
	}

	public List<Order> getSplitOrderList(Map<String, Object> param) {
		return orderMapper.getSplitOrderList(param);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer insertOrder(Order order, List<OrderItem> orderItems) {
		return null;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, readOnly = false)
	public Integer insertOrder(List<Order> orders) {

		if (orders == null || orders.size() == 0)
			return -1;

		ReentrantLock reentrantLock = new ReentrantLock();
		reentrantLock.lock();

		for (Order order : orders) {
			orderMapper.insertOrder(order);

			for (OrderItem orderItem : order.getOrderItems()) {
				orderItem.setOid(order.getId());

				Inventory inventory = new Inventory();
				inventory.setId(orderItem.getIid());
				inventory.setNums(orderItem.getBuyNum());
				inventoryMapper.updateInventoryNums(inventory);
				inventory = null;
			}

			orderItemMapper.insertBatchOrderItem(order.getOrderItems());

		}

		reentrantLock.unlock();

		return 1;
	}

	@Override
	public List<Order> getSplitOrderList(Integer uid, Map<String, Object> param) {

		if (Utils.isObjectEmpty(uid))
			return null;

		if (param == null)
			param = new HashMap<String, Object>();

		param.put("uid", uid);

		return orderMapper.getSplitOrderList(param);
	}

	@Override
	public Order getOrder(Integer id) {
		if (id == null || id == 0)
			return null;

		Map<String, Object> param = new HashMap<String, Object>();
		param.put("id", id);
		Order order = orderMapper.getOrder(param);
		param = null;
		return order;
	}

	@Override
	@Transactional(readOnly = false)
	public Integer cancelOrder(Order order) {

		ReentrantLock reentrantLock = new ReentrantLock();
		reentrantLock.lock();

		Order upOrder = new Order();
		upOrder.setId(order.getId());
		upOrder.setOrderStatus(OrderStatus.CANCEL.getId());
		int id = orderMapper.updateOrder(upOrder);

		// 还原库存
		for (OrderItem oi : order.getOrderItems()) {
			if (oi.getIid() == null || oi.getBuyNum() == null)
				continue;

			Inventory inventory = new Inventory();
			inventory.setId(oi.getIid());
			inventory.setNums(-oi.getBuyNum());
			inventoryMapper.updateInventoryNums(inventory);
		}

		reentrantLock.unlock();

		return id;
	}
}
