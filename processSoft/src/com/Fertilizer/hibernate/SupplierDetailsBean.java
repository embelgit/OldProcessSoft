package com.Fertilizer.hibernate;

public class SupplierDetailsBean {

	private long supId;
	private String dealerName;
	private String personName;
	private String idNo;
	private String city;
	private Long contactNo;
	private Long landline;
	private String emailId;
	private String tinNo;
	private String address;
	
	
	
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getSupId() {
		return supId;
	}
	public void setSupId(long supId) {
		this.supId = supId;
	}
	public String getDealerName() {
		return dealerName;
	}
	public void setDealerName(String dealerName) {
		this.dealerName = dealerName;
	}
	public String getPersonName() {
		return personName;
	}
	public void setPersonName(String personName) {
		this.personName = personName;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public long getContactNo() {
		return contactNo;
	}
	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}
	public long getLandline() {
		return landline;
	}
	public void setLandline(long landline) {
		this.landline = landline;
	}
	
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public String getTinNo() {
		return tinNo;
	}
	public void setTinNo(String tinNo) {
		this.tinNo = tinNo;
	} 
	
	
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	
	public SupplierDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public SupplierDetailsBean(long supId, String dealerName,
			String personName, String idNo, String city, long contactNo,
			 String emailId, String tinNo, String address, Long landline, Long userId, String username,
				Long shopId, String shopName) {
		super();
		this.supId = supId;
		this.dealerName = dealerName;
		this.personName = personName;
		this.idNo = idNo;
		this.city = city;
		this.contactNo = contactNo;		
		this.landline = landline;
		this.emailId = emailId;
		this.tinNo = tinNo;
		this.address = address;
		this.userId = userId;
		this.username = username;
		this.shopId = shopId;
		this.shopName = shopName;
	}
	
	
	
	}
