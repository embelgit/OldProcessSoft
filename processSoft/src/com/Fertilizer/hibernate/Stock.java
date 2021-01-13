package com.Fertilizer.hibernate;

import java.util.Date;


public class Stock {

	
	public long PkStockId;
	/*ublic long catID;
	public long subCatId;
	public long fk_shop_id;*/
	public String productName;
	public long getPkStockId() {
		return PkStockId;
	}




	public void setPkStockId(long pkStockId) {
		PkStockId = pkStockId;
	}




	public String companyName;
	public double weight;
	private double quantityinkg;
	private double quantityinbundle;
	private double unpackedQuantity;
	//private String batchNum;
	private java.util.Date UpdateDate;
	

	

	public Stock() {
		super();
		// TODO Auto-generated constructor stub
	}




	public Stock(String productName, String companyName, double weight,
			double quantityinkg, double quantityinbundle,
			double unpackedQuantity, Date updateDate) {
		super();
		this.productName = productName;
		this.companyName = companyName;
		this.weight = weight;
		this.quantityinkg = quantityinkg;
		this.quantityinbundle = quantityinbundle;
		this.unpackedQuantity = unpackedQuantity;
		UpdateDate = updateDate;
	}




	public String getProductName() {
		return productName;
	}




	public void setProductName(String productName) {
		this.productName = productName;
	}




	public String getCompanyName() {
		return companyName;
	}




	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}




	public double getWeight() {
		return weight;
	}




	public void setWeight(double weight) {
		this.weight = weight;
	}




	public double getQuantityinkg() {
		return quantityinkg;
	}




	public void setQuantityinkg(double quantityinkg) {
		this.quantityinkg = quantityinkg;
	}




	public double getQuantityinbundle() {
		return quantityinbundle;
	}




	public void setQuantityinbundle(double quantityinbundle) {
		this.quantityinbundle = quantityinbundle;
	}




	public double getUnpackedQuantity() {
		return unpackedQuantity;
	}




	public void setUnpackedQuantity(double unpackedQuantity) {
		this.unpackedQuantity = unpackedQuantity;
	}




	public java.util.Date getUpdateDate() {
		return UpdateDate;
	}




	public void setUpdateDate(java.util.Date updateDate) {
		UpdateDate = updateDate;
	}




	public void setBatchNum(String string) {
		// TODO Auto-generated method stub
		
	}


}
