package com.prd.modules.prd.entity;

import com.prd.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 晒单Entity
 * @author zhenjie_shi
 * @version 2016-07-16
 */
public class Share extends DataEntity<Share> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private Period period;		// 期数编号
	private String image;		// 图片
	private String description;		// 描述
	
	public Share() {
		super();
	}

	public Share(String id){
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
	
	@Length(min=0, max=1000, message="图片长度必须介于 0 和 1000 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	@Length(min=0, max=1000, message="描述长度必须介于 0 和 1000 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}