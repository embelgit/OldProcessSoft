package com.Fertilizer.hibernate;

import java.util.Date;

public class CustomerBillBean1 {
	
	private Long pk_customer_id;
	private String productName;
	private Double okquantity;
	private Double returnQuantity;
	private Long gst;
	private Long igst;
	private Long taxamount;
	private	Double buyPrice;
	private String description;
	private	Double total;
	private String creditcustomer;
	private String custname;
	private Long contactNo1;
	private String gstNo2;
	private Long initialPayment;
	private Double gstForExpense1;
	private Double totalWithExpense1;
	private String paymentMode2;
	private String vehicle;
	
	
	private String outwardchallanno;
    private Date saleDate2;
    private String saleDate;
    private Long custgstno;
    private Double discount1;
    private Double discountAmount1;
	private Double hamaliExpence3;
	private Double hamaliExpence1;
	private Double grossTotal1;
	private String address;
	private String suppliername;
	private String hsn;
	private String operation;
	private String InwardChallanNo;
	//private String ShopName;
	private String billNo;
	private String billNo1;
	private Double gridTotal;
	private String tValue;
	private String Cgst;
	private String Sgst;
	private String Totalgst;

	private Long supplier1;
	
	private String IGst;
	
	public String getSaleDate() {
		return saleDate;
	}
	public void setSaleDate(String saleDate) {
		this.saleDate = saleDate;
	}
	public Double getReturnQuantity() {
		return returnQuantity;
	}
	public void setReturnQuantity(Double returnQuantity) {
		this.returnQuantity = returnQuantity;
	}
	private Long userId;
	private String username;
	private Long shopId;
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
	private String shopName;
	

	public String getIGst() {
		return IGst;
	}
	public void setIGst(String iGst) {
		IGst = iGst;
	}
	public String getBillNo1() {
		return billNo1;
	}
	public void setBillNo1(String billNo1) {
		this.billNo1 = billNo1;
	}
	public Long getSupplier1() {
		return supplier1;
	}
	public void setSupplier1(Long supplier1) {
		this.supplier1 = supplier1;
	}
	public String getTotalgst() {
		return Totalgst;
	}
	public void setTotalgst(String totalgst) {
		Totalgst = totalgst;
	}
	public Long getPk_customer_id() {
		return pk_customer_id;
	}
	public void setPk_customer_id(Long pk_customer_id) {
		this.pk_customer_id = pk_customer_id;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Double getOkquantity() {
		return okquantity;
	}
	public void setOkquantity(Double okquantity) {
		this.okquantity = okquantity;
	}
	public Long getGst() {
		return gst;
	}
	public void setGst(Long gst) {
		this.gst = gst;
	}
	public Long getIgst() {
		return igst;
	}
	public void setIgst(Long igst) {
		this.igst = igst;
	}
	public Long getTaxamount() {
		return taxamount;
	}
	public void setTaxamount(Long taxamount) {
		this.taxamount = taxamount;
	}
	public Double getBuyPrice() {
		return buyPrice;
	}
	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Double getTotal() {
		return total;
	}
	public void setTotal(Double total) {
		this.total = total;
	}
	public String getCreditcustomer() {
		return creditcustomer;
	}
	public void setCreditcustomer(String creditcustomer) {
		this.creditcustomer = creditcustomer;
	}
	public String getCustname() {
		return custname;
	}
	public void setCustname(String custname) {
		this.custname = custname;
	}
	public Long getContactNo1() {
		return contactNo1;
	}
	public void setContactNo1(Long contactNo1) {
		this.contactNo1 = contactNo1;
	}
	public String getGstNo2() {
		return gstNo2;
	}
	public void setGstNo2(String gstNo2) {
		this.gstNo2 = gstNo2;
	}
	public Long getInitialPayment() {
		return initialPayment;
	}
	public void setInitialPayment(Long initialPayment) {
		this.initialPayment = initialPayment;
	}
	public Double getGstForExpense1() {
		return gstForExpense1;
	}
	public void setGstForExpense1(Double gstForExpense1) {
		this.gstForExpense1 = gstForExpense1;
	}
	public Double getTotalWithExpense1() {
		return totalWithExpense1;
	}
	public void setTotalWithExpense1(Double totalWithExpense1) {
		this.totalWithExpense1 = totalWithExpense1;
	}
	public String getPaymentMode2() {
		return paymentMode2;
	}
	public void setPaymentMode2(String paymentMode2) {
		this.paymentMode2 = paymentMode2;
	}
	public String getVehicle() {
		return vehicle;
	}
	public void setVehicle(String vehicle) {
		this.vehicle = vehicle;
	}
	public String getOutwardchallanno() {
		return outwardchallanno;
	}
	public void setOutwardchallanno(String outwardchallanno) {
		this.outwardchallanno = outwardchallanno;
	}
	public Date getSaleDate2() {
		return saleDate2;
	}
	public void setSaleDate2(Date saleDate2) {
		this.saleDate2 = saleDate2;
	}
	public Long getCustgstno() {
		return custgstno;
	}
	public void setCustgstno(Long custgstno) {
		this.custgstno = custgstno;
	}
	public Double getDiscount1() {
		return discount1;
	}
	public void setDiscount1(Double discount1) {
		this.discount1 = discount1;
	}
	public Double getDiscountAmount1() {
		return discountAmount1;
	}
	public void setDiscountAmount1(Double discountAmount1) {
		this.discountAmount1 = discountAmount1;
	}
	public Double getHamaliExpence3() {
		return hamaliExpence3;
	}
	public void setHamaliExpence3(Double hamaliExpence3) {
		this.hamaliExpence3 = hamaliExpence3;
	}
	public Double getHamaliExpence1() {
		return hamaliExpence1;
	}
	public void setHamaliExpence1(Double hamaliExpence1) {
		this.hamaliExpence1 = hamaliExpence1;
	}
	public Double getGrossTotal1() {
		return grossTotal1;
	}
	public void setGrossTotal1(Double grossTotal1) {
		this.grossTotal1 = grossTotal1;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSuppliername() {
		return suppliername;
	}
	public void setSuppliername(String suppliername) {
		this.suppliername = suppliername;
	}
	public String getHsn() {
		return hsn;
	}
	public void setHsn(String hsn) {
		this.hsn = hsn;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getInwardChallanNo() {
		return InwardChallanNo;
	}
	public void setInwardChallanNo(String inwardChallanNo) {
		InwardChallanNo = inwardChallanNo;
	}

	/*
	 * public String getShopName() { return ShopName; } public void
	 * setShopName(String shopName) { ShopName = shopName; }
	 */
	public String getBillNo() {
		return billNo;
	}
	public void setBillNo(String billNo) {
		this.billNo = billNo;
	}
	public Double getGridTotal() {
		return gridTotal;
	}
	public void setGridTotal(Double gridTotal) {
		this.gridTotal = gridTotal;
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
	public void setQuantityAfterReturn(Long remainingQuantity) {
		// TODO Auto-generated method stub
		
	}
	public void setTotalAfterSaleReturn(Double newGrossTotal) {
		// TODO Auto-generated method stub
		
	}
	public void setReturnAmount(Double total2) {
		// TODO Auto-generated method stub
		
	}
	
	
	
		
}
