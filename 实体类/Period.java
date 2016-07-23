package com.prd.modules.prd.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.prd.modules.sys.entity.User;
import com.prd.common.persistence.DataEntity;

/**
 * 期数Entity
 * @author zhenjie_shi
 * @version 2016-07-16
 */
public class Period extends DataEntity<Period> {
	
	private static final long serialVersionUID = 1L;
	private Product product;		// 商品编号
	private String number;		// 期数
	private User user;		// 中奖用户编号
	private String ip;		// 中奖用户ip
	private String address;		// 中奖用户地址
	private String status;		// 状态
	private String statusArray;
	private Integer userCount;//中奖人本次秒杀次数、将该用户所有的购买次数相加
	private Integer allCount;		// 秒杀次数
	private Integer currentCount;		// 当前购买次数
	private OrderDetail orderDetail;		// 中奖幸运号编号
	private Date lotteryTime;	//开奖时间
	private Date lastLotteryTime;//上期开奖时间
	private String isMain;//是否为首页 1为首页 0为列表
	
	public Period() {
		super();
	}

	public Period(String id){
		super(id);
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	@Length(min=0, max=255, message="期数长度必须介于 0 和 255 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="中奖用户ip长度必须介于 0 和 64 之间")
	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}
	
	@Length(min=0, max=64, message="中奖用户地址长度必须介于 0 和 64 之间")
	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	@Length(min=0, max=1, message="状态长度必须介于 0 和 1 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=11, message="秒杀次数长度必须介于 0 和 11 之间")
	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
	}
	
	@Length(min=0, max=11, message="当前购买次数长度必须介于 0 和 11 之间")
	public Integer getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(Integer currentCount) {
		this.currentCount = currentCount;
	}
	
	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public String getIsMain() {
		return isMain;
	}

	public void setIsMain(String isMain) {
		this.isMain = isMain;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLotteryTime() {
		return lotteryTime;
	}

	public void setLotteryTime(Date lotteryTime) {
		this.lotteryTime = lotteryTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getLastLotteryTime() {
		return lastLotteryTime;
	}

	public void setLastLotteryTime(Date lastLotteryTime) {
		this.lastLotteryTime = lastLotteryTime;
	}

	public Integer getUserCount() {
		return userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public String getStatusArray() {
		return statusArray;
	}

	public void setStatusArray(String statusArray) {
		this.statusArray = statusArray;
	}
	
}