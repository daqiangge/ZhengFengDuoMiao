package com.prd.modules.prd.entity;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 首页轮播信息Entity
 * @author zhenjie_shi
 * @version 2016-07-11
 */
public class IndexMessage extends DataEntity<IndexMessage> {
	
	private static final long serialVersionUID = 1L;
	private String belongId;		// 所属编号
	private String message;		// 信息
	private Integer count;//数量
	
	public IndexMessage() {
		super();
	}

	public IndexMessage(String id){
		super(id);
	}

	@Length(min=0, max=64, message="所属编号长度必须介于 0 和 64 之间")
	public String belongId() {
		return belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
	}
	
	@Length(min=0, max=255, message="信息长度必须介于 0 和 255 之间")
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}