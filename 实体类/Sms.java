package com.prd.modules.prd.entity;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 单表生成Entity
 * @author samson
 * @version 2016-02-04
 */
public class Sms extends DataEntity<Sms> {
	
	private static final long serialVersionUID = 1L;
	private String mobile;		// 手机号码
	private String code; 	//随机码
	private String content;		// 内容
	private String result;		// 返回值
	private String type;
	private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Sms() {
		super();
	}

	public Sms(String id){
		super(id);
	}
	public Sms(String mobile,String code){
		this.mobile=mobile;
		this.code=code;
	}
	@Length(min=0, max=20, message="手机号码长度必须介于 0 和 20 之间")
	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	
	
	
	@Length(min=0, max=500, message="内容长度必须介于 0 和 500 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=10, message="返回值长度必须介于 0 和 10 之间")
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
}