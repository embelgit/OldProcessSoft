package com.Fertilizer.helper;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.omg.CORBA.Request;

import com.Fertilizer.bean.GetCreditCustomerDetails;
import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.dao.CustomerDetailsDao;
import com.Fertilizer.dao.SupplierAccountDetailsDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.CustomerDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class CustomerDetailsHelper {
	
	public void customerDetails(HttpServletRequest request, HttpServletResponse response ){

		System.out.println("In helper");
		
		String address = request.getParameter("address");
		
		String contactNo = request.getParameter("contactNo");
		
		String emailId = request.getParameter("emailId");
		
		String firstName = request.getParameter("firstName");
		
		String lastName = request.getParameter("lastName");
		
		String middleName = request.getParameter("middleName");
		
		String zipCode = request.getParameter("zipCode");
		
		String IdNo = request.getParameter("IdNo");
		
		String gstNo = request.getParameter("gstNo");
		
		/*String aadhar = request.getParameter("aadhar");
		System.out.println(aadhar+"aadhar number");*/
		
		CustomerDetailsBean cdb = new CustomerDetailsBean();
		
				
				
			if(!"".equals(contactNo)){
					cdb.setContactNo(Long.parseLong(contactNo));
			} else
			{
				cdb.setContactNo(Long.parseLong("00"));
			}
				

				if(!"".equals(zipCode)){
					cdb.setZipCode(Long.parseLong(zipCode));
			} else
			{
				cdb.setZipCode(Long.parseLong("00"));
			}
				
				/*if(!"".equals(aadhar)){
					cdb.setAadhar(Long.parseLong(aadhar));
			} else
			{
				cdb.setAadhar(0l);
			}*/
				if(!"".equals(emailId)){
					cdb.setEmailId(emailId);
			} else
			{
				cdb.setEmailId("N/A");
			}
				cdb.setFirstName(firstName);
				
			if(!"".equals(middleName)){
					cdb.setMiddleName(middleName);
			} else
			{
				cdb.setMiddleName("N/A");
			}
			
			if(!"".equals(lastName)){
				cdb.setLastName(lastName);
		} else
		{
			cdb.setLastName("N/A");
		}
			if(!"".equals(address)){
				cdb.setAddress(address);
		} else
		{
			cdb.setAddress("N/A");
		}
				cdb.setAddress(address);
				cdb.setIdNo(IdNo);
				cdb.setGstNo(gstNo);
				
				CustomerDetailsDao cdo = new CustomerDetailsDao();
				cdo.valCustomerDetails(cdb);
	}
	
	
	
	public Map getVillage(String creditCustomerId) {
		
		CustomerDetailsDao dao = new CustomerDetailsDao();
		List list = dao.getVillageByCustomerName(creditCustomerId);
		Map  map =  new HashMap();
		
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			bean.setVillage(o[0].toString());
			bean.setFirstName(o[1].toString());
			bean.setContactNo((BigInteger)o[2]);
			bean.setGstNo(o[3].toString());
			bean.setIdNo(o[4].toString());
			System.out.println("***************"+o[0]);
			map.put(bean.getVillage(),bean);
		}
		return map;
	}

	
public void deleteCustomer(HttpServletRequest request, HttpServletResponse response ) {
		
	String custName = request.getParameter("delCustName");
	   
		CustomerDetailsDao dao = new CustomerDetailsDao();
		dao.deletCustomer(custName);
		
	}


	public Map getAllBillByCustomers(String fkCustomerId, String catId) {

		CustomerDetailsDao dao = new CustomerDetailsDao();
		List list= dao.getAllBillByCreditCustomer(fkCustomerId,catId);
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			System.out.println(Arrays.toString(o));
			bean.setBillNo((BigInteger)o[0]);
			bean.setInsertDate(o[1].toString());
			System.out.println("***************"+o[0]);
			map.put(bean.getBillNo(),bean);
			
		}
		return map;
	
	}



	public Map getTotalAmtByBillNo( String creditCustomer) {

		CustomerDetailsDao dao = new CustomerDetailsDao();
		List list= dao.getTotalAmountByBill(creditCustomer);
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			Object[] o = (Object[])list.get(i);
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			System.out.println(Arrays.toString(o));
			String total = o[0].toString();
			Double total1 = Double.valueOf(total);
			System.out.println(total1);
			bean.setTotalAmount(total1);
			//bean.setInsertDate(o[1].toString());
			System.out.println("***************"+o[0]);
			System.out.println("Ih helper method getTotal");
			map.put(bean.getBillNo(),bean);
			
		}
		return map;
	
	
	}



	public Map getBalanceAmtByBillNo( String totalAmount1, String creditCustomer, String catId) {

		CustomerDetailsDao dao = new CustomerDetailsDao();
		List list= dao.getRemainingBalanceAmountByBill(creditCustomer,catId);
		Map  map =  new HashMap();
		System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if(sic==0)
		{
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			Double totalAmt = dao.getTotalAmt(creditCustomer);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(),bean);
		}
		else {
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			Double pageTota = Double.valueOf(totalAmount1);
			Double TotalPaid=0d;
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				Double Paid = (Double.parseDouble(o[0].toString()));
				TotalPaid=TotalPaid+Paid;
				String prevTota = (o[1].toString());
				
				Double prevTota1 = Double.valueOf(prevTota);
				
				System.out.println("page total"+pageTota);
				System.out.println("Paid total"+TotalPaid);
			}
		
					Double diff=pageTota-TotalPaid;
					
					
					System.out.println("Balance"+diff);
					
					bean.setBalance(diff);
				
				map.put(bean.getBalance(),bean);
			
		}
		
		return map;

	}
	
	
	//get balance by after payment vendor wise 

	public Map getRemainingBalanceAmtByVendorPayment( String totalAmount1, String creditCustomer, String catId) {

		CustomerDetailsDao dao = new CustomerDetailsDao();
		List list= dao.getRemainingBalanceAmountByBill(creditCustomer,catId);
		Map  map =  new HashMap();
		System.out.println(list.size()+"LIST SIZE");
		int sic = list.size();
		if(sic==0)
		{
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			Double totalAmt = dao.getTotalAmt(creditCustomer);
			bean.setBalance(totalAmt);
			map.put(bean.getBalance(),bean);
		}
		else {
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			Double pageTota = Double.valueOf(totalAmount1);
			Double TotalPaid=0d;
			for(int i=0;i<list.size();i++)
			{
				Object[] o = (Object[])list.get(i);
				Double Paid = (Double.parseDouble(o[0].toString()));
				TotalPaid=TotalPaid+Paid;
				String prevTota = (o[1].toString());
				
				Double prevTota1 = Double.valueOf(prevTota);
				
				System.out.println("page total"+pageTota);
				System.out.println("Paid total"+TotalPaid);
			}
		
					Double diff=pageTota-TotalPaid;
					
					
					System.out.println("Balance"+diff);
					
					bean.setBalance(diff);
				
				map.put(bean.getBalance(),bean);
			
		}
		
		return map;

	}



	public Map getCreditCustomerDetailsForEdit(Long customerId) {
		
	 	System.out.println("into helper class");
	 	CustomerDetailsDao dao1 = new CustomerDetailsDao();
		List catList = dao1.getCreditCustomerForEdit(customerId);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
			GetCreditCustomerDetails bean = new GetCreditCustomerDetails();
			 bean.setFirstName(o[0].toString());
			 bean.setMiddleName(o[1].toString());
			 bean.setLastName(o[2].toString());
			 bean.setEmail(o[3].toString());
			 bean.setAddress(o[4].toString());
			 bean.setContactNo((BigInteger)o[5]);
			 bean.setZipCode((BigInteger)o[6]);
			 bean.setGstNo(o[7].toString());
			 bean.setIdNo(o[8].toString());
				
			
			
			map.put(bean.getFirstName(),bean);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	
	}



	public void editCreditCustomer(HttpServletRequest request,
			HttpServletResponse response) {

		System.out.println("in EditEmployee helper");
		
		String strcustomerId = request.getParameter("customerId");
		
		String firstName = request.getParameter("firstName");
		String middleName = request.getParameter("middleName");
		String lastName = request.getParameter("lastName");
		
		String address = request.getParameter("address");
		String contactNo = request.getParameter("contactNo");
		String aadharNo = request.getParameter("aadharNo");
		
		String emailId = request.getParameter("emailId");
		String zipCode = request.getParameter("zipCode");
		
		String IdNo = request.getParameter("IdNo");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long customerId =Long.parseLong(strcustomerId);
		CustomerDetailsBean det = (CustomerDetailsBean) session.get(CustomerDetailsBean.class, customerId);
		
		det.setFirstName(firstName);
		det.setMiddleName(middleName);
		det.setLastName(lastName);
		
		det.setAddress(address);
		det.setContactNo(Long.parseLong(contactNo));
		/*det.setgstNo(Long.parseLong(aadharNo));*/
		det.setEmailId(emailId);
		det.setZipCode(Long.parseLong(zipCode));
		det.setIdNo((IdNo));
  	
	    session.saveOrUpdate(det);
		transaction.commit();
		
		System.out.println("Record updated successfully.");
	
	
	}


	public Map getCustName(String fk_cust_id) {
	    
		int count=1;
		System.out.println("IN HELPER");
		/*String fk_cat_id = request.getParameter("fk_cat_id");
		
		System.out.println("=== == ==="+fk_cat_id);
		
		
		SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
		
		scdb.setFk_cat_id(Long.parseLong(fk_cat_id));*/
		
		CustomerDetailsDao cdd = new CustomerDetailsDao();
		List list=cdd.getCustName(fk_cust_id);
		
		System.out.println("list ======"+list.size());
		Map  map =  new HashMap();
		for(int i=0;i<list.size();i++)
		{
			System.out.println("IN HELPER");
			Object[] o = (Object[])list.get(i);
			CustomerDetailsBean bean = new CustomerDetailsBean();
			System.out.println(Arrays.toString(o));
			bean.setCustId(Long.parseLong(o[0].toString()));
			bean.setFirstName(o[1].toString());
			bean.setLastName(o[2].toString());
			System.out.println("***************"+o[0]);
			map.put(count,bean);
			count++;
		}
		return map;

	}

	
	
	


}
