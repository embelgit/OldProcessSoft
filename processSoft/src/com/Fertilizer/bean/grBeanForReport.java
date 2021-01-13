package com.Fertilizer.bean;

public class grBeanForReport {
	private String productname;
	private String GRDate;
	
	private Double quantity;
	private Double rate;
	private Double grosstotal,discount,gst,igst,billno;
	private String Shop;
	private Double GridTotal;
	
	
	
	
	
	public Double getBillno() {
		return billno;
	}
	public void setBillno(Double billno) {
		this.billno = billno;
	}
	public Double getIgst() {
		return igst;
	}
	public void setIgst(Double igst) {
		this.igst = igst;
	}
	public Double getGridTotal() {
		return GridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
	}
	public String getShop() {
		return Shop;
	}
	public void setShop(String shop) {
		Shop = shop;
	}
	
	public String getProductname() {
		return productname;
	}
	public Double getDiscount() {
		return discount;
	}
	public void setDiscount(Double discount) {
		this.discount = discount;
	}
	public Double getGst() {
		return gst;
	}
	public void setGst(Double gst) {
		this.gst = gst;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getGRDate() {
		return GRDate;
	}
	public void setGRDate(String gRDate) {
		GRDate = gRDate;
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
	public Double getGrosstotal() {
		return grosstotal;
	}
	public void setGrosstotal(Double grosstotal) {
		this.grosstotal = grosstotal;
	}
	
	

}
