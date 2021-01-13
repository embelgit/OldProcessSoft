package com.Fertilizer.hibernate;

public class Packing_InfoBean {
	
	private long packing_Id;
	private long unit_Id;
	private String containerName;
	private String extraPacking;
	private String unitName;
	private String packing_Type;
	private String Upadatedate;
	private double quantity;
	
	
	public long getPacking_Id() {
		return packing_Id;
	}

	public void setPacking_Id(long packing_Id) {
		this.packing_Id = packing_Id;
	}

	public String getPacking_Type() {
		return packing_Type;
	}

	public void setPacking_Type(String packing_Type) {
		this.packing_Type = packing_Type;
	}

	public Packing_InfoBean() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Packing_InfoBean(long packing_Id, long unit_Id,
			String containerName, String extraPacking, String packing_Type) {
		super();
		this.packing_Id = packing_Id;
		this.unit_Id = unit_Id;
		this.containerName = containerName;
		this.extraPacking = extraPacking;
		this.packing_Type = packing_Type;
	}

	public long getUnit_Id() {
		return unit_Id;
	}

	public void setUnit_Id(long unit_Id) {
		this.unit_Id = unit_Id;
	}

	public String getContainerName() {
		return containerName;
	}

	public void setContainerName(String containerName) {
		this.containerName = containerName;
	}

	public String getExtraPacking() {
		return extraPacking;
	}

	public void setExtraPacking(String extraPacking) {
		this.extraPacking = extraPacking;
	}

	public String getUnitName() {
		return unitName;
	}

	public void setUnitName(String unitName) {
		this.unitName = unitName;
	}

	public String getUpadatedate() {
		return Upadatedate;
	}

	public void setUpadatedate(String upadatedate) {
		Upadatedate = upadatedate;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	
		
}
