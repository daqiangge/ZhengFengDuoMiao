package com.prd.modules.prd.entity;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.prd.app.common.utils.AppImageUtil;
import com.prd.common.persistence.DataEntity;
import com.prd.common.utils.StringUtils;

/**
 * 单表生成Entity
 * @author samson
 * @version 2016-02-20
 */
public class AppPicture extends DataEntity<AppPicture> {
	
	private static final long serialVersionUID = 1L;
	private String type;		// 类别
	private String path;		// 路径
	private String title;		// 标题
	private String description;		// 描述
	private Integer sort;		// 排序
	private String target;		// 目标
	
	public AppPicture() {
		super();
	}

	public AppPicture(String id){
		super(id);
	}

	@Length(min=0, max=3, message="类别长度必须介于 0 和 3 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@JsonIgnore
	public String getPath() {
		return path;
	}
	public String getAppPath() {
		if(StringUtils.isNoneBlank(path)){
			return AppImageUtil.getAppImagePath(path);
		}
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	
	@Length(min=0, max=100, message="标题长度必须介于 0 和 100 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}
	
	@Length(min=0, max=1000, message="目标长度必须介于 0 和 1000 之间")
	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}