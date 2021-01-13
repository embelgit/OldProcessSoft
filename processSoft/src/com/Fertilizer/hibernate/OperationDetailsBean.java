package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class OperationDetailsBean implements Serializable {
	
	private Long pkOperationDetailsId;
	private String operationName;
	private Date insertDate;
	
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
	public Long getPkOperationDetailsId() {
		return pkOperationDetailsId;
	}
	public void setPkOperationDetailsId(Long pkOperationDetailsId) {
		this.pkOperationDetailsId = pkOperationDetailsId;
	}
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	
	public OperationDetailsBean(Long pkOperationDetailsId, String expenseName,
			Date insertDate, Long userId, String username, Long shopId, String shopName) {
		super();
		this.pkOperationDetailsId = pkOperationDetailsId;
		this.operationName = operationName;
		this.insertDate = insertDate;
		this.userId = userId;
		this.username = username;
		this.shopId = shopId;
		this.shopName = shopName;
	}
	public OperationDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "OperationDetailsBean [pkOperationDetailsId=" + pkOperationDetailsId + ", operationName=" + operationName
				+ ", insertDate=" + insertDate + ", userId=" + userId + ", username=" + username + ", shopId=" + shopId
				+ ", shopName=" + shopName + "]";
	}

}
