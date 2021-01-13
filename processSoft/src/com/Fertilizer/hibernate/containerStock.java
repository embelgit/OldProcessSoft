package com.Fertilizer.hibernate;

import java.util.Date;


public class containerStock {

	
	public long PkContainerStockId;
	public String containerName;
	public long capacity;
	public String unit;
	public String companyName;
	private double quantity;
	private java.util.Date UpdateDate;
	

	

	public containerStock() {
		super();
		// TODO Auto-generated constructor stub
	}




	public containerStock(long pkContainerStockId, String containerName,
			long capacity, String unit, String companyName, double quantity,
			Date updateDate) {
		super();
		PkContainerStockId = pkContainerStockId;
		this.containerName = containerName;
		this.capacity = capacity;
		this.unit = unit;
		this.companyName = companyName;
		this.quantity = quantity;
		UpdateDate = updateDate;
	}




	public long getPkContainerStockId() {
		return PkContainerStockId;
	}




	public void setPkContainerStockId(long pkContainerStockId) {
		PkContainerStockId = pkContainerStockId;
	}




	public String getContainerName() {
		return containerName;
	}




	public void setContainerName(String containerName) {
		this.containerName = containerName;
	}




	public long getCapacity() {
		return capacity;
	}




	public void setCapacity(long capacity) {
		this.capacity = capacity;
	}




	public String getUnit() {
		return unit;
	}




	public void setUnit(String unit) {
		this.unit = unit;
	}




	public String getCompanyName() {
		return companyName;
	}




	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}




	public double getQuantity() {
		return quantity;
	}




	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}




	public java.util.Date getUpdateDate() {
		return UpdateDate;
	}




	public void setUpdateDate(java.util.Date updateDate) {
		UpdateDate = updateDate;
	}



	
	
	
	
}
