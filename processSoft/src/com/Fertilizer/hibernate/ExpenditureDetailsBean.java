package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class ExpenditureDetailsBean implements Serializable{

	private Long pkExpenseDetailsId;
	private String expenseName;
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
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Long getPkExpenseDetailsId() {
		return pkExpenseDetailsId;
	}
	public void setPkExpenseDetailsId(Long pkExpenseDetailsId) {
		this.pkExpenseDetailsId = pkExpenseDetailsId;
	}
	public String getExpenseName() {
		return expenseName;
	}
	public void setExpenseName(String expenseName) {
		this.expenseName = expenseName;
	}
	
	public ExpenditureDetailsBean(Long pkExpenseDetailsId, String expenseName,
			Date insertDate, Long userId, String username, Long shopId, String shopName) {
		super();
		this.pkExpenseDetailsId = pkExpenseDetailsId;
		this.expenseName = expenseName;
		this.insertDate = insertDate;
		this.userId = userId;
		this.username = username;
		this.shopId = shopId;
		this.shopName = shopName;
	}
	public ExpenditureDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "ExpenditureDetailsBean [pkExpenseDetailsId=" + pkExpenseDetailsId + ", expenseName=" + expenseName
				+ ", insertDate=" + insertDate + ", userId=" + userId + ", username=" + username + ", shopId=" + shopId
				+ ", shopName=" + shopName + "]";
	}

	
	
}
