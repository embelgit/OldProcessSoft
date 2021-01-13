package com.Fertilizer.hibernate;

import java.util.Date;

public class VendorPaymentBean {

	private Long pkVenPaymentId;
	private Long txId;
	private String supplier;
	
	private Long supplier1;
	private Long fk_supplier_id;
	
	private String billNo;
	private String billNo1;
	private String chequeNum;
	private Long cardNum;
	private Long accNum;
	private Long regNumber;
	
	private String paymentMode;
	private String nameOnCheck;
	private String bankName;
	private String personname;
	
	private Double totalAmount;
	private Double balance;
	private Double credit;
	private String paymentType;
	
	private String debitAmount;
	private String tdsdetails;
	
	private Date insertDate;
	private Double payment;
	private String remainAmt;
	private String payment1;
	private Double balanceAmountv;
	private Double creditAmount;
	
	private String insertDate1;
	
	private Long userId;
	private String username;
	private Long shopId;
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
	private String shopName;
	
	public String getBillNo1() {
		return billNo1;
	}
	public void setBillNo1(String billNo1) {
		this.billNo1 = billNo1;
	}
	public String getInsertDate1() {
		return insertDate1;
	}
	public void setInsertDate1(String insertDate1) {
		this.insertDate1 = insertDate1;
	}
	public Double getCreditAmount() {
		return creditAmount;
	}
	public void setCreditAmount(Double creditAmount) {
		this.creditAmount = creditAmount;
	}
	public Long getFk_supplier_id() {
		return fk_supplier_id;
	}
	public void setFk_supplier_id(Long fk_supplier_id) {
		this.fk_supplier_id = fk_supplier_id;
	}
	public Double getBalanceAmountv() {
		return balanceAmountv;
	}
	public void setBalanceAmountv(Double balanceAmountv) {
		this.balanceAmountv = balanceAmountv;
	}
	public String getPayment1() {
		return payment1;
	}
	public void setPayment1(String payment1) {
		this.payment1 = payment1;
	}
	public Long getPkVenPaymentId() {
		return pkVenPaymentId;
	}
	public void setPkVenPaymentId(Long pkVenPaymentId) {
		this.pkVenPaymentId = pkVenPaymentId;
	}
	public String getSupplier() {
		return supplier;
	}
	public void setSupplier(String supplier) {
		this.supplier = supplier;
	}
	public Long getSupplier1() {
		return supplier1;
	}
	public void setSupplier1(Long supplier1) {
		this.supplier1 = supplier1;
	}
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public String getChequeNum() {
		return chequeNum;
	}
	public void setChequeNum(String chequeNum) {
		this.chequeNum = chequeNum;
	}
	public Long getCardNum() {
		return cardNum;
	}
	public void setCardNum(Long cardNum) {
		this.cardNum = cardNum;
	}
	public Long getAccNum() {
		return accNum;
	}
	public void setAccNum(Long accNum) {
		this.accNum = accNum;
	}
	public Long getRegNumber() {
		return regNumber;
	}
	public void setRegNumber(Long regNumber) {
		this.regNumber = regNumber;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	
	
	
	public Long getTxId() {
		return txId;
	}
	public void setTxId(Long txId) {
		this.txId = txId;
	}
	/*
	public VendorPaymentBean(Long pkSupPaymentId, String supplier, Long supplier1, Long billNo, String chequeNum,
			Long cardNum, Long accNum, Long regNumber, String paymentMode, String nameOnCheck, String bankName,
			String personname, Double totalAmount, Double balance, Double credit, String paymentType,
			String debitAmount, String tdsdetails, Date insertDate, Double payment, String remainAmt) {
		super();
		this.pkSupPaymentId = pkSupPaymentId;
		this.supplier = supplier;
		this.supplier1 = supplier1;
		this.billNo = billNo;
		this.chequeNum = chequeNum;
		this.cardNum = cardNum;
		this.accNum = accNum;
		this.regNumber = regNumber;
		this.paymentMode = paymentMode;
		this.nameOnCheck = nameOnCheck;
		this.bankName = bankName;
		this.personname = personname;
		this.totalAmount = totalAmount;
		this.balance = balance;
		this.credit = credit;
		this.paymentType = paymentType;
		this.debitAmount = debitAmount;
		this.tdsdetails = tdsdetails;
		this.insertDate = insertDate;
		this.payment = payment;
		this.remainAmt = remainAmt;
	}
	*/
	public String getNameOnCheck() {
		return nameOnCheck;
	}
	public void setNameOnCheck(String nameOnCheck) {
		this.nameOnCheck = nameOnCheck;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getPersonname() {
		return personname;
	}
	public void setPersonname(String personname) {
		this.personname = personname;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Double getBalance() {
		return balance;
	}
	public void setBalance(Double balance) {
		this.balance = balance;
	}
	public Double getCredit() {
		return credit;
	}
	public void setCredit(Double credit) {
		this.credit = credit;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getDebitAmount() {
		return debitAmount;
	}
	public void setDebitAmount(String debitAmount) {
		this.debitAmount = debitAmount;
	}
	public String getTdsdetails() {
		return tdsdetails;
	}
	public void setTdsdetails(String tdsdetails) {
		this.tdsdetails = tdsdetails;
	}
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public Double getPayment() {
		return payment;
	}
	public void setPayment(Double payment) {
		this.payment = payment;
	}
	public String getRemainAmt() {
		return remainAmt;
	}
	public void setRemainAmt(String remainAmt) {
		this.remainAmt = remainAmt;
	}
	
	
	
	
}
