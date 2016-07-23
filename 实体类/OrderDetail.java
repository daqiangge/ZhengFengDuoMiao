package com.prd.modules.prd.entity;


import com.prd.common.persistence.DataEntity;

/**
 * 订单详情Entity
 * @author zhenjie_shi
 * @version 2016-07-16
 */
public class OrderDetail extends DataEntity<OrderDetail> {
	
	private static final long serialVersionUID = 1L;
	private Order order;		// 订单编号
	private String number;		// 幸运号
	
	public OrderDetail() {
		super();
	}

	public OrderDetail(String id){
		super(id);
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
}