package com.Fertilizer.bean;

public class GetpackingDetails {
	
	private String product;
	private Double stock;
	private Double quantityDouble;
	private Double weight;
	private Long catid;
	private Long subCatid;
	private Long shopid;
	
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	public Long getCatid() {
		return catid;
	}
	public void setCatid(Long catid) {
		this.catid = catid;
	}
	public Long getShopid() {
		return shopid;
	}
	public void setShopid(Long shopid) {
		this.shopid = shopid;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public Double getStock() {
		return stock;
	}
	public void setStock(Double stock) {
		this.stock = stock;
	}
	public Double getQuantityDouble() {
		return quantityDouble;
	}
	public void setQuantityDouble(Double quantityDouble) {
		this.quantityDouble = quantityDouble;
	}
	public Long getSubCatid() {
		return subCatid;
	}
	public void setSubCatid(Long subCatid) {
		this.subCatid = subCatid;
	}
	
}
