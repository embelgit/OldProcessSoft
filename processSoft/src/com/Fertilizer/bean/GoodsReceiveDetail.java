package com.Fertilizer.bean;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

import com.Fertilizer.hibernate.CategoryDetailsBean;
import com.Fertilizer.hibernate.ExpenseDetailForBillingAndGoodsReceiveBean;
import com.Fertilizer.hibernate.GodownEntry;
import com.Fertilizer.hibernate.ProductDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.hibernate.shopDetailsBean;

public class GoodsReceiveDetail {

	private String productName;
	private String stock;
	private String expiryDate;
	private String batchNumber;
	private String company;
	private String weight;
	private String typeoffunction;
	private String color;
	private BigInteger micron;
	private Double quantity ;
	private Double quantityinbundle;
	private Double length;
	private BigDecimal buyPrice ;
	private String purchaseDate;
	private Long item_id;
	
	public Long getItem_id() {
		return item_id;
	}
	public void setItem_id(Long item_id) {
		this.item_id = item_id;
	}
	public String getPurchaseDate() {
		return purchaseDate;
	}
	public void setPurchaseDate(String purchaseDate) {
		this.purchaseDate = purchaseDate;
	}
	public String getTypeoffunction() {
		return typeoffunction;
	}
	public void setTypeoffunction(String typeoffunction) {
		this.typeoffunction = typeoffunction;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public BigInteger getMicron() {
		return micron;
	}
	public void setMicron(BigInteger micron) {
		this.micron = micron;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Double getQuantityinbundle() {
		return quantityinbundle;
	}
	public void setQuantityinbundle(Double quantityinbundle) {
		this.quantityinbundle = quantityinbundle;
	}
	public Double getLength() {
		return length;
	}
	public void setLength(Double length) {
		this.length = length;
	}
	public BigDecimal getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(BigDecimal buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getStock() {
		return stock;
	}
	public void setStock(String stock) {
		this.stock = stock;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}
	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}
	
	
}
