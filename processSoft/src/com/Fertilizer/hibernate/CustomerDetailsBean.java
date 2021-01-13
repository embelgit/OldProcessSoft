package com.Fertilizer.hibernate;

import java.io.Serializable;


public class CustomerDetailsBean implements Serializable{

	private long custId;
	private String firstName;
	private String idNo;
	private String middleName;
	private String lastName;
	private String address;
	private long contactNo;
	private String emailId;
	private long zipCode;
	private String gstNo;
	
	
	
	public String getGstNo() {
		return gstNo;
	}
	public void setGstNo(String gstNo) {
		this.gstNo = gstNo;
	}
	public long getCustId() {
		return custId;
	}
	public void setCustId(long custId) {
		this.custId = custId;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getMiddleName() {
		return middleName;
	}
	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public long getContactNo() {
		return contactNo;
	}
	public void setContactNo(long contactNo) {
		this.contactNo = contactNo;
	}
	public String getEmailId() {
		return emailId;
	}
	public void setEmailId(String emailId) {
		this.emailId = emailId;
	}
	public long getZipCode() {
		return zipCode;
	}
	public void setZipCode(long zipCode) {
		this.zipCode = zipCode;
	}
	
	
	
	
	public CustomerDetailsBean(long custId, String firstName, String idNo,
			String middleName, String lastName, String address, long contactNo,
			String emailId, long zipCode, String gstNo) {
		super();
		this.custId = custId;
		this.firstName = firstName;
		this.idNo = idNo;
		this.middleName = middleName;
		this.lastName = lastName;
		this.address = address;
		this.contactNo = contactNo;
		this.emailId = emailId;
		this.zipCode = zipCode;
		this.gstNo = gstNo;
	}
	public CustomerDetailsBean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getIdNo() {
		return idNo;
	}
	public void setIdNo(String idNo) {
		this.idNo = idNo;
	}
	




	
	
	
}
