package com.Fertilizer.helper;

import java.math.BigInteger;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.Fertilizer.bean.GetSupplierDetails;
import com.Fertilizer.bean.PoDetailsBean1;
import com.Fertilizer.bean.SupplierGridBean;
import com.Fertilizer.dao.PoDetailsDao;
import com.Fertilizer.dao.SupplierDetailsDao;
import com.Fertilizer.hibernate.PoDetailsBean;
import com.Fertilizer.hibernate.SupplierDetailsBean;
import com.Fertilizer.utility.HibernateUtility;

public class SupplierDetailsHelper {

	public void supplierDetails(HttpServletRequest request, HttpServletResponse response) {

		System.out.println("In helper");
		
		
		String dealerName = request.getParameter("dealerName");
		String personName = request.getParameter("personName");		
		String contactNo = request.getParameter("contactNo");
		String landline = request.getParameter("landline");
		String emailId = request.getParameter("emailId");
		String tinNo = request.getParameter("tinNo");
		String city = request.getParameter("city");
		String address = request.getParameter("address");
		String IdNo = request.getParameter("IdNo");
		
		System.out.println("IN HELPER dealerName= "+dealerName);
		System.out.println("IN HELPER personName= "+personName);
		System.out.println("IN HELPER contactNo= "+contactNo);
		System.out.println("IN HELPER landline= "+landline);
		System.out.println("IN HELPER emailId= "+emailId);
		System.out.println("IN HELPER tinNo= "+tinNo);
		System.out.println("IN HELPER city= "+city);
		System.out.println("IN HELPER address= "+address);
		System.out.println("IN HELPER IdNo= "+IdNo);
		
		
		
		SupplierDetailsBean sdb = new SupplierDetailsBean();
		
		
		if(!"".equals(dealerName)){
			sdb.setDealerName(dealerName);;
		} else {
			sdb.setDealerName("N/A");
		}
		if(!"".equals(personName)){
			sdb.setPersonName(personName);
		} else {
			sdb.setPersonName(personName);
		}
		if(!"".equals(contactNo)){
			sdb.setContactNo(Long.parseLong(contactNo));
		} else {
			sdb.setContactNo(Long.parseLong("00"));
		}
		if(!"".equals(landline)){
			sdb.setLandline(Long.parseLong(landline));
		} else {
			sdb.setLandline(Long.parseLong("00"));
		}
		if(!"".equals(emailId)){
			sdb.setEmailId(emailId);
		} else {
			sdb.setEmailId("N/A");
		}
		if(!"".equals(tinNo)){
			sdb.setTinNo(tinNo);
		} else {
			sdb.setTinNo("N/A");
		}
		if(!"".equals(city)){
			sdb.setCity(city);
		} else {
			sdb.setCity("N/A");
		}
		if(!"".equals(address)){
			sdb.setAddress(address);
		} else {
			sdb.setAddress("N/A");
		}
		if(!"".equals(IdNo)){
			sdb.setIdNo(IdNo);
		} else {
			sdb.setIdNo("N/A");
		}
		
		HttpSession session = request.getSession(true);
		String username = (String)session.getAttribute("user");
		String userid = (String)session.getAttribute("userid");
		String shopid = (String)session.getAttribute("shopid");
		String shopname=(String)session.getAttribute("shopname");		
		
		sdb.setUserId(Long.parseLong(userid));
		sdb.setUsername(username);
		sdb.setShopId(Long.parseLong(shopid));
		sdb.setShopName(shopname);		
		
		SupplierDetailsDao sdo = new SupplierDetailsDao();
		sdo.valSupplierDetails(sdb);

	}

	public Map getSupplierDetailsForEdit(String supplierID) {
		
	 	System.out.println("into helper class");
	 	SupplierDetailsDao dao1 = new SupplierDetailsDao();
		List catList = dao1.getAllSupplierSetailsForEdit(supplierID);
		
		Map  map =  new HashMap();
		for(int i=0;i<catList.size();i++)
		{
			Object[] o = (Object[])catList.get(i);
		
			GetSupplierDetails bean = new GetSupplierDetails();
			bean.setDealerName(o[0].toString());
			bean.setCity(o[1].toString());
			bean.setContactNo((BigInteger)o[2]);
			bean.setLandline((BigInteger)o[3]);
			bean.setPersonName(o[4].toString());
			
			bean.setAddress(o[5].toString());
			bean.setEmail(o[6].toString());
			bean.setIdNo(o[7].toString());
			
			bean.setTin(o[8].toString());
			
			map.put(bean.getDealerName(),bean);
		}
		System.out.println("out of helper return map : "+map);
		return map;
	}

	public void editSupplierDetail(HttpServletRequest request,
			HttpServletResponse response) {
	 
		String supplierId = request.getParameter("supplierId");
		
		String dealerName = request.getParameter("dealerName");
		String personName = request.getParameter("personName");
		String contactNo = request.getParameter("contactNo");
		//String salePrice = request.getParameter("salePrice");
		String landline = request.getParameter("landline");
		String emailId = request.getParameter("emailId");
		String city = request.getParameter("city");
		
		String tinNo = request.getParameter("tinNo");
		String address = request.getParameter("address");
		
		//String IdNo = request.getParameter("IdNo");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		
		 hbu = HibernateUtility.getInstance();
		session = hbu.getHibernateSession();
		 transaction = session.beginTransaction();
	
		//long customerId = Long.parseLong(customerId);
		long supplierID =Long.parseLong(supplierId);
		SupplierDetailsBean det = (SupplierDetailsBean) session.get(SupplierDetailsBean.class, supplierID);
		
		det.setDealerName(dealerName);
		det.setAddress(address);
		det.setContactNo(Long.parseLong(contactNo));
		det.setEmailId(emailId);
		det.setCity(city);
		det.setPersonName(personName);
		det.setLandline(Long.parseLong(landline));
		det.setTinNo(tinNo);
		//det.setIdNo(IdNo);
			
	    session.saveOrUpdate(det);
		transaction.commit();
		
		System.out.println("Record updated successfully.");	
	}



public void deleteSupplier(HttpServletRequest request, HttpServletResponse response ) {
	
	String supplier = request.getParameter("supplier");
	   
	SupplierDetailsDao dao2 = new SupplierDetailsDao();
	dao2.deleteSupplier(supplier);
		
	}

public Map getSupName(String fk_sup_id) {
    
	int count=1;
	System.out.println("IN HELPER");
	/*String fk_cat_id = request.getParameter("fk_cat_id");
	
	System.out.println("=== == ==="+fk_cat_id);
	
	
	SubCategoryDetailsBean scdb = new SubCategoryDetailsBean();
	
	scdb.setFk_cat_id(Long.parseLong(fk_cat_id));*/
	
	SupplierDetailsDao cdd = new SupplierDetailsDao();
	List list=cdd.getSupName(fk_sup_id);
	
	System.out.println("list ======"+list.size());
	Map  map =  new HashMap();
	for(int i=0;i<list.size();i++)
	{
		System.out.println("IN HELPER");
		Object[] o = (Object[])list.get(i);
		SupplierDetailsBean bean = new SupplierDetailsBean();
		System.out.println(Arrays.toString(o));
		bean.setSupId(Long.parseLong(o[0].toString()));
		bean.setDealerName(o[1].toString());
		System.out.println("***************"+o[0]);
		map.put(count,bean);
		count++;
	}
	return map;

}

public PoDetailsBean getProductInGridOnSupplierPurchase(
		HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String itemName = request.getParameter("itemName");
	String pono = request.getParameter("pono");
	
	System.out.println("In helper itemname"+itemName);
	System.out.println("In helper pono"+pono);
	
	
	Map<Long,PoDetailsBean> map = new HashMap<Long,PoDetailsBean>();
	
	PoDetailsDao dao = new PoDetailsDao();
	List<PoDetailsBean> catList = dao.getAllProductDetailsForFrtiBillAsPerProductName1(itemName,pono);
	
	PoDetailsBean cs = null;
	if(catList!= null && catList.size() > 0 )
	{	
		cs = (PoDetailsBean)catList.get(0); 
	}
	return cs;
}

// Without PoEntry Details 
public PoDetailsBean1 getProductInGridOnSupplierPurchaseWithOUTPO(
		HttpServletRequest request, HttpServletResponse response) {
	// TODO Auto-generated method stub
	String itemName = request.getParameter("itemName");
	//String pono = request.getParameter("pono");
	
	System.out.println("In helper itemname"+itemName);
	//System.out.println("In helper pono"+pono);
	
	
	Map<Long,PoDetailsBean1> map = new HashMap<Long,PoDetailsBean1>();
	
	PoDetailsDao dao = new PoDetailsDao();
	List<PoDetailsBean1> catList = dao.getAllProductDetailsForFrtiBillAsPerProductName1WithoutPOD(itemName);
	
	PoDetailsBean1 cs = null;
	if(catList!= null && catList.size() > 0 )
	{	
		cs = (PoDetailsBean1)catList.get(0); 
	}
	return cs;
}
}

