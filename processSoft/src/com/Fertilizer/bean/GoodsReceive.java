package com.Fertilizer.bean;

import java.util.Date;

public class GoodsReceive {

	private Long pkGRDetailsid;
	private String idno;
	private String suppliername;
	private String date;
	private Date GRDate;
	private Long contactno;
	private String city;
	private String gstno;
	private String address;
	private String productname;
	private Double GridTotal;

	private Double grosstotal;
	private String operation,unit;
	private Double quantity;
	private Long Quantity1;
	private Long qnty;
	private Double rate;
	private Double discount;
	private Double gst,billno;
	private Double igst;
	private String Cgst;
	private String Sgst;
	private Long tValue;
	
	
	
	public Long getPkGRDetailsid() {
		return pkGRDetailsid;
	}

	public void setPkGRDetailsid(Long pkGRDetailsid) {
		this.pkGRDetailsid = pkGRDetailsid;
	}

	public Long getQuantity1() {
		return Quantity1;
	}

	public void setQuantity1(Long quantity1) {
		Quantity1 = quantity1;
	}

	public Double getGrosstotal() {
		return grosstotal;
	}

	public void setGrosstotal(Double grosstotal) {
		this.grosstotal = grosstotal;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	

	public String getIdno() {
		return idno;
	}

	public void setIdno(String idno) {
		this.idno = idno;
	}

	public String getSuppliername() {
		return suppliername;
	}

	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}

	

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public Date getGRDate() {
		return GRDate;
	}

	public void setGRDate(Date gRDate) {
		GRDate = gRDate;
	}

	public Long getContactno() {
		return contactno;
	}

	public void setContactno(Long contactno) {
		this.contactno = contactno;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getGstno() {
		return gstno;
	}

	public void setGstno(String gstno) {
		this.gstno = gstno;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Double getGridTotal() {
		return GridTotal;
	}

	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
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

	public Long getQnty() {
		return qnty;
	}

	public void setQnty(Long qnty) {
		this.qnty = qnty;
	}

	public Double getRate() {
		return rate;
	}

	public void setRate(Double rate) {
		this.rate = rate;
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

	public String getCgst() {
		return Cgst;
	}

	public void setCgst(String cgst) {
		Cgst = cgst;
	}

	public String getSgst() {
		return Sgst;
	}

	public void setSgst(String sgst) {
		Sgst = sgst;
	}

	

	public Long gettValue() {
		return tValue;
	}

	public void settValue(Long tValue) {
		this.tValue = tValue;
	}

	public String getTotalgst() {
		return Totalgst;
	}

	public void setTotalgst(String totalgst) {
		Totalgst = totalgst;
	}

	public String getTaxAmount() {
		return TaxAmount;
	}

	public void setTaxAmount(String taxAmount) {
		TaxAmount = taxAmount;
	}

	public String getIGst() {
		return IGst;
	}

	public void setIGst(String iGst) {
		IGst = iGst;
	}

	private String Totalgst;
	private String TaxAmount;
	
	private String IGst;
}
