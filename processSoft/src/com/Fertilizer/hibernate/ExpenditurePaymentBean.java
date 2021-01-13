package com.Fertilizer.hibernate;

import java.util.Date;

public class ExpenditurePaymentBean {

	private Long pkExpPaymentId;
	private Long txId;
	private Long fkExpDetailId;
	private String serviceProvider;
	private Long contactNumber;
	private String accountantName;
	private Double expcredit;
	private Double expDebit;
	private Double totalAmount;
	private Date insertDate;
	
	
	private Long userId;
	private String username;
	private Long shopId;
	private String shopName;
	
	public Long getTxId() {
		return txId;
	}
	public void setTxId(Long txId) {
		this.txId = txId;
	}
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
	//For Mapping
	private ExpenditureDetailsBean expenditureDetailsBean ;
	
	
	
	public ExpenditureDetailsBean getExpenditureDetailsBean() {
		return expenditureDetailsBean;
	}
	public void setExpenditureDetailsBean(
			ExpenditureDetailsBean expenditureDetailsBean) {
		this.expenditureDetailsBean = expenditureDetailsBean;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Long getPkExpPaymentId() {
		return pkExpPaymentId;
	}
	public void setPkExpPaymentId(Long pkExpPaymentId) {
		this.pkExpPaymentId = pkExpPaymentId;
	}
	public Long getFkExpDetailId() {
		return fkExpDetailId;
	}
	public void setFkExpDetailId(Long fkExpDetailId) {
		this.fkExpDetailId = fkExpDetailId;
	}
	public String getServiceProvider() {
		return serviceProvider;
	}
	public void setServiceProvider(String serviceProvider) {
		this.serviceProvider = serviceProvider;
	}
	public Long getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(Long contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getAccountantName() {
		return accountantName;
	}
	public void setAccountantName(String accountantName) {
		this.accountantName = accountantName;
	}
	public Double getExpcredit() {
		return expcredit;
	}
	public void setExpcredit(Double expcredit) {
		this.expcredit = expcredit;
	}
	public Double getExpDebit() {
		return expDebit;
	}
	public void setExpDebit(Double expDebit) {
		this.expDebit = expDebit;
	}
	public ExpenditurePaymentBean(Long pkExpPaymentId, Long txId, Long fkExpDetailId,
			String serviceProvider, Long contactNumber, String accountantName,
			Double expcredit, Double expDebit, Double totalAmount,
			Date insertDate, Long userId, String username, Long shopId, String shopName, ExpenditureDetailsBean expenditureDetailsBean) {
		super();
		this.pkExpPaymentId = pkExpPaymentId;
		this.txId = txId;
		this.fkExpDetailId = fkExpDetailId;
		this.serviceProvider = serviceProvider;
		this.contactNumber = contactNumber;
		this.accountantName = accountantName;
		this.expcredit = expcredit;
		this.expDebit = expDebit;
		this.totalAmount = totalAmount;
		this.insertDate = insertDate;
		this.userId = userId;
		this.username = username;
		this.shopId = shopId;
		this.shopName = shopName;
		this.expenditureDetailsBean = expenditureDetailsBean;
	}
	public ExpenditurePaymentBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	
}
