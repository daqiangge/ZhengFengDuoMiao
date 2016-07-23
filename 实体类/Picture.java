package com.prd.modules.prd.entity;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 图片Entity
 * @author zhenjie_shi
 * @version 2016-06-06
 */
public class Picture extends DataEntity<Picture> {
	
	private static final long serialVersionUID = 1L;
	private String targetid;		// 目标编号
	private String path;		// 路径
	
	public Picture() {
		super();
	}

	public Picture(String id){
		super(id);
	}

	@Length(min=0, max=64, message="目标编号长度必须介于 0 和 64 之间")
	public String getTargetid() {
		return targetid;
	}

	public void setTargetid(String targetid) {
		this.targetid = targetid;
	}
	
	@Length(min=0, max=255, message="路径长度必须介于 0 和 255 之间")
	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
}