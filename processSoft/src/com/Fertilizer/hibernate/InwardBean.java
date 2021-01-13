package com.Fertilizer.hibernate;

import java.util.Date;

public class InwardBean {
	
	private Long pk_inward_id;
	private String suppliername;
	private String challanno;
	private String pono;
	private String poDate;
	private Date challadate;
	private String productname;
	private String operation;
	private Double quantity;
	private Double GridTotal;

	private Double dupQuantity;
	private Double rate;
	private String unit;
	private	Double total;
	private Double alltotal;
	private Double grosstotal;
	private String inwardDate;
	private Long fkOperationDetailsId;
	private String operationName;
	private String hsn;
	private String quantity1;
	private String dupQuantity1;
	
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
	public Double getGridTotal() {
		return GridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
	}
	public String getDupQuantity1() {
		return dupQuantity1;
	}
	public void setDupQuantity1(String dupQuantity1) {
		this.dupQuantity1 = dupQuantity1;
	}
	public String getQuantity1() {
		return quantity1;
	}
	public void setQuantity1(String quantity1) {
		this.quantity1 = quantity1;
	}
	
	
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	
	public String getInwardDate() {
		return inwardDate;
	}
	public void setInwardDate(String inwardDate) {
		this.inwardDate = inwardDate;
	}
	public Long getPk_inward_id() {
		return pk_inward_id;
	}
	public void setPk_inward_id(Long pk_inward_id) {
		this.pk_inward_id = pk_inward_id;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getChallanno() {
		return challanno;
	}
	public void setChallanno(String challanno) {
		this.challanno = challanno;
	}
	public String getPono() {
		return pono;
	}
	public void setPono(String pono) {
		this.pono = pono;
	}
	public Date getChalladate() {
		return challadate;
	}
	public void setChalladate(Date challadate) {
		this.challadate = challadate;
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
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Double getRate() {
		return rate;
	}
	public void setRate(Double rate) {
		this.rate = rate;
	}
	public String getUnit() {
		return unit;
	}
	public void setUnit(String unit) {
		this.unit = unit;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public Double getAlltotal() {
		return alltotal;
	}
	public void setAlltotal(Double alltotal) {
		this.alltotal = alltotal;
	}
	public Double getGrosstotal() {
		return grosstotal;
	}
	public void setGrosstotal(Double grosstotal) {
		this.grosstotal = grosstotal;
	}
	public Double getDupQuantity() {
		return dupQuantity;
	}
	public void setDupQuantity(Double dupQuantity) {
		this.dupQuantity = dupQuantity;
	}
	public String getPoDate() {
		return poDate;
	}
	public void setPoDate(String poDate) {
		this.poDate = poDate;
	}
	
	
	

}
