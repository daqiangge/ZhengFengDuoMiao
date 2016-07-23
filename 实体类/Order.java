package com.prd.modules.prd.entity;

import java.math.BigDecimal;

import com.prd.modules.sys.entity.User;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 订单Entity
 * @author zhenjie_shi
 * @version 2016-07-16
 */
public class Order extends DataEntity<Order> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private Period period;		// 期数编号
	private Integer count;		// 秒杀次数
	private BigDecimal price;		// 价格
	private String number;		// 订单号
	private String status;		// 支付状态
	private String ip; 				//用户购买时的ip
	
	public Order() {
		super();
	}

	public Order(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Period getPeriod() {
		return period;
	}

	public void setPeriod(Period period) {
		this.period = period;
	}
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	@Length(min=0, max=64, message="订单号长度必须介于 0 和 64 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=1, message="支付状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
}