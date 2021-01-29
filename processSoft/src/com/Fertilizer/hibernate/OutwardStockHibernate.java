package com.Fertilizer.hibernate;

import java.util.Date;

public class OutwardStockHibernate {
	
	private Long pkOutwardStockId;
	private String supplierName;
	private String supplierIdNo;
	private Date outwardDate;
    private String GSTNo;
	private String challanNo;
	private Date inwardDate;
	private String outwardChallanNo;
	private String vechicleNo;
	private String description;
	private Double total;
	private Double grossTotal;
	//grid data
	private String productName;
	private String hsnSac;
	private String operation;
	private Double okQuantity;
	private Double rejectedQuantity;
	private Double unprocessQuantity;
	private Double duplicateQuantity;
	private	Double unitPrice;
	private String boxDescripation;
	private	Double GridTotal;
//	private double Gst;
//	private double IGst;
//	private String unit;	
	private Long userId;
	private String username;
	private Long shopId;
	private String shopName;
	private Date lastUpdateDate;
	public Long getPkOutwardStockId() {
		return pkOutwardStockId;
	}
	public void setPkOutwardStockId(Long pkOutwardStockId) {
		this.pkOutwardStockId = pkOutwardStockId;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
    public String getSupplierIdNo() {
		return supplierIdNo;
	}
	public void setSupplierIdNo(String supplierIdNo) {
		this.supplierIdNo = supplierIdNo;
	}
	public Date getOutwardDate() {
		return outwardDate;
	}
	public void setOutwardDate(Date outwardDate) {
		this.outwardDate = outwardDate;
	}
	public String getGSTNo() {
		return GSTNo;
	}
	public void setGSTNo(String gSTNo) {
		GSTNo = gSTNo;
	}
	public String getChallanNo() {
		return challanNo;
	}
	public void setChallanNo(String challanNo) {
		this.challanNo = challanNo;
	}
	public Date getInwardDate() {
		return inwardDate;
	}
	public void setInwardDate(Date inwardDate) {
		this.inwardDate = inwardDate;
	}
	public String getOutwardChallanNo() {
		return outwardChallanNo;
	}
	public void setOutwardChallanNo(String outwardChallanNo) {
		this.outwardChallanNo = outwardChallanNo;
	}
	public String getVechicleNo() {
		return vechicleNo;
	}
	public void setVechicleNo(String vechicleNo) {
		this.vechicleNo = vechicleNo;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getGrossTotal() {
		return grossTotal;
	}
	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getHsnSac() {
		return hsnSac;
	}
	public void setHsnSac(String hsnSac) {
		this.hsnSac = hsnSac;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public Double getOkQuantity() {
		return okQuantity;
	}
	public void setOkQuantity(Double okQuantity) {
		this.okQuantity = okQuantity;
	}
	public Double getRejectedQuantity() {
		return rejectedQuantity;
	}
	public void setRejectedQuantity(Double rejectedQuantity) {
		this.rejectedQuantity = rejectedQuantity;
	}
	public Double getUnprocessQuantity() {
		return unprocessQuantity;
	}
	public void setUnprocessQuantity(Double unprocessQuantity) {
		this.unprocessQuantity = unprocessQuantity;
	}
	public Double getDuplicateQuantity() {
		return duplicateQuantity;
	}
	public void setDuplicateQuantity(Double duplicateQuantity) {
		this.duplicateQuantity = duplicateQuantity;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getBoxDescripation() {
		return boxDescripation;
	}
	public void setBoxDescripation(String boxDescripation) {
		this.boxDescripation = boxDescripation;
	}
	public Double getGridTotal() {
		return GridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
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
	public Date getLastUpdateDate() {
		return lastUpdateDate;
	}
	public void setLastUpdateDate(Date lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}

}
