package com.prd.modules.prd.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.prd.modules.sys.entity.User;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 收货地址Entity
 * @author zhenjie_shi
 * @version 2016-04-27
 */
public class PrdAddress extends DataEntity<PrdAddress> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 用户编号
	private String name;		// 名称
	private String mobile;		// 手机
	private String province;		// 省
	private String city;		// 城市
	private String county;		// 区县
	private String detail;		// 详细地址
	private String isDefault;		// 默认
	
	public PrdAddress() {
		super();
	}

	public PrdAddress(String id){
		super(id);
	}
	@JsonIgnore
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=100, message="名称长度必须介于 0 和 100 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=100, message="手机长度必须介于 0 和 100 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	@Length(min=0, max=100, message="省长度必须介于 0 和 100 之间")
	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}
	
	@Length(min=0, max=100, message="城市长度必须介于 0 和 100 之间")
	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
	
	@Length(min=0, max=100, message="区县长度必须介于 0 和 100 之间")
	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}
	
	@Length(min=0, max=100, message="详细地址长度必须介于 0 和 100 之间")
	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	@Length(min=0, max=1, message="默认长度必须介于 0 和 1 之间")
	public String getIsDefault() {
		return isDefault;
	}

	public void setIsDefault(String isDefault) {
		this.isDefault = isDefault;
	}
	
}