package com.prd.modules.prd.entity;

import com.prd.modules.sys.entity.User;

import com.prd.common.persistence.DataEntity;

/**
 * 秒杀币Entity
 * @author zhenjie_shi
 * @version 2016-04-28
 */
public class PrdSkcoin extends DataEntity<PrdSkcoin> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private Integer coin;		// 秒杀币数量
	
	public PrdSkcoin() {
		super();
	}

	public PrdSkcoin(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public Integer getCoin() {
		return coin;
	}

	public void setCoin(Integer coin) {
		this.coin = coin;
	}
	
}