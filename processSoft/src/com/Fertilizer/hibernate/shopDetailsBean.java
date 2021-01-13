package com.Fertilizer.hibernate;

public class shopDetailsBean {
				
				private Long pk_shop_id;
				private long shopId;
				private String shopName;
				public shopDetailsBean() {
					super();
					// TODO Auto-generated constructor stub
				}
				public Long getPk_shop_id() {
					return pk_shop_id;
				}
				public void setPk_shop_id(Long pk_shop_id) {
					this.pk_shop_id = pk_shop_id;
				}
				public shopDetailsBean(long shopId, String shopName) {
					super();
					this.shopId = shopId;
					this.shopName = shopName;
				}
				public long getShopId() {
					return shopId;
				}
				public void setShopId(long shopId) {
					this.shopId = shopId;
				}
				public String getShopName() {
					return shopName;
				}
				public void setShopName(String shopName) {
					this.shopName = shopName;
				}
				
				
				
}		
				