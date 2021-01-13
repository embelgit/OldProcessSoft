package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class FertilizerBillBean implements Serializable {
	
	private Long pkfertilizerBillId;
	private String customerName;
	private String customerHiddenName;
	private Long fkCreditCustomerId;
	private String village;
	private Long contact;
	private Long aadhar;
	private Double transExpense;
	private Double hamaliExpense;
	private Double total;
	private Double grossTotal;
	private Double totalAfterSaleReturn;
	private Double returnAmount;
	private Double productRateWithoutTax;
	private String paymentMode;
	private String nameOnCheck;
	private Long checkNo;
	private Long cardNo;
	private Long discount;
	private Double discountAmount;
	private Double initialPayment;
	private Double balAfterinitialPayment;
	private Double taxAmount;
	private Double cpBalance;
	private String accNo;
	private String gstNo;
	private String bankName;
	private Long fk_shop_id;
	
	private Long catId;
	private Long subCatId;
	private Long supplierId;
	private Long fkGoodsReceive;
	//private Long barcode;
	private String productName;
	private String company;
	private Double salePrice;
	private Double mrp;
	private Long quantity;
	private Double totalInGrid;
	private Double taxPercentage;
	private Double weight;
	private Double billNo;
	private Date insertDate;
	private String expiryDate;
	private Long pkSeedPesticideBillId;
	private Long returnQuantity;
	private Long quantityAfterReturn;
	private String hsn;
	private String payStatus;
	private Date saleDate;
	private Double length;
	private Double bundel;
	private Double cgst;
	private Double sgst;
	private Double iGst;
	private String custgstno;
	private String inwardchallanno;
	private String outwardchallanno;
	private double sumoftotal;
	

	
	public double getSumoftotal() {
		return sumoftotal;
	}


	public void setSumoftotal(double sumoftotal) {
		this.sumoftotal = sumoftotal;
	}


	public String getCustgstno() {
		return custgstno;
	}


	public void setCustgstno(String custgstno) {
		this.custgstno = custgstno;
	}


	public String getInwardchallanno() {
		return inwardchallanno;
	}


	public void setInwardchallanno(String inwardchallanno) {
		this.inwardchallanno = inwardchallanno;
	}


	public String getOutwardchallanno() {
		return outwardchallanno;
	}


	public void setOutwardchallanno(String outwardchallanno) {
		this.outwardchallanno = outwardchallanno;
	}


	public Double getCgst() {
		return cgst;
	}


	public void setCgst(Double cgst) {
		this.cgst = cgst;
	}


	public Double getSgst() {
		return sgst;
	}


	public void setSgst(Double sgst) {
		this.sgst = sgst;
	}


	public FertilizerBillBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	public FertilizerBillBean(Long pkfertilizerBillId, String customerName,
			String customerHiddenName, Long fkCreditCustomerId, String village,
			Long contact, Long aadhar, Double transExpense,
			Double hamaliExpense, Double total, Double grossTotal,
			Double totalAfterSaleReturn, Double returnAmount,
			Double productRateWithoutTax, String paymentMode,
			String nameOnCheck, Long checkNo, Long cardNo, Long discount,
			Double discountAmount, Double initialPayment,
			Double balAfterinitialPayment, Double taxAmount, Double cpBalance,
			String accNo, String gstNo, String bankName, Long fk_shop_id,
			Long catId, Long subCatId, Long supplierId, Long fkGoodsReceive,
			String productName, String company, Double salePrice, Double mrp,
			Long quantity, Double totalInGrid, Double taxPercentage,
			Double weight, Double billNo, Date insertDate, String expiryDate,
			Long pkSeedPesticideBillId, Long returnQuantity,
			Long quantityAfterReturn, String hsn, String payStatus,
			Double iGst, Date saleDate, Double length, Double bundel) {
		super();
		this.pkfertilizerBillId = pkfertilizerBillId;
		this.customerName = customerName;
		this.customerHiddenName = customerHiddenName;
		this.fkCreditCustomerId = fkCreditCustomerId;
		this.village = village;
		this.contact = contact;
		this.aadhar = aadhar;
		this.transExpense = transExpense;
		this.hamaliExpense = hamaliExpense;
		this.total = total;
		this.grossTotal = grossTotal;
		this.totalAfterSaleReturn = totalAfterSaleReturn;
		this.returnAmount = returnAmount;
		this.productRateWithoutTax = productRateWithoutTax;
		this.paymentMode = paymentMode;
		this.nameOnCheck = nameOnCheck;
		this.checkNo = checkNo;
		this.cardNo = cardNo;
		this.discount = discount;
		this.discountAmount = discountAmount;
		this.initialPayment = initialPayment;
		this.balAfterinitialPayment = balAfterinitialPayment;
		this.taxAmount = taxAmount;
		this.cpBalance = cpBalance;
		this.accNo = accNo;
		this.gstNo = gstNo;
		this.bankName = bankName;
		this.fk_shop_id = fk_shop_id;
		this.catId = catId;
		this.subCatId = subCatId;
		this.supplierId = supplierId;
		this.fkGoodsReceive = fkGoodsReceive;
		this.productName = productName;
		this.company = company;
		this.salePrice = salePrice;
		this.mrp = mrp;
		this.quantity = quantity;
		this.totalInGrid = totalInGrid;
		this.taxPercentage = taxPercentage;
		this.weight = weight;
		this.billNo = billNo;
		this.insertDate = insertDate;
		this.expiryDate = expiryDate;
		this.pkSeedPesticideBillId = pkSeedPesticideBillId;
		this.returnQuantity = returnQuantity;
		this.quantityAfterReturn = quantityAfterReturn;
		this.hsn = hsn;
		this.payStatus = payStatus;
		this.iGst = iGst;
		this.saleDate = saleDate;
		this.length = length;
		this.bundel = bundel;
	}


	public Double getLength() {
		return length;
	}


	public void setLength(Double length) {
		this.length = length;
	}


	public Double getBundel() {
		return bundel;
	}


	public void setBundel(Double bundel) {
		this.bundel = bundel;
	}


	public Long getSubCatId() {
		return subCatId;
	}

	public void setSubCatId(Long subCatId) {
		this.subCatId = subCatId;
	}


	public Long getQuantityAfterReturn() {
		return quantityAfterReturn;
	}
	public void setQuantityAfterReturn(Long quantityAfterReturn) {
		this.quantityAfterReturn = quantityAfterReturn;
	}
	public Long getReturnQuantity() {
		return returnQuantity;
	}
	public void setReturnQuantity(Long returnQuantity) {
		this.returnQuantity = returnQuantity;
	}
	public Double getReturnAmount() {
		return returnAmount;
	}
	public void setReturnAmount(Double returnAmount) {
		this.returnAmount = returnAmount;
	}
	public Double getTotalAfterSaleReturn() {
		return totalAfterSaleReturn;
	}
	public void setTotalAfterSaleReturn(Double totalAfterSaleReturn) {
		this.totalAfterSaleReturn = totalAfterSaleReturn;
	}
	public Long getPkSeedPesticideBillId() {
		return pkSeedPesticideBillId;
	}
	public void setPkSeedPesticideBillId(Long pkSeedPesticideBillId) {
		this.pkSeedPesticideBillId = pkSeedPesticideBillId;
	}
	public Long getPkfertilizerBillId() {
		return pkfertilizerBillId;
	}
	public void setPkfertilizerBillId(Long pkfertilizerBillId) {
		this.pkfertilizerBillId = pkfertilizerBillId;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getCustomerHiddenName() {
		return customerHiddenName;
	}
	public void setCustomerHiddenName(String customerHiddenName) {
		this.customerHiddenName = customerHiddenName;
	}
	public Long getFkCreditCustomerId() {
		return fkCreditCustomerId;
	}
	public void setFkCreditCustomerId(Long fkCreditCustomerId) {
		this.fkCreditCustomerId = fkCreditCustomerId;
	}
	public String getVillage() {
		return village;
	}
	public void setVillage(String village) {
		this.village = village;
	}
	public Long getContact() {
		return contact;
	}
	public void setContact(Long contact) {
		this.contact = contact;
	}
	public Long getAadhar() {
		return aadhar;
	}
	public void setAadhar(Long aadhar) {
		this.aadhar = aadhar;
	}
	public Double getTransExpense() {
		return transExpense;
	}
	public void setTransExpense(Double transExpense) {
		this.transExpense = transExpense;
	}
	public Double getHamaliExpense() {
		return hamaliExpense;
	}
	public void setHamaliExpense(Double hamaliExpense) {
		this.hamaliExpense = hamaliExpense;
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
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getNameOnCheck() {
		return nameOnCheck;
	}
	public void setNameOnCheck(String nameOnCheck) {
		this.nameOnCheck = nameOnCheck;
	}
	public Long getCheckNo() {
		return checkNo;
	}
	public void setCheckNo(Long checkNo) {
		this.checkNo = checkNo;
	}
	public Long getCardNo() {
		return cardNo;
	}
	public void setCardNo(Long cardNo) {
		this.cardNo = cardNo;
	}
	public String getAccNo() {
		return accNo;
	}
	public void setAccNo(String accNo) {
		this.accNo = accNo;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public Long getCatId() {
		return catId;
	}
	public void setCatId(Long catId) {
		this.catId = catId;
	}
	public Long getSupplierId() {
		return supplierId;
	}
	public void setSupplierId(Long supplierId) {
		this.supplierId = supplierId;
	}
	public Long getFkGoodsReceive() {
		return fkGoodsReceive;
	}
	public void setFkGoodsReceive(Long fkGoodsReceive) {
		this.fkGoodsReceive = fkGoodsReceive;
	}
	/*public Long getBarcode() {
		return barcode;
	}
	public void setBarcode(Long barcode) {
		this.barcode = barcode;
	}*/
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public Double getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}
	public Double getMrp() {
		return mrp;
	}
	public void setMrp(Double mrp) {
		this.mrp = mrp;
	}
	public Long getQuantity() {
		return quantity;
	}
	public void setQuantity(Long quantity) {
		this.quantity = quantity;
	}
	public Double getTotalInGrid() {
		return totalInGrid;
	}
	public void setTotalInGrid(Double totalInGrid) {
		this.totalInGrid = totalInGrid;
	}
	public Double getTaxPercentage() {
		return taxPercentage;
	}
	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}
	public Double getWeight() {
		return weight;
	}
	public void setWeight(Double weight) {
		this.weight = weight;
	}
	
	public Date getInsertDate() {
		return insertDate;
	}
	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {
		this.expiryDate = expiryDate;
	}


	

/*
	public Double getiGst() {
		return iGst;
	}


	public void setiGst(Double iGst) {
		this.iGst = iGst;
	}*/

	public Long getFk_shop_id() {
		return fk_shop_id;
	}

	public void setFk_shop_id(Long fk_shop_id) {
		this.fk_shop_id = fk_shop_id;
	}


	public Date getSaleDate() {
		return saleDate;
	}


	public void setSaleDate(Date saleDate) {
		this.saleDate = saleDate;
	}

	public String getGstNo() {
		return gstNo;
	}

	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}

	public Long getDiscount() {
		return discount;
	}


	public void setDiscount(Long discount) {
		this.discount = discount;
	}



	public Double getDiscountAmount() {
		return discountAmount;
	}


	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}



	public Double getTaxAmount() {
		return taxAmount;
	}



	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}


	public Double getProductRateWithoutTax() {
		return productRateWithoutTax;
	}


	public void setProductRateWithoutTax(Double productRateWithoutTax) {
		this.productRateWithoutTax = productRateWithoutTax;
	}


	public String getHsn() {
		return hsn;
	}


	public void setHsn(String hsn) {
		this.hsn = hsn;
	}


	public Double getCpBalance() {
		return cpBalance;
	}



	public void setCpBalance(Double cpBalance) {
		this.cpBalance = cpBalance;
	}




	public Double getBillNo() {
		return billNo;
	}




	public void setBillNo(Double billNo) {
		this.billNo = billNo;
	}



	public Double getInitialPayment() {
		return initialPayment;
	}




	public void setInitialPayment(Double initialPayment) {
		this.initialPayment = initialPayment;
	}


	public Double getBalAfterinitialPayment() {
		return balAfterinitialPayment;
	}



	public void setBalAfterinitialPayment(Double balAfterinitialPayment) {
		this.balAfterinitialPayment = balAfterinitialPayment;
	}







































	public String getPayStatus() {
		return payStatus;
	}







































	public void setPayStatus(String payStatus) {
		this.payStatus = payStatus;
	}










	public Double getiGst() {
		return iGst;
	}










	public void setiGst(Double iGst) {
		this.iGst = iGst;
	}




	
	
	
	
}
