package com.prd.modules.prd.entity;

import com.prd.modules.sys.entity.User;

import com.prd.common.persistence.DataEntity;

/**
 * 购物车Entity
 * @author zhenjie_shi
 * @version 2016-05-09
 */
public class PrdCart extends DataEntity<PrdCart> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	
	public PrdCart() {
		super();
	}

	public PrdCart(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
}