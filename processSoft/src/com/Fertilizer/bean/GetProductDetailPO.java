package com.Fertilizer.bean;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.Date;

public class GetProductDetailPO {

			private BigInteger productID;
			private BigInteger SupplierId;
			private String productName;
			private BigDecimal buyPrice;
			private BigDecimal salePrice;
			private Long quantity;
			private BigDecimal weight;
			private String batchNo;
			private String expireDate;
			private BigDecimal quantityForBatchNo;
			private BigDecimal mrp;
			private BigDecimal taxPercentage;
			private Date date;
			private String manufacturer;
			private String unitName;
			private String catId;
			private String taxName;
			private BigInteger catIDforVAt;
			private String hsn;
			private BigDecimal gst;
			private BigDecimal igst;
			private BigDecimal dcNum; 
			private BigDecimal weightAftShortMinus;
			/*private BigInteger fk_unit_i;*/
			
			
			/*public BigInteger getFk_unit_id() {
				return fk_unit_id;
			}
			public void setFk_unit_id(BigInteger fk_unit_id) {
				this.fk_unit_id = fk_unit_id;
			}*/
			
			
			
			public String getBatchNo() {
				return batchNo;
			}
			public BigInteger getCatIDforVAt() {
				return catIDforVAt;
			}
			public void setCatIDforVAt(BigInteger catIDforVAt) {
				this.catIDforVAt = catIDforVAt;
			}
			public String getUnitName() {
				return unitName;
			}
			public void setUnitName(String unitName) {
				this.unitName = unitName;
			}
			public BigDecimal getMrp() {
				return mrp;
			}
			public void setMrp(BigDecimal mrp) {
				this.mrp = mrp;
			}
			
			public BigDecimal getGst() {
				return gst;
			}
			public void setGst(BigDecimal gst) {
				this.gst = gst;
			}
			public BigDecimal getIgst() {
				return igst;
			}
			public void setIgst(BigDecimal igst) {
				this.igst = igst;
			}
			public void setBatchNo(String batchNo) {
				this.batchNo = batchNo;
			}
			public String getExpireDate() {
				return expireDate;
			}
			public void setExpireDate(String expireDate) {
				this.expireDate = expireDate;
			}
			public BigDecimal getWeight() {
				return weight;
			}
			public void setWeight(BigDecimal weight) {
				this.weight = weight;
			}
			public BigInteger getProductID() {
				return productID;
			}
			public void setProductID(BigInteger productID) {
				this.productID = productID;
			}
			public BigInteger getSupplierId() {
				return SupplierId;
			}
			public void setSupplierId(BigInteger supplierId) {
				SupplierId = supplierId;
			}
			public String getProductName() {
				return productName;
			}
			public void setProductName(String productName) {
				this.productName = productName;
			}
			public BigDecimal getBuyPrice() {
				return buyPrice;
			}
			public void setBuyPrice(BigDecimal buyPrice) {
				this.buyPrice = buyPrice;
			}
			public BigDecimal getSalePrice() {
				return salePrice;
			}
			public void setSalePrice(BigDecimal salePrice) {
				this.salePrice = salePrice;
			}
			public Long getQuantity() {
				return quantity;
			}
			public void setQuantity(Long quantity) {
				this.quantity = quantity;
			}
			public BigDecimal getQuantityForBatchNo() {
				return quantityForBatchNo;
			}
			public void setQuantityForBatchNo(BigDecimal quantityForBatchNo) {
				this.quantityForBatchNo = quantityForBatchNo;
			}
			public Date getDate() {
				return date;
			}
			public void setDate(Date date) {
				this.date = date;
			}
			public String getManufacturer() {
				return manufacturer;
			}
			public void setManufacturer(String manufacturer) {
				this.manufacturer = manufacturer;
			}
			public String getCatId() {
				return catId;
			}
			public void setCatId(String catId) {
				this.catId = catId;
			}
			public String getHsn() {
				return hsn;
			}
			public void setHsn(String hsn) {
				this.hsn = hsn;
			}
			public String getTaxName() {
				return taxName;
			}
			public void setTaxName(String taxName) {
				this.taxName = taxName;
			}
			public BigDecimal getTaxPercentage() {
				return taxPercentage;
			}
			public void setTaxPercentage(BigDecimal taxPercentage) {
				this.taxPercentage = taxPercentage;
			}
			public BigDecimal getDcNum() {
				return dcNum;
			}
			public void setDcNum(BigDecimal dcNum) {
				this.dcNum = dcNum;
			}
			public BigDecimal getWeightAftShortMinus() {
				return weightAftShortMinus;
			}
			public void setWeightAftShortMinus(BigDecimal weightAftShortMinus) {
				this.weightAftShortMinus = weightAftShortMinus;
			}
			
						

			
			
	
}
