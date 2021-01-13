package com.Fertilizer.hibernate;

import java.util.Date;

public class PackingBean {

	private long packing_Id;
	private long proId;
	private String proName;
	private long fkCatId;
	private long fkSubCatId;
	private Double Weight;
	private long fkShopId;
	private long fk_type_id;
	private long packingQuantity;
	private String container;
	private Long billNo;
	
	private Long supplier;
	private Double buyPrice ;
	private Double quantity ;
	private Date inwardDate;
	private Date purchaseDate;
	private String bundel;
	private Long quantityinbundle;
	private Long length;
	private String typeoffunction;
	private String color;
	private Double micron;
	private String inwardchallanno;
	private String outwardchallanno;

	
	
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


	public Long getSupplier() {
		return supplier;
	}


	public void setSupplier(Long supplier) {
		this.supplier = supplier;
	}


	public Double getBuyPrice() {
		return buyPrice;
	}


	public void setBuyPrice(Double buyPrice) {
		this.buyPrice = buyPrice;
	}


	public Double getQuantity() {
		return quantity;
	}


	public void setQuantity(Double quantity) {
		this.quantity = quantity;
	}


	public Date getInwardDate() {
		return inwardDate;
	}


	public void setInwardDate(Date inwardDate) {
		this.inwardDate = inwardDate;
	}


	public Date getPurchaseDate() {
		return purchaseDate;
	}


	public void setPurchaseDate(Date purchaseDate) {
		this.purchaseDate = purchaseDate;
	}


	public String getBundel() {
		return bundel;
	}


	public void setBundel(String bundel) {
		this.bundel = bundel;
	}


	public Long getQuantityinbundle() {
		return quantityinbundle;
	}


	public void setQuantityinbundle(Long quantityinbundle) {
		this.quantityinbundle = quantityinbundle;
	}


	public Long getLength() {
		return length;
	}


	public void setLength(Long length) {
		this.length = length;
	}


	public String getTypeoffunction() {
		return typeoffunction;
	}


	public void setTypeoffunction(String typeoffunction) {
		this.typeoffunction = typeoffunction;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public Double getMicron() {
		return micron;
	}


	public void setMicron(Double micron) {
		this.micron = micron;
	}


	public Long getBillNo() {
		return billNo;
	}


	public void setBillNo(Long billNo) {
		this.billNo = billNo;
	}


	public long getFkCatId() {
		return fkCatId;
	}


	public void setFkCatId(long fkCatId) {
		this.fkCatId = fkCatId;
	}


	public Double getWeight() {
		return Weight;
	}


	public void setWeight(Double weight) {
		Weight = weight;
	}


	public long getFkShopId() {
		return fkShopId;
	}


	public void setFkShopId(long fkShopId) {
		this.fkShopId = fkShopId;
	}


	


	public PackingBean(long packing_Id, long proId, String proName,
			long fkCatId, long fkSubCatId, Double weight, long fkShopId,
			long fk_type_id, long packingQuantity, String container) {
		super();
		this.packing_Id = packing_Id;
		this.proId = proId;
		this.proName = proName;
		this.fkCatId = fkCatId;
		this.fkSubCatId = fkSubCatId;
		Weight = weight;
		this.fkShopId = fkShopId;
		this.fk_type_id = fk_type_id;
		this.packingQuantity = packingQuantity;
		this.container = container;
	}


	public long getPacking_Id() {
		return packing_Id;
	}


	public void setPacking_Id(long packing_Id) {
		this.packing_Id = packing_Id;
	}


	

	public long getFk_type_id() {
		return fk_type_id;
	}


	public void setFk_type_id(long fk_type_id) {
		this.fk_type_id = fk_type_id;
	}


	public String getContainer() {
		return container;
	}


	public void setContainer(String container) {
		this.container = container;
	}


	public PackingBean() {
		super();
		// TODO Auto-generated constructor stub
	}


	


	public long getPackingQuantity() {
		return packingQuantity;
	}


	public void setPackingQuantity(long packingQuantity) {
		this.packingQuantity = packingQuantity;
	}


	public long getProId() {
		return proId;
	}


	public void setProId(long proId) {
		this.proId = proId;
	}


	public String getProName() {
		return proName;
	}


	public void setProName(String proName) {
		this.proName = proName;
	}


	public long getFkSubCatId() {
		return fkSubCatId;
	}


	public void setFkSubCatId(long fkSubCatId) {
		this.fkSubCatId = fkSubCatId;
	}
	
	
	
	
}