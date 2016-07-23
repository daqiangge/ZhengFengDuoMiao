package com.prd.modules.prd.entity;

import com.prd.modules.sys.entity.User;
import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;

/**
 * 消息Entity
 * @author zhenjie_shi
 * @version 2016-05-03
 */
public class PrdMessage extends DataEntity<PrdMessage> {
	
	private static final long serialVersionUID = 1L;
	private User user;		// 目标编号
	private String belongId;		// 所属编号
	private String title;		// 标题
	private String content;		// 内容
	private String isread;		// 已读
	private String type;		// 消息类型
	
	public PrdMessage() {
		super();
	}

	public PrdMessage(String id){
		super(id);
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	@Length(min=0, max=64, message="所属编号长度必须介于 0 和 64 之间")
	public String getBelongId() {
		return belongId;
	}

	public void setBelongId(String belongId) {
		this.belongId = belongId;
	}
	
	@Length(min=0, max=255, message="标题长度必须介于 0 和 255 之间")
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	@Length(min=0, max=2000, message="内容长度必须介于 0 和 2000 之间")
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	@Length(min=0, max=1, message="已读长度必须介于 0 和 1 之间")
	public String getIsread() {
		return isread;
	}

	public void setIsread(String isread) {
		this.isread = isread;
	}
	
	@Length(min=0, max=1, message="消息类型长度必须介于 0 和 1 之间")
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}