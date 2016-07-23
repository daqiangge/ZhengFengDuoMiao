package com.prd.modules.prd.entity;

import java.math.BigDecimal;

import com.prd.modules.sys.entity.User;
import com.prd.common.persistence.DataEntity;

/**
 * 秒杀充值王Entity
 * @author zhenjie_shi
 * @version 2016-07-18
 */
public class Sort extends DataEntity<Sort> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private Integer seckillingCount;		// 秒杀次数
	private BigDecimal amount;		// 充值金额
	private String type;	//1为秒杀王 2 为充值王
	
	public Sort() {
		super();
	}

	public Sort(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getSeckillingCount() {
		return seckillingCount;
	}

	public void setSeckillingCount(Integer seckillingCount) {
		this.seckillingCount = seckillingCount;
	}
	
	public BigDecimal getAmount() {
		return amount;
	}

	public void setAmount(BigDecimal amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}