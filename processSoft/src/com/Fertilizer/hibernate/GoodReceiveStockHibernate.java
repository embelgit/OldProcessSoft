package com.Fertilizer.hibernate;

import java.util.Date;

public class GoodReceiveStockHibernate {
	
	
	private Long pkGoodReceiveStockId;
	private Long fkProductId;
	private String productName;
	private Long userId;
	private String userName;
	private Long shopId;
	private String shopName;
	private Date lastUpdateDate;
	public Long getPkGoodReceiveStockId() {
		return pkGoodReceiveStockId;
	}
	public void setPkGoodReceiveStockId(Long pkGoodReceiveStockId) {
		this.pkGoodReceiveStockId = pkGoodReceiveStockId;
	}
	public Long getFkProductId() {
		return fkProductId;
	}
	public void setFkProductId(Long fkProductId) {
		this.fkProductId = fkProductId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Long getShopId() {
		return shopId;
	}
	public void setShopId(Long shopId) {
		this.shopId = shopId;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

}
