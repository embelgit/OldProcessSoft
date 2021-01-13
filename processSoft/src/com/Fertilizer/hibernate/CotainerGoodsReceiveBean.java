package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class CotainerGoodsReceiveBean implements Serializable{

	private Long pkContainerGoodsReceiveId;
	private Long pkPOId;
	private Long supplier;
	private Long dcNum ;
	private Double weightAftShortMinus;
	private Double expenses;
	private Double capacity;
	private Double taxPercentage;
	private Double taxAmount;
	private Long fkExpenseId;
	private Double grossTotal;
	private String productName;
	private String containerName;
	private Double buyPrice ;
	private Double salePrice ;
	private Double weight ;
	private Double totalAmount;
	private Double perProductTotal;
	private Double quantity ;
	private Date expiryDate;
	private Date insertDate;
	private Long fkCategoryId;
	private String unit;
	private Long fk_subCat_id;
	private Long fk_shop_id;
	/*private Long fkGodownId;*/
	private Date purchaseDate;
	/*private Date dueDate;*/
	private String billType;
	private Double mrp;
	private CategoryDetailsBean categoryDetailsBean;
	private SupplierDetailsBean supplierDetailsBean ;
	private ProductDetailsBean productDetailsBean;
	private shopDetailsBean shopDetailsBean ;
	private GodownEntry godownEntry ;
	private Double discount;
	private Double discountAmount;
	private String billNum;
	private Long barcodeNo;
	private String companyName;
	private ExpenseDetailForBillingAndGoodsReceiveBean expenseDetailForBillingAndGoodsReceiveBean;
	private Double dupQuantity;
	private Double returnAmount;
	private Double totalAfterReturn;
	private Double iGstPercentage;
	private Double billPaymentPending;


	
	public CotainerGoodsReceiveBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CotainerGoodsReceiveBean(
			Long pkContainerGoodsReceiveId,
			Long pkPOId,
			Long supplier,
			Long dcNum,
			Double weightAftShortMinus,
			Double expenses,
			Double capacity,
			Double taxPercentage,
			Double taxAmount,
			Long fkExpenseId,
			Double grossTotal,
			String productName,
			String containerName,
			Double buyPrice,
			Double salePrice,
			Double weight,
			Double totalAmount,
			Double perProductTotal,
			Double quantity,
			Date expiryDate,
			Date insertDate,
			Long fkCategoryId,
			String unit,
			Long fk_subCat_id,
			Long fk_shop_id,
			Date purchaseDate,
			String billType,
			Double mrp,
			CategoryDetailsBean categoryDetailsBean,
			SupplierDetailsBean supplierDetailsBean,
			ProductDetailsBean productDetailsBean,
			com.Fertilizer.hibernate.shopDetailsBean shopDetailsBean,
			GodownEntry godownEntry,
			Double discount,
			Double discountAmount,
			String billNum,
			Long barcodeNo,
			String companyName,
			ExpenseDetailForBillingAndGoodsReceiveBean expenseDetailForBillingAndGoodsReceiveBean,
			Double dupQuantity, Double returnAmount, Double totalAfterReturn,
			Double iGstPercentage, Double billPaymentPending) {
		super();
		this.pkContainerGoodsReceiveId = pkContainerGoodsReceiveId;
		this.pkPOId = pkPOId;
		this.supplier = supplier;
		this.dcNum = dcNum;
		this.weightAftShortMinus = weightAftShortMinus;
		this.expenses = expenses;
		this.capacity = capacity;
		this.taxPercentage = taxPercentage;
		this.taxAmount = taxAmount;
		this.fkExpenseId = fkExpenseId;
		this.grossTotal = grossTotal;
		this.productName = productName;
		this.containerName = containerName;
		this.buyPrice = buyPrice;
		this.salePrice = salePrice;
		this.weight = weight;
		this.totalAmount = totalAmount;
		this.perProductTotal = perProductTotal;
		this.quantity = quantity;
		this.expiryDate = expiryDate;
		this.insertDate = insertDate;
		this.fkCategoryId = fkCategoryId;
		this.setUnit(unit);
		this.fk_subCat_id = fk_subCat_id;
		this.fk_shop_id = fk_shop_id;
		this.purchaseDate = purchaseDate;
		this.billType = billType;
		this.mrp = mrp;
		this.categoryDetailsBean = categoryDetailsBean;
		this.supplierDetailsBean = supplierDetailsBean;
		this.productDetailsBean = productDetailsBean;
		this.shopDetailsBean = shopDetailsBean;
		this.godownEntry = godownEntry;
		this.discount = discount;
		this.discountAmount = discountAmount;
		this.billNum = billNum;
		this.barcodeNo = barcodeNo;
		this.companyName = companyName;
		this.expenseDetailForBillingAndGoodsReceiveBean = expenseDetailForBillingAndGoodsReceiveBean;
		this.dupQuantity = dupQuantity;
		this.returnAmount = returnAmount;
		this.totalAfterReturn = totalAfterReturn;
		this.iGstPercentage = iGstPercentage;
		this.billPaymentPending = billPaymentPending;
	}




	public Double getiGstPercentage() {
		return iGstPercentage;
	}

	public Long getPkContainerGoodsReceiveId() {
		return pkContainerGoodsReceiveId;
	}

	public void setPkContainerGoodsReceiveId(Long pkContainerGoodsReceiveId) {
		this.pkContainerGoodsReceiveId = pkContainerGoodsReceiveId;
	}

	public Double getCapacity() {
		return capacity;
	}

	public void setCapacity(Double capacity) {
		this.capacity = capacity;
	}

	public String getContainerName() {
		return containerName;
	}

	public void setContainerName(String containerName) {
		this.containerName = containerName;
	}

	public void setiGstPercentage(Double iGstPercentage) {
		this.iGstPercentage = iGstPercentage;
	}

	public Double getReturnAmount() {
		return returnAmount;
	}

	public void setReturnAmount(Double returnAmount) {
		this.returnAmount = returnAmount;
	}

	public Double getTotalAfterReturn() {
		return totalAfterReturn;
	}





	public void setTotalAfterReturn(Double totalAfterReturn) {
		this.totalAfterReturn = totalAfterReturn;
	}





	public Double getDupQuantity() {
		return dupQuantity;
	}





	public void setDupQuantity(Double dupQuantity) {
		this.dupQuantity = dupQuantity;
	}

	public Long getPkPOId() {
		return pkPOId;
	}


	public void setPkPOId(Long pkPOId) {
		this.pkPOId = pkPOId;
	}


	public Long getSupplier() {
		return supplier;
	}


	public void setSupplier(Long supplier) {
		this.supplier = supplier;
	}


	public Long getDcNum() {
		return dcNum;
	}


	public void setDcNum(Long dcNum) {
		this.dcNum = dcNum;
	}


	public Double getExpenses() {
		return expenses;
	}


	public void setExpenses(Double expenses) {
		this.expenses = expenses;
	}


	public Double getTaxPercentage() {
		return taxPercentage;
	}


	public void setTaxPercentage(Double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}


	public Double getTaxAmount() {
		return taxAmount;
	}


	public void setTaxAmount(Double taxAmount) {
		this.taxAmount = taxAmount;
	}


	public Long getFkExpenseId() {
		return fkExpenseId;
	}


	public void setFkExpenseId(Long fkExpenseId) {
		this.fkExpenseId = fkExpenseId;
	}


	public Double getGrossTotal() {
		return grossTotal;
	}


	public void setGrossTotal(Double grossTotal) {
		this.grossTotal = grossTotal;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public Double getBuyPrice() {
		return buyPrice;
	}


	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}


	public Double getSalePrice() {
		return salePrice;
	}


	public void setSalePrice(Double salePrice) {
		this.salePrice = salePrice;
	}


	public Double getWeight() {
		return weight;
	}


	public void setWeight(Double weight) {
		this.weight = weight;
	}


	public Double getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}


	public Double getQuantity() {
		return quantity;
	}


	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}


	/*public String getBatchNo() {
		return batchNo;
	}


	public void setBatchNo(String batchNo) {
		this.batchNo = batchNo;
	}*/


	public Date getExpiryDate() {
		return expiryDate;
	}


	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}


	public Date getInsertDate() {
		return insertDate;
	}


	public void setInsertDate(Date insertDate) {
		this.insertDate = insertDate;
	}


	public Long getFkCategoryId() {
		return fkCategoryId;
	}


	public void setFkCategoryId(Long fkCategoryId) {
		this.fkCategoryId = fkCategoryId;
	}


	/*public Long getFkGodownId() {
		return fkGodownId;
	}


	public void setFkGodownId(Long fkGodownId) {
		this.fkGodownId = fkGodownId;
	}*/


	


	/*public Date getDueDate() {
		return dueDate;
	}


	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}
*/

	public String getBillType() {
		return billType;
	}


	public void setBillType(String billType) {
		this.billType = billType;
	}


	public Double getMrp() {
		return mrp;
	}


	public void setMrp(Double mrp) {
		this.mrp = mrp;
	}


	public CategoryDetailsBean getCategoryDetailsBean() {
		return categoryDetailsBean;
	}


	public void setCategoryDetailsBean(CategoryDetailsBean categoryDetailsBean) {
		this.categoryDetailsBean = categoryDetailsBean;
	}


	public SupplierDetailsBean getSupplierDetailsBean() {
		return supplierDetailsBean;
	}


	public void setSupplierDetailsBean(SupplierDetailsBean supplierDetailsBean) {
		this.supplierDetailsBean = supplierDetailsBean;
	}


	public ProductDetailsBean getProductDetailsBean() {
		return productDetailsBean;
	}


	public void setProductDetailsBean(ProductDetailsBean productDetailsBean) {
		this.productDetailsBean = productDetailsBean;
	}


	public GodownEntry getGodownEntry() {
		return godownEntry;
	}


	public void setGodownEntry(GodownEntry godownEntry) {
		this.godownEntry = godownEntry;
	}


	public Double getDiscount() {
		return discount;
	}


	public void setDiscount(Double discount) {
		this.discount = discount;
	}


	public Double getDiscountAmount() {
		return discountAmount;
	}


	public void setDiscountAmount(Double discountAmount) {
		this.discountAmount = discountAmount;
	}


	public String getBillNum() {
		return billNum;
	}


	public void setBillNum(String billNum) {
		this.billNum = billNum;
	}


	public ExpenseDetailForBillingAndGoodsReceiveBean getExpenseDetailForBillingAndGoodsReceiveBean() {
		return expenseDetailForBillingAndGoodsReceiveBean;
	}


	public void setExpenseDetailForBillingAndGoodsReceiveBean(
			ExpenseDetailForBillingAndGoodsReceiveBean expenseDetailForBillingAndGoodsReceiveBean) {
		this.expenseDetailForBillingAndGoodsReceiveBean = expenseDetailForBillingAndGoodsReceiveBean;
	}


	public Long getBarcodeNo() {
		return barcodeNo;
	}


	public void setBarcodeNo(Long barcodeNo) {
		this.barcodeNo = barcodeNo;
	}


	public String getCompanyName() {
		return companyName;
	}


	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public Long getFk_subCat_id() {
		return fk_subCat_id;
	}

	public void setFk_subCat_id(Long fk_subCat_id) {
		this.fk_subCat_id = fk_subCat_id;
	}

	public Double getWeightAftShortMinus() {
		return weightAftShortMinus;
	}

	public void setWeightAftShortMinus(Double weightAftShortMinus) {
		this.weightAftShortMinus = weightAftShortMinus;
	}



	public Long getFk_shop_id() {
		return fk_shop_id;
	}



	public void setFk_shop_id(Long fk_shop_id) {
		this.fk_shop_id = fk_shop_id;
	}



	public shopDetailsBean getShopDetailsBean() {
		return shopDetailsBean;
	}



	public void setShopDetailsBean(shopDetailsBean shopDetailsBean) {
		this.shopDetailsBean = shopDetailsBean;
	}












	public Date getPurchaseDate() {
		return purchaseDate;
	}












	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}












	public Double getPerProductTotal() {
		return perProductTotal;
	}












	public void setPerProductTotal(Double perProductTotal) {
		this.perProductTotal = perProductTotal;
	}

























	public Double getBillPaymentPending() {
		return billPaymentPending;
	}

























	public void setBillPaymentPending(Double billPaymentPending) {
		this.billPaymentPending = billPaymentPending;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}







	

	
	
	
}
