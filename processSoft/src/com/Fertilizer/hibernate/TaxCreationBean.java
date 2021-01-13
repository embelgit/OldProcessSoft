package com.Fertilizer.hibernate;

import java.io.Serializable;

public class TaxCreationBean implements Serializable{
	
	private long txId;
	private String taxType;
	private double taxPercentage;
	
	private Long userId;
	private String username;
	private Long shopId;
	private String shopName;
	
	public Long getUserId() {
		return userId;
	}
	public void setUserId(Long userId) {
		this.userId = userId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
	public long getTxId() {
		return txId;
	}
	public void setTxId(long txId) {
		this.txId = txId;
	}
	public String getTaxType() {
		return taxType;
	}
	public void setTaxType(String taxType) {
		this.taxType = taxType;
	}
	public double getTaxPercentage() {
		return taxPercentage;
	}
	public void setTaxPercentage(double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}
	
	
	
	
	
	public TaxCreationBean(long txId, String taxType, double taxPercentage, Long userId, String username, Long shopId, String shopName) {
		super();
		this.txId = txId;
		this.taxType = taxType;
		this.taxPercentage = taxPercentage;
		this.userId = userId;
		this.username = username;
		this.shopId = shopId;
		this.shopName = shopName;
	}
	
	public TaxCreationBean() {
		super();
	}
	@Override
	public String toString() {
		return "TaxCreationBean [txId=" + txId + ", taxType=" + taxType + ", taxPercentage=" + taxPercentage
				+ ", userId=" + userId + ", username=" + username + ", shopId=" + shopId + ", shopName=" + shopName
				+ "]";
	}
	
}
