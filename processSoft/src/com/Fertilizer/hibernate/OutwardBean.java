package com.Fertilizer.hibernate;

import java.util.Date;

public class OutwardBean {

	private Long pk_outward_id;
	private String suppliername;
	private String outChallanno;
	private String challanNo;
	private String outwardchallanno;
	private String vechicleNo;
	private String boxDescripation;
	private String hsn;
	private String tinNo;
	private String IdNo;
	private String operation;
	private Double GridTotal;
	
	//private String ShopName;
	
	//only for set gst and igst value 0 to grid;
	private double Gst;
	private double IGst;
	private Date inwardDate;
    private Date outwardDate;
	private String productName;
	private String description;
	private Double rejectedquantity;
	private Double okquantity;
	private Double unprocessquantity;
	private String unit;
	private	Double total;
	private	Double buyPrice;
	private Double okquantity1;
	private String dupQuantity;
	
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
	public String getDupQuantity() {
		return dupQuantity;
	}
	public void setDupQuantity(String dupQuantity) {
		this.dupQuantity = dupQuantity;
	}
	public Double getGridTotal() {
		return GridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		GridTotal = gridTotal;
	}

	/*
	 * public String getShopName() { return ShopName; } public void
	 * setShopName(String shopName) { ShopName = shopName; }
	 */
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getIdNo() {
		return IdNo;
	}
	public void setIdNo(String idNo) {
		IdNo = idNo;
	}
	public String getTinNo() {
		return tinNo;
	}
	public void setTinNo(String tinNo) {
		this.tinNo = tinNo;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	public String getVechicleNo() {
		return vechicleNo;
	}
	public void setVechicleNo(String vechicleNo) {
		this.vechicleNo = vechicleNo;
	}
	
	
	
	public Double getOkquantity1() {
		return okquantity1;
	}
	public void setOkquantity1(Double okquantity1) {
		this.okquantity1 = okquantity1;
	}
	public Long getPk_outward_id() {
		return pk_outward_id;
	}
	public void setPk_outward_id(Long pk_outward_id) {
		this.pk_outward_id = pk_outward_id;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getOutChallanno() {
		return outChallanno;
	}
	public void setOutChallanno(String outChallanno) {
		this.outChallanno = outChallanno;
	}
	public String getChallanNo() {
		return challanNo;
	}
	public void setChallanNo(String challanNo) {
		this.challanNo = challanNo;
	}
	public String getOutwardchallanno() {
		return outwardchallanno;
	}
	public void setOutwardchallanno(String outwardchallanno) {
		this.outwardchallanno = outwardchallanno;
	}
	public Date getInwardDate() {
		return inwardDate;
	}
	public void setInwardDate(Date inwardDate) {
		this.inwardDate = inwardDate;
	}
	public Date getOutwardDate() {
		return outwardDate;
	}
	public void setOutwardDate(Date outwardDate) {
		this.outwardDate = outwardDate;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getRejectedquantity() {
		return rejectedquantity;
	}
	public void setRejectedquantity(Double rejectedquantity) {
		this.rejectedquantity = rejectedquantity;
	}
	public Double getOkquantity() {
		return okquantity;
	}
	public void setOkquantity(Double okquantity) {
		this.okquantity = okquantity;
	}
	public Double getUnprocessquantity() {
		return unprocessquantity;
	}
	public void setUnprocessquantity(Double unprocessquantity) {
		this.unprocessquantity = unprocessquantity;
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
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getBoxDescripation() {
		return boxDescripation;
	}
	public void setBoxDescripation(String boxDescripation) {
		this.boxDescripation = boxDescripation;
	}

	private Double alltotal;
	private Double grosstotal;

	public double getGst() {
		return Gst;
	}
	public void setGst(double gst) {
		Gst = gst;
	}
	public double getIGst() {
		return IGst;
	}
	public void setIGst(double iGst) {
		IGst = iGst;
	}
	
	

	
}
