package com.Fertilizer.hibernate;

import java.io.Serializable;
import java.util.Date;

public class MeasuringUnitsBean implements Serializable {
			private Long pkUnitId;
			private String unitName;
			private Date insertDate;
			private String unitDescription;
			
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
			public String getUnitDescription() {
				return unitDescription;
			}
			public void setUnitDescription(String unitDescription) {
				this.unitDescription = unitDescription;
			}
			public Date getInsertDate() {
				return insertDate;
			}
			public void setInsertDate(Date insertDate) {
				this.insertDate = insertDate;
			}
			public Long getPkUnitId() {
				return pkUnitId;
			}
			public void setPkUnitId(Long pkUnitId) {
				this.pkUnitId = pkUnitId;
			}
			public String getUnitName() {
				return unitName;
			}
			public void setUnitName(String unitName) {
				this.unitName = unitName;
			}
			
			public MeasuringUnitsBean(Long pkUnitId, String unitName,
					Date insertDate, Long userId, String username, Long shopId, String shopName) {
				super();
				this.pkUnitId = pkUnitId;
				this.unitName = unitName;
				this.insertDate = insertDate;
				this.userId = userId;
				this.username = username;
				this.shopId = shopId;
				this.shopName = shopName;
			}
			public MeasuringUnitsBean() {
				super();
			}
			@Override
			public String toString() {
				return "MeasuringUnitsBean [pkUnitId=" + pkUnitId + ", unitName=" + unitName + ", insertDate="
						+ insertDate + ", unitDescription=" + unitDescription + ", userId=" + userId + ", username="
						+ username + ", shopId=" + shopId + ", shopName=" + shopName + "]";
			}
			
			
	
	
}
