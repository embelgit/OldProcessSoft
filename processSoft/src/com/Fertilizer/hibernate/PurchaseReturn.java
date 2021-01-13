package com.Fertilizer.hibernate;

import java.util.Date;

public class PurchaseReturn {

	
	
	private Long pk_GRDetails_id;
	private Long pk_purchase_return_id;
	private Long fk_gr_id;
	private Long billno;
	private String purchase_date;
	private Double return_amount;
	private String idno;
	private String suppliername;
	private Date date;
	private Date GRDate;
	private Long contactno;
	private String city;
	private String gstno;
	private String address;
	private String productname;
	private Double gridTotal;
	private Double Quantity1;
	private String unit;
	
	private Double grossTotal;
	private Double total;
	
	
	private String operation;
	private Double quantity;
	private Long qnty;
	private String rate;
	private Double discount;
	private Double gst;
	private Double igst;
	private Double taxAmount;
	private String Cgst;
	private String Sgst;
	private String tValue;
	private String Totalgst;
	
	
	
	public Long getPk_purchase_return_id() {
		return pk_purchase_return_id;
	}

	public void setPk_purchase_return_id(Long pk_purchase_return_id) {
		this.pk_purchase_return_id = pk_purchase_return_id;
	}

	public Long getFk_gr_id() {
		return fk_gr_id;
	}

	public void setFk_gr_id(Long fk_gr_id) {
		this.fk_gr_id = fk_gr_id;
	}

	public String getPurchase_date() {
		return purchase_date;
	}

	public void setPurchase_date(String purchase_date) {
		this.purchase_date = purchase_date;
	}

	public Double getReturn_amount() {
		return return_amount;
	}

	public void setReturn_amount(Double return_amount) {
		this.return_amount = return_amount;
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

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Long getPk_GRDetails_id() {
		return pk_GRDetails_id;
	}

	public void setPk_GRDetails_id(Long pk_GRDetails_id) {
		this.pk_GRDetails_id = pk_GRDetails_id;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
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

	public String getProductname() {
		return productname;
	}

	public void setProductname(String productname) {
		this.productname = productname;
	}

	public Double getGridTotal() {
		return gridTotal;
	}

	public void setGridTotal(Double gridTotal) {
		gridTotal = gridTotal;
	}

	
	public Double getQuantity1() {
		return Quantity1;
	}

	public void setQuantity1(Double quantity1) {
		Quantity1 = quantity1;
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

	

	public String getRate() {
		return rate;
	}

	public void setRate(String rate) {
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

	public Long getBillno() {
		return billno;
	}

	public void setBillno(Long billno) {
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

	public String gettValue() {
		return tValue;
	}

	public void settValue(String tValue) {
		this.tValue = tValue;
	}

	public String getTotalgst() {
		return Totalgst;
	}

	public void setTotalgst(String totalgst) {
		Totalgst = totalgst;
	}
	public Double getTaxAmount() {
		return taxAmount;
	}
	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}
	public String getIGst() {
		return IGst;
	}

	public void setIGst(String iGst) {
		IGst = iGst;
	}

	private String IGst;

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
}
