package com.prd.modules.prd.entity;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 任务Entity
 * @author zhenjie_shi
 * @version 2016-04-28
 */
public class PrdTask extends DataEntity<PrdTask> {
	
	private static final long serialVersionUID = 1L;
	private String taskname;		// 任务名
	private String taskcontent;		// 任务详情
	
	public PrdTask() {
		super();
	}

	public PrdTask(String id){
		super(id);
	}

	@Length(min=0, max=1000, message="任务名长度必须介于 0 和 1000 之间")
	public String getTaskname() {
		return taskname;
	}

	public void setTaskname(String taskname) {
		this.taskname = taskname;
	}
	
	@Length(min=0, max=1000, message="任务详情长度必须介于 0 和 1000 之间")
	public String getTaskcontent() {
		return taskcontent;
	}

	public void setTaskcontent(String taskcontent) {
		this.taskcontent = taskcontent;
	}
	
}