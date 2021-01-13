package com.Fertilizer.hibernate;

import java.util.Date;

public class GrDetailsBean {


	private Long pk_GRDetails_id;
	private String idno;
	private String suppliername;
	private Date date;
	private String Date1;
	private Date GRDate;
	private Long contactno;
	private String city;
	private String gstno;
	private String address;
	private String productname;
	private Double GridTotal;
	private String Quantity1;
	

	
	private String operation;
	private Double quantity;
	private Long qnty;
	private Double rate;
	private Double discount;
	private Double gst,billno;
	private Double igst;
	private String Cgst;
	private String Sgst;
	private String tValue;
	private String Totalgst;
	private String TaxAmount;
	
	private String IGst;
	private Long userId;
	private String username;
	private Long shopId;
	private String shopName;
	
	
	
	
	

	public String getDate1() {
		return Date1;
	}
	public void setDate1(String date1) {
		Date1 = date1;
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
	public String getQuantity1() {
		return Quantity1;
	}
	public void setQuantity1(String quantity1) {
		Quantity1 = quantity1;
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
	public Double getGridTotal() {
		return GridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
	}
	public String getTotalgst() {
		return Totalgst;
	}
	public void setTotalgst(String totalgst) {
		Totalgst = totalgst;
	}
	public String gettValue() {
		return tValue;
	}
	public void settValue(String tValue) {
		this.tValue = tValue;
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
	public Double getBillno() {
		return billno;
	}
	public void setBillno(Double billno) {
		this.billno = billno;
	}
	private String unit;
	private Double total;
	private Double grosstotal;
	 
	
	public String getShopName() {
		return ShopName;
	}
	public void setShopName(String shopName) {
		ShopName = shopName;
	}
	private String hsn;
	private String ShopName;
	
	public Double getGrosstotal() {
		return grosstotal;
	}
	public void setGrosstotal(Double grosstotal) {
		this.grosstotal = grosstotal;
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
	public Long getQnty() {
		return qnty;
	}
	public void setQnty(Long qnty) {
		this.qnty = qnty;
	}

	public Long getPk_GRDetails_id() {
		return pk_GRDetails_id;
	}
	public void setPk_GRDetails_id(Long pk_GRDetails_id) {
		this.pk_GRDetails_id = pk_GRDetails_id;
	}
	
	public Date getGRDate() {
		return GRDate;
	}
	public void setGRDate(Date gRDate) {
		GRDate = gRDate;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
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
	public Double getIgst() {
		return igst;
	}
	public void setIgst(Double igst) {
		this.igst = igst;
	}
	

}
