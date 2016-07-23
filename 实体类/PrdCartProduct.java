package com.prd.modules.prd.entity;


import com.prd.common.persistence.DataEntity;

/**
 * 购物车商品Entity
 * @author zhenjie_shi
 * @version 2016-05-25
 */
public class PrdCartProduct extends DataEntity<PrdCartProduct> {
	
	private static final long serialVersionUID = 1L;
	private PrdCart cart;		// 购物车编号
//	private PrdAdded prdAdded;		// 上架商品编号
	private Integer count;		// 数量
	
	public PrdCartProduct() {
		super();
	}

	public PrdCartProduct(String id){
		super(id);
	}

	public PrdCart getCart() {
		return cart;
	}

	public void setCart(PrdCart cart) {
		this.cart = cart;
	}
	
//	public PrdAdded getPrdAdded() {
//		return prdAdded;
//	}
//
//	public void setPrdAdded(PrdAdded prdAdded) {
//		this.prdAdded = prdAdded;
//	}
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
}