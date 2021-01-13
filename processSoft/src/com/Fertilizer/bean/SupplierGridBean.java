package com.Fertilizer.bean;

public class SupplierGridBean {

	private Long serialNo;
	private String productName;
	private String model;
	private Double quantity;
	private Double buyPrice;
	private Double Total;
	private Double bundel;
	private Double sGst;
	private Double cGst;
	private Double iGst;
	private Double taxAmt;
	
	public Double getTaxAmt() {
		return taxAmt;
	}
	public void setTaxAmt(Double taxAmt) {
		this.taxAmt = taxAmt;
	}
	public Long getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(Long serialNo) {
		this.serialNo = serialNo;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public Double getQuantity() {
		return quantity;
	}
	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public Double getTotal() {
		return Total;
	}
	public void setTotal(Double total) {
		Total = total;
	}
	public Double getBundel() {
		return bundel;
	}
	public void setBundel(Double bundel) {
		this.bundel = bundel;
	}
	public Double getsGst() {
		return sGst;
	}
	public void setsGst(Double sGst) {
		this.sGst = sGst;
	}
	public Double getcGst() {
		return cGst;
	}
	public void setcGst(Double cGst) {
		this.cGst = cGst;
	}
	public Double getiGst() {
		return iGst;
	}
	public void setiGst(Double iGst) {
		this.iGst = iGst;
	}


}
