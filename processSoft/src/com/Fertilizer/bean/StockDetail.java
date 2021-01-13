package com.Fertilizer.bean;

import java.math.BigDecimal;
import java.math.BigInteger;

public class StockDetail {

	private String productName;
	private BigDecimal stock;
	private String godownName;
	private String categoryName;
	
	private String batchNo;
	private String companyName;
	private Double weight;
	private Double quantity;
	
	private Double Unproquantity;
	private Double rejquantity;
	private String AvaInwQuantity1;
	private String Unproquantity1;
	private Long RejectedQty;
	private String NewTOtal;
	
	

	public String getNewTOtal() {
		return NewTOtal;
	}
	public void setNewTOtal(String newTOtal) {
		NewTOtal = newTOtal;
	}
	public Long getRejectedQty() {
		return RejectedQty;
	}
	public void setRejectedQty(Long rejectedQty) {
		RejectedQty = rejectedQty;
	}
	public Double getUnproquantity() {
		return Unproquantity;
	}
	public void setUnproquantity(Double unproquantity) {
		Unproquantity = unproquantity;
	}
	public Double getRejquantity() {
		return rejquantity;
	}
	public void setRejquantity(Double rejquantity) {
		this.rejquantity = rejquantity;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}

	public BigDecimal getStock() {
		return stock;
	}
	public void setStock(BigDecimal stock) {
		this.stock = stock;
	}
	public String getGodownName() {
		return godownName;
	}
	public void setGodownName(String godownName) {
		this.godownName = godownName;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	public String getBatchNo() {
		return batchNo;
	}
	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}
	
	// this is for inward outward stock report by VK
	
	private String StrproductName;
	private String StrcompanyName;
	private String dInwardChallanNo;
	private String dOutwardChallanNo;
	private Double dInwardQty;
	private Double dOutwardQty;
	private String dbalanceQty;

	public String getStrproductName() {
		return StrproductName;
	}
	public void setStrproductName(String strproductName) {
		StrproductName = strproductName;
	}
	public String getStrcompanyName() {
		return StrcompanyName;
	}
	public void setStrcompanyName(String strcompanyName) {
		StrcompanyName = strcompanyName;
	}
	public String getdInwardChallanNo() {
		return dInwardChallanNo;
	}
	public void setdInwardChallanNo(String dInwardChallanNo) {
		this.dInwardChallanNo = dInwardChallanNo;
	}
	public String getdOutwardChallanNo() {
		return dOutwardChallanNo;
	}
	public void setdOutwardChallanNo(String dOutwardChallanNo) {
		this.dOutwardChallanNo = dOutwardChallanNo;
	}
	public Double getdInwardQty() {
		return dInwardQty;
	}
	public void setdInwardQty(Double dInwardQty) {
		this.dInwardQty = dInwardQty;
	}
	public Double getdOutwardQty() {
		return dOutwardQty;
	}
	public void setdOutwardQty(Double dOutwardQty) {
		this.dOutwardQty = dOutwardQty;
	}
	public String getDbalanceQty() {
		return dbalanceQty;
	}
	public void setDbalanceQty(String dbalanceQty) {
		this.dbalanceQty = dbalanceQty;
	}
	public String getAvaInwQuantity1() {
		return AvaInwQuantity1;
	}
	public void setAvaInwQuantity1(String avaInwQuantity1) {
		AvaInwQuantity1 = avaInwQuantity1;
	}
	public String getUnproquantity1() {
		return Unproquantity1;
	}
	public void setUnproquantity1(String unproquantity1) {
		Unproquantity1 = unproquantity1;
	}
	

	
	
	
	
	
	
	
	
	
}
