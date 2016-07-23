package com.prd.modules.prd.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.prd.modules.sys.entity.User;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 意见反馈Entity
 * @author zhenjie_shi
 * @version 2016-04-27
 */
public class PrdFeedback extends DataEntity<PrdFeedback> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private String mobile;		// 手机号码
	private String content;		// 内容
	
	public PrdFeedback() {
		super();
	}

	public PrdFeedback(String id){
		super(id);
	}
	
	@JsonIgnore
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=50, message="手机号码长度必须介于 0 和 50 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=1000, message="内容长度必须介于 0 和 1000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
}