package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class ProductDetailsBean implements Serializable {

				private Long prodctId;
				private Long fk_cat_id;
				
				private Long fk_supplier_id;
				private Long fk_unit_id;
				private Long poNumber;
				private String productName;
				private String updateDate;
				private String manufacturingCompany;
				private Long fk_subCat_id;
				//private Long fk_shop_id;
				
				private Double buyPrice;
				private Double salePrice;
				private String idNo;
				
				





				//private String unitName;
				/*private Double creditSalePrice;*/
				private Double weight;
				private Date insertDate;
				private Long status;
				private Long fkTaxId;
				private Double taxPercentage;
				private Double mrp;
				private Double quantity;
				private Double unpackedQuantity;
				private Double packedQuantity;
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
				public Double getQuantity() {
					return quantity;
				}
				public void setQuantity(Double quantity) {
					this.quantity = quantity;
				}
				public Double getUnpackedQuantity() {
					return unpackedQuantity;
				}
				public void setUnpackedQuantity(Double unpackedQuantity) {
					this.unpackedQuantity = unpackedQuantity;
				}
				public Double getPackedQuantity() {
					return packedQuantity;
				}
				public void setPackedQuantity(Double packedQuantity) {
					this.packedQuantity = packedQuantity;
				}





				private String hsn;
				//for mapping 
				private CategoryDetailsBean categoryDetailsBean;
				private SupplierDetailsBean supplierDetailsBean;
			/*	private MeasuringUnitsBean MeasuringUnitsBean;*/
				private TaxCreationBean taxCreationBean;
				//private SubCategoryDetailsBean subcategoryDetailsBean;
				
				



				public Long getFkTaxId() {
					return fkTaxId;
				}
				public ProductDetailsBean() {
					super();
					// TODO Auto-generated constructor stub
				}
				
				public ProductDetailsBean(Long prodctId, Long fk_cat_id, Long fk_supplier_id, Long fk_unit_id,
						Long poNumber, String productName, String updateDate, String manufacturingCompany,
						Long fk_subCat_id, Double buyPrice, Double salePrice, String unitName,
						Double weight, Date insertDate, Long status, Long fkTaxId, Double taxPercentage, Double mrp,
						Double quantity, Double unpackedQuantity, Double packedQuantity, String hsn,
						CategoryDetailsBean categoryDetailsBean, SupplierDetailsBean supplierDetailsBean,
						TaxCreationBean taxCreationBean, String idNo, Long userId, String username, Long shopId, String shopName) {
					super();
					this.prodctId = prodctId;
					this.fk_cat_id = fk_cat_id;
					this.fk_supplier_id = fk_supplier_id;
					this.fk_unit_id = fk_unit_id;
					this.poNumber = poNumber;
					this.productName = productName;
					this.idNo = idNo;
					this.updateDate = updateDate;
					this.manufacturingCompany = manufacturingCompany;
					this.fk_subCat_id = fk_subCat_id;
					//this.fk_shop_id = fk_shop_id;
					this.buyPrice = buyPrice;
					this.salePrice = salePrice;
					//this.unitName = unitName;
					this.weight = weight;
					this.insertDate = insertDate;
					this.status = status;
					this.fkTaxId = fkTaxId;
					this.taxPercentage = taxPercentage;
					this.mrp = mrp;
					this.quantity = quantity;
					this.unpackedQuantity = unpackedQuantity;
					this.packedQuantity = packedQuantity;
					this.hsn = hsn;
					this.categoryDetailsBean = categoryDetailsBean;
					this.supplierDetailsBean = supplierDetailsBean;
					this.taxCreationBean = taxCreationBean;
					this.userId = userId;
					this.username = username;
					this.shopId = shopId;
					this.shopName = shopName;
				}
				
				/*public String getUnitName() {
					return unitName;
				}
				public void setUnitName(String unitName) {
					this.unitName = unitName;
				}*/
				public void setFkTaxId(Long fkTaxId) {
					this.fkTaxId = fkTaxId;
				}
				public Double getTaxPercentage() {
					return taxPercentage;
				}
				public void setTaxPercentage(Double taxPercentage) {
					this.taxPercentage = taxPercentage;
				}
				public Double getMrp() {
					return mrp;
				}
				public void setMrp(Double mrp) {
					this.mrp = mrp;
				}
				public TaxCreationBean getTaxCreationBean() {
					return taxCreationBean;
				}
				public void setTaxCreationBean(TaxCreationBean taxCreationBean) {
					this.taxCreationBean = taxCreationBean;
				}
				/*public Double getCreditSalePrice() {
					return creditSalePrice;
				}
				public void setCreditSalePrice(Double creditSalePrice) {
					this.creditSalePrice = creditSalePrice;
				}*/
				public Long getProdctId() {
					return prodctId;
				}
				public void setProdctId(Long prodctId) {
					this.prodctId = prodctId;
				}
				public Long getFk_cat_id() {
					return fk_cat_id;
				}
				public void setFk_cat_id(Long fk_cat_id) {
					this.fk_cat_id = fk_cat_id;
				}
				public Long getFk_supplier_id() {
					return fk_supplier_id;
				}
				public void setFk_supplier_id(Long fk_supplier_id) {
					this.fk_supplier_id = fk_supplier_id;
				}
				public Long getFk_unit_id() {
					return fk_unit_id;
				}
				public void setFk_unit_id(Long fk_unit_id) {
					this.fk_unit_id = fk_unit_id;
				}
				public Long getPoNumber() {
					return poNumber;
				}
				public void setPoNumber(Long poNumber) {
					this.poNumber = poNumber;
				}
				public String getProductName() {
					return productName;
				}
				public void setProductName(String productName) {
					this.productName = productName;
				}
				public String getIdNo() {
					return idNo;
				}
				public void setIdNo(String idNo) {
					this.idNo = idNo;
				}
				public String getManufacturingCompany() {
					return manufacturingCompany;
				}
				public void setManufacturingCompany(String manufacturingCompany) {
					this.manufacturingCompany = manufacturingCompany;
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
				public Date getInsertDate() {
					return insertDate;
				}
				public void setInsertDate(Date insertDate) {
					this.insertDate = insertDate;
				}
				public Long getStatus() {
					return status;
				}
				public void setStatus(Long status) {
					this.status = status;
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
				/*public MeasuringUnitsBean getMeasuringUnitsBean() {
					return MeasuringUnitsBean;
				}
				public void setMeasuringUnitsBean(MeasuringUnitsBean measuringUnitsBean) {
					MeasuringUnitsBean = measuringUnitsBean;
				}*/
				public Long getFk_subCat_id() {
					return fk_subCat_id;
				}
				public void setFk_subCat_id(Long fk_subCat_id) {
					this.fk_subCat_id = fk_subCat_id;
				}
			/*	public SubCategoryDetailsBean getSubcategoryDetailsBean() {
					return subcategoryDetailsBean;
				}
				public void setSubcategoryDetailsBean(
						SubCategoryDetailsBean subcategoryDetailsBean) {
					this.subcategoryDetailsBean = subcategoryDetailsBean;
				}*/


				/*public Long getFk_shop_id() {
					return fk_shop_id;
				}


				public void setFk_shop_id(Long fk_shop_id) {
					this.fk_shop_id = fk_shop_id;
				}*/





				public String getHsn() {
					return hsn;
				}





				public void setHsn(String hsn) {
					this.hsn = hsn;
				}
				public String getUpdateDate() {
					return updateDate;
				}
				public void setUpdateDate(String updateDate) {
					this.updateDate = updateDate;
				}





				
				
				
			


}
