package com.prd.modules.prd.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.prd.common.persistence.DataEntity;
import com.prd.common.utils.StringUtils;

/**
 * 商品Entity
 * @author zhenjie_shi
 * @version 2016-07-16
 */
public class Product extends DataEntity<Product> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 名称
	private String image;		// 图片
	private Integer leastCount;		// 起购数量
	private BigDecimal price;		// 商品价格
	private List<String> imageList;//图片集合
	private String type;				//商品类型 1为疯秒区 2为狂战区 3为圆梦区
	
	public Product() {
		super();
	}

	public Product(String id){
		super(id);
	}

	@Length(min=0, max=300, message="名称长度必须介于 0 和 300 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=2000, message="图片长度必须介于 0 和 2000 之间")
	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	
	public Integer getLeastCount() {
		return leastCount;
	}

	public void setLeastCount(Integer leastCount) {
		this.leastCount = leastCount;
	}
	
	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public List<String> getImageList() {
		imageList=new ArrayList<String>();
		if(StringUtils.isNotBlank(image)){
			String[] strArray=image.split("\\|");
			for (String string : strArray) {
				if(StringUtils.isNotBlank(string)){
					imageList.add(string);
				}
			}
		}
		return imageList;
	}

	public void setImageList(List<String> imageList) {
		this.imageList = imageList;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
}