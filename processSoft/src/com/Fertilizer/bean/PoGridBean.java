package com.Fertilizer.bean;

public class PoGridBean {

	private String productName;
	private Double Total;
	private String operationName;
	private String unitName;
	private Double buyPrice;
   private Double quantity;
   private String hsn;
   private Double okquantity;
   private Double rejectedquantity;
   private Double unprocessquantity;
   private String dupQuantity;
   
   private String challanno;
   
   
   
   
	public String getChallanno() {
	return challanno;
}

public void setChallanno(String challanno) {
	this.challanno = challanno;
}

	public String getDupQuantity() {
	return dupQuantity;
}

public void setDupQuantity(String dupQuantity) {
	this.dupQuantity = dupQuantity;
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

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getOperationName() {
		return operationName;
	}

	public void setOperationName(String operationName) {
		this.operationName = operationName;
	}

	public Double getTotal() {
		return Total;
	}

	public void setTotal(Double total) {
		Total = total;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getHsn() {
		return hsn;
	}

	public void setHsn(String hsn) {
		this.hsn = hsn;
	}

	public Double getOkquantity() {
		return okquantity;
	}

	public void setOkquantity(Double okquantity) {
		this.okquantity = okquantity;
	}

	public Double getRejectedquantity() {
		return rejectedquantity;
	}

	public void setRejectedquantity(Double rejectedquantity) {
		this.rejectedquantity = rejectedquantity;
	}

	public Double getUnprocessquantity() {
		return unprocessquantity;
	}

	public void setUnprocessquantity(Double unprocessquantity) {
		this.unprocessquantity = unprocessquantity;
	}
	
}
