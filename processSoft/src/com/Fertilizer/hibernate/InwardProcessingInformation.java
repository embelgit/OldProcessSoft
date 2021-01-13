package com.Fertilizer.hibernate;

import java.util.Date;

public class InwardProcessingInformation {
	
	private Long InwardProcessingInfoPk;
	private String purchaseOrderNo;
	private String challanNo;
	private Long fkOperationDetailsId;
	private String operationName;
	private Long userId;
	private String userName;
	private Long shopId;
	private String shopName;
	private Date lastUpdateDate;
	public Long getInwardProcessingInfoPk() {
		return InwardProcessingInfoPk;
	}
	public void setInwardProcessingInfoPk(Long inwardProcessingInfoPk) {
		InwardProcessingInfoPk = inwardProcessingInfoPk;
	}
	public String getPurchaseOrderNo() {
		return purchaseOrderNo;
	}
	public void setPurchaseOrderNo(String purchaseOrderNo) {
		this.purchaseOrderNo = purchaseOrderNo;
	}
	public String getChallanNo() {
		return challanNo;
	}
	public void setChallanNo(String challanNo) {
		this.challanNo = challanNo;
	}
	public Long getFkOperationDetailsId() {
		return fkOperationDetailsId;
	}
	public void setFkOperationDetailsId(Long fkOperationDetailsId) {
		this.fkOperationDetailsId = fkOperationDetailsId;
	}
	public String getOperationName() {
		return operationName;
	}
	public void setOperationName(String operationName) {
		this.operationName = operationName;
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
