package com.Fertilizer.dao;

import java.math.BigInteger;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.jfree.util.Log;

import com.Fertilizer.bean.BillBean;
import com.Fertilizer.bean.CreditCustPaymentDetail;
import com.Fertilizer.bean.SupplierPaymentDetail;
import com.Fertilizer.hibernate.CustomerBillBean1;
import com.Fertilizer.hibernate.SupplierPaymentBean;
import com.Fertilizer.hibernate.VendorPaymentBean;
import com.Fertilizer.utility.HibernateUtility;


public class SupplierPaymentDao {

	public void regSupPayment(VendorPaymentBean bean) {
		
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful");
		} catch (RuntimeException e) {
			
			try {
				transaction.rollback();
			} catch (RuntimeException e2) {
				
				Log.error("Error in regSupPayment", e2);
			}
		}
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
	}
	

	//get latest Transaction number in supplier_payment
		public List getSupplierPaymentTxid() {
			HibernateUtility hbu=null;
			Session session=null;
			List<VendorPaymentBean> Txidlist=null;
			try
			{
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query = session.createSQLQuery("SELECT transaction_id , supplier FROM vendor_payment ORDER BY transaction_id DESC LIMIT 1");

				List<Object[]> list = query.list();
				Txidlist= new ArrayList<VendorPaymentBean>(0);
				for (Object[] object : list) {
					VendorPaymentBean reports = new VendorPaymentBean();
					reports.setTxId(Long.parseLong(object[0].toString()));
					Txidlist.add(reports);	 
				}}
			catch(RuntimeException e)
			{
				Log.error("Error in getCustomerBill()", e);	
			}finally
			{if(session!=null){
				hbu.closeSession(session);	
			}
			}
			return Txidlist;	
		}
	
	
	// add vendor for 
	//add book stock
		public void addVendorDetails(VendorPaymentBean vendorBean) {

			
			HibernateUtility hbu=null;
			Session session=null;
			Transaction transaction=null;
			
			try{
			 hbu = HibernateUtility.getInstance();
			 session = hbu.getHibernateSession();
			 transaction = session.beginTransaction();
			session.save(vendorBean);
			transaction.commit();
			}
			
			catch(RuntimeException e){
				try{
					transaction.rollback();
				}catch(Exception rbe)
				{
					rbe.printStackTrace();
				}	
			}finally{
			hbu.closeSession(session);
			}
			
		
			
		}
	// get Last Bill No 
	public List getLastBillNo() {
		// TODO Auto-generated method stub
		HibernateUtility hbu=null;
		Session session=null;
		List<VendorPaymentBean> saleList=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 String abc ="0.00";
		 Query query = session.createSQLQuery("SELECT bill_no1 ,pk_vendor_payment_id FROM vendor_payment where payment!=:abc ORDER BY pk_vendor_payment_id DESC LIMIT 1");
		query.setParameter("abc", abc);
		 
			List<Object[]> list = query.list();
			 saleList= new ArrayList<VendorPaymentBean>(0);
			for (Object[] object : list) {
				System.out.println(Arrays.toString(object));
				VendorPaymentBean reports = new VendorPaymentBean();
				reports.setBillNo1((object[0].toString()));
				reports.setPkVenPaymentId(Long.parseLong((object[1].toString())));
				
				saleList.add(reports);	 
		}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}finally
		{if(session!=null){
			session.close();	
		}
		}
		return saleList;
	}
public void regvendorPayment(VendorPaymentBean bean) {
		
		System.out.println("In DAO");
		
		HibernateUtility hbu=null;
		Session session = null;
		Transaction transaction = null;
		try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				 transaction = session.beginTransaction();
	
				 System.out.println("Tx started");
				session.save(bean);
				transaction.commit();
				System.out.println("Successful");
		}
		
		catch(RuntimeException e){
			e.printStackTrace();
			try{
				transaction.rollback();
			}catch(RuntimeException rbe)
			{
				Log.error("Couldn't roll back tranaction",rbe);
			}	
		}finally{
		hbu.closeSession(session);
		}

		
	}
	
	
	
	//get 
	//get vendor payment 
	public List getAllvendorEntry1(String bookName, String authorName, String publisherName) {
		HibernateUtility hbu=null;
		Session session=null;
		List list=null;
		try{
		 hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		
		 Query query = session.createQuery("from BookStockHibernate where bookName='"+bookName+"' AND authorName='"+authorName+"' AND publisherName='"+publisherName+"'");
		/* query.setParameter("bookName", bookName);
		 query.setParameter("authorName", authorName);
		 query.setParameter("publisherName", publisherName);*/
		 System.out.println("query ======"+query);
		 list = query.list();
		}
			catch(Exception e){	
				e.printStackTrace();
		}
			finally
			{
					if(session!=null){
					hbu.closeSession(session);
				}
			}
		
	return list;
	
	}
	
	// vendor wise
	public void regSupPayment1(VendorPaymentBean bean) {
		
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful");
		} catch (RuntimeException e) {
			
			try {
				transaction.rollback();
			} catch (RuntimeException e2) {
				
				Log.error("Error in regSupPayment", e2);
			}
		}
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
	}
	
	//get book stock
			public List getAllVendorEntry1(String supplier,  String supplier1) {
				HibernateUtility hbu=null;
				Session session=null;
				List list=null;
				try{
				 hbu = HibernateUtility.getInstance();
				 session = hbu.getHibernateSession();
				String abc ="0.00";
				String pay ="credit";
				 Query query = session.createSQLQuery("from VendorPaymentBean where supplier=:supplier AND  fk_supplier_id=:supplier1 ");
				 
				query.setParameter("supplier", supplier);
				 /*query.setParameter("abc", abc);
				 query.setParameter("pay", pay);*/
				 System.out.println("query hi this kishor 45*********** ======"+query);
				 list = query.list();
				}
					catch(Exception e){	
						e.printStackTrace();
				}
					finally
					{
							if(session!=null){
							hbu.closeSession(session);
						}
					}
				
			return list;
			
			}
	
	// supplier vendor wise 
public void regSupPaymentv(VendorPaymentBean bean) {
		
		HibernateUtility hbu   = null;
		Session session =null;
		Transaction transaction = null;
		try {
			hbu = HibernateUtility.getInstance();
			session = hbu.getHibernateSession();
			transaction = session.beginTransaction();
			 session.save(bean);
			 transaction.commit();
			 System.out.println("Successful");
		} catch (RuntimeException e) {
			
			try {
				transaction.rollback();
			} catch (RuntimeException e2) {
				
				Log.error("Error in regSupPayment", e2);
			}
		}
		finally
		{
			if (session!=null) {
				hbu.closeSession(session);
			}
		}
		
	}

	//Supplier Payment details for single date
	public List<SupplierPaymentDetail> getCreditCustPaymentDetailsForSingleDate(
			String fDate) {
		
		HibernateUtility hbu=null;
		Session session=null;
		List<SupplierPaymentDetail> supplierList = null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("select sp.supplier, sp.bill_no, sp.total_amount, sp.balance, sp.payment, sp.payment_mode,sp.person_name,sp.paymentType,sp.insert_date,sp.tds_details,sp.debit_Amount FROM  vendor_payment sp  WHERE DATE(insert_date)=:isInsertDate and payment !='0.00'");
			query.setParameter("isInsertDate", fDate);
			List<Object[]> list = query.list();
			supplierList = new ArrayList<SupplierPaymentDetail>(0);
			
			
			for (Object[] object : list) {
				
				SupplierPaymentDetail reports = new SupplierPaymentDetail();
				String paymentType = object[7].toString();
				reports.setSupplierName(object[0].toString());
				/*reports.setBillNo((BigInteger)object[1]);*/
				reports.setBillno1((object[1].toString()));
				reports.setTotalAmount(Double.parseDouble(object[2].toString()));
				reports.setBalanceAmount(Double.parseDouble(object[3].toString()));
				//reports.setPaymentAmount(Double.parseDouble(object[4].toString()));
				 if(paymentType.equals("credit")){
				    	reports.setCreditAmount(Double.parseDouble(object[4].toString()));
				    	reports.setDebitAmount(0.0);
				    }
				    else if(paymentType.equals("debit")){
				    	reports.setDebitAmount(Double.parseDouble(object[4].toString()));
				    	reports.setCreditAmount(0.0);
				    }
			    reports.setPaymentMode(object[5].toString());
			    reports.setAccountantName(object[6].toString());
				//reports.setPaymentType(object[7].toString());
			    reports.setPaymentDate(object[8].toString());
			    reports.setTdsdetail(object[9].toString());
			    reports.setDebitAmount(Double.parseDouble(object[10].toString()));
			    supplierList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return supplierList;	
	
	
		
	}

	//Supplier Payment Details between two dates
	public List<SupplierPaymentDetail> getSupplierDetailsDateWise(String fDate,
			String tDate,String fkSupplierId) {


		System.out.println(fDate+"first Date In dao");
		System.out.println(tDate+"Second Date In dao");
		System.out.println(fkSupplierId+"fkSupplierId  In dao");
		HibernateUtility hbu=null;
		Session session=null;
		List<SupplierPaymentDetail> sup1List=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query2 = session.createSQLQuery("select p.supplier, p.bill_no, p.total_amount, p.balance, p.payment, p.payment_mode,p.person_name,p.paymentType,p.insert_date,p.tds_details,p.debit_Amount FROM  vendor_payment p  WHERE p.supplier='"+fkSupplierId+"'AND payment!='0.00' AND p.insert_date BETWEEN '"+fDate+"' AND '"+tDate+"'");
			/*query2.setParameter("fDate", fDate);
	        query2.setParameter("edDate", tDate);
	        query2.setParameter("fkSupplierId", fkSupplierId);*/
	        List<Object[]> list = query2.list();
	        sup1List= new ArrayList<SupplierPaymentDetail>(0);
	        System.out.println("IN DAO"+list);
			
			
			for (Object[] object : list) {
				
				SupplierPaymentDetail reports = new SupplierPaymentDetail();
				String paymentType = object[7].toString();
				reports.setSupplierName(object[0].toString());
				/*reports.setBillNo((BigInteger)object[1]);*/
				reports.setBillno1(object[1].toString());
				reports.setTotalAmount(Double.parseDouble(object[2].toString()));
				reports.setBalanceAmount(Double.parseDouble(object[3].toString()));
				//reports.setPaymentAmount(Double.parseDouble(object[4].toString()));
				//reports.setCredit(Double.parseDouble(object[4].toString()));
				if(paymentType.equals("credit")){
			    	reports.setCreditAmount(Double.parseDouble(object[4].toString()));
			    	reports.setDebitAmount(0.0);
			    }
			    else if(paymentType.equals("debit")){
			    	reports.setDebitAmount(Double.parseDouble(object[4].toString()));
			    	reports.setCreditAmount(0.0);
			    }
				System.out.println("hi this is kishor ==============++++++++111111111111 "+object[4].toString());
			    reports.setPaymentMode(object[5].toString());
			    reports.setAccountantName(object[6].toString());
				//reports.setPaymentType(object[7].toString());
			    reports.setPaymentDate(object[8].toString());
			    reports.setTdsdetail(object[9].toString());
			    System.out.println("hi this is kishor ************++++++++++++ "+object[9].toString());
			    reports.setDebitAmount1(Double.parseDouble(object[10].toString()));
			    System.out.println("hi this is kishor ++++++++++++ "+object[10].toString());
			    sup1List.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sup1List;
		
	
	
	}
	
	//Vendor Payment Wise 
	public List<SupplierPaymentBean> getVendorDetailsDateWise(String fDate,
			String tDate,String fkSupplierId) {


		System.out.println(fDate+"first Date In dao");
		System.out.println(tDate+"Second Date In dao");
		System.out.println(fkSupplierId+"fkSupplierId  In dao");
		HibernateUtility hbu=null;
		Session session=null;
		List<SupplierPaymentBean> sup1List=null;
		try
		{
			hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query2 = session.createSQLQuery("SELECT bill_no,supplier,insert_date,total_amount,payment,balance,tds_details,debit_Amount FROM vendor_payment where supplier=:fkSupplierId and payment !=0 ");
			/*query2.setParameter("fDate", fDate);
	        query2.setParameter("edDate", tDate);*/
	        query2.setParameter("fkSupplierId", fkSupplierId);
	        List<Object[]> list = query2.list();
	        sup1List= new ArrayList<SupplierPaymentBean>(0);
	        System.out.println("IN DAO"+list);
			
			
			for (Object[] object : list) {
				
				SupplierPaymentBean reports = new SupplierPaymentBean();
				//String paymentType = object[5].toString();
				reports.setBillno1((((object[0].toString()))));
				System.out.println("Bill no+++++++"+object[0]);
				reports.setSupplier((object[1].toString()));
				System.out.println("Bill no+++++++"+object[1]);
				
	           Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(object[2].toString()); 
				
				reports.setInsertDate(date1);
				System.out.println("Bill no+++++++"+object[2]);
				reports.setTotalAmount(Double.parseDouble(object[3].toString()));
				System.out.println("Bill no+++++++"+object[3]);
				reports.setPayment((Double.parseDouble(object[4].toString())));
				System.out.println("Bill no+++++++"+object[4]);
				reports.setBalance(Double.parseDouble(object[5].toString()));
				System.out.println("Bill no+++++++"+object[5]);
				reports.setTdsdetails((object[6].toString()));
				reports.setDebitAmount((object[7].toString()));
			
			    sup1List.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return sup1List;
		
	
	
	}
	

	public List<VendorPaymentBean> getCreditCustPaymentDetailsAsBill(
			String billNo1, String fkSupplierId) {

		System.out.println(" hit his is ++++++++++"+billNo1);

		System.out.println(" hit his is ++++++++++"+fkSupplierId);
		HibernateUtility hbu=null;
		Session session=null;
		List<VendorPaymentBean> supplierList = null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 Query query = session.createSQLQuery("select p.supplier, p.bill_no, p.total_amount, p.balance, p.payment, p.payment_mode, p.person_name , p.paymentType,p.insert_date,p.tds_details,p.debit_Amount   FROM  vendor_payment p  WHERE p.bill_no =:billNumber And p.fk_supplier_id=:fkSupplierId and payment !='0.00'");
			query.setParameter("billNumber", billNo1);
			query.setParameter("fkSupplierId", fkSupplierId);
			
			
			List<Object[]> list = query.list();
			supplierList = new ArrayList<VendorPaymentBean>(0);
			
			
			for (Object[] object : list) {
				
				VendorPaymentBean reports = new VendorPaymentBean();
				String paymentType = object[7].toString();
				
				reports.setSupplier(object[0].toString());
				reports.setBillNo1((((object[1].toString()))));
				reports.setTotalAmount(Double.parseDouble(object[2].toString()));
				reports.setBalanceAmountv(Double.parseDouble(object[3].toString()));
				reports.setCredit(Double.parseDouble(object[4].toString()));
				/* if(paymentType.equals("credit")){
				    	reports.setCredit(Double.parseDouble(object[4].toString()));
				    	reports.setDebitAmount("0.0");
				    }
				    else if(paymentType.equals("debit")){
				    	reports.setDebitAmount((object[4].toString()));
				    	reports.setCreditAmount(0.0);
				    }*/
				//reports.setPaymentAmount(Double.parseDouble(object[4].toString()));
			    reports.setPaymentMode(object[5].toString());
			    reports.setPersonname(object[6].toString());
			    reports.setInsertDate1(object[8].toString());
			    reports.setTdsdetails((object[9].toString()));
			    reports.setDebitAmount((object[10].toString()));
			   // reports.setPaymentType(object[7].toString());
				
			    supplierList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return supplierList;	
	
	
		
	
	}

	public List<SupplierPaymentDetail> getCreditCustPaymentDetailsAsBill(String fkSupplierId) {

		
		HibernateUtility hbu=null;
		Session session=null;
		List<SupplierPaymentDetail> supplierList = null;
		try
		{
				hbu = HibernateUtility.getInstance();
		 session = hbu.getHibernateSession();
		 double abc =0.00;
		 Query query = session.createSQLQuery("select sp.supplier, sp.bill_no, sp.total_amount, sp.balance,sp.paymentType,sp.payment_mode,sp.person_name, sp.payment,sp.insert_date,sp.tds_details,sp.debit_Amount FROM  vendor_payment sp  WHERE sp.fk_supplier_id=:fkSupplierId and  payment !=:abc");
			query.setParameter("fkSupplierId", fkSupplierId);
			query.setParameter("abc", abc);
			List<Object[]> list = query.list();
			supplierList = new ArrayList<SupplierPaymentDetail>(0);
			
			
			for (Object[] object : list) {
				
				SupplierPaymentDetail reports = new SupplierPaymentDetail();
				String paymentType = object[4].toString();
				
				reports.setSupplierName(object[0].toString());
				System.out.println("hi this is kishor============================================++++ "+object[0].toString());
				/*reports.setBillNo((BigInteger)object[1]);*/
				reports.setBillno1((object[1].toString()));
				reports.setTotalAmount(Double.parseDouble(object[2].toString()));
				reports.setBalanceAmount(Double.parseDouble(object[3].toString()));
				//reports.setPaymentType(object[4].toString());
			    reports.setPaymentMode(object[5].toString());
			    reports.setAccountantName(object[6].toString());
			    if(paymentType.equals("credit")){
			    	reports.setCreditAmount(Double.parseDouble(object[7].toString()));
			    	reports.setDebitAmount(0.0);
			    }
			    else if(paymentType.equals("debit")){
			    	reports.setDebitAmount(Double.parseDouble(object[7].toString()));
			    	reports.setCreditAmount(0.0);
			    }
				//reports.setPaymentAmount(Double.parseDouble(object[7].toString()));
			    reports.setPaymentDate(object[8].toString());
			    reports.setTdsdetail(object[9].toString());
			    reports.setDebitAmount(Double.parseDouble(object[10].toString()));
			    supplierList.add(reports); 
		
			}}
		catch(Exception e)
		{
			e.printStackTrace();	
		}
		return supplierList;	
	
	
		
	
	}
	
	
	// Supplier payment details for report
		public List getSupplierPaymentDetailForReport(){
		    HibernateUtility hbu=null;
		    Session session=null;
		    List<SupplierPaymentDetail> productList=null;
		    try
		    {
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query=session.createSQLQuery("SELECT p.supplier, p.bill_no, p.total_amount, p.balance, p.paymentType, p.payment, p.payment_mode,p.person_name,p.tds_details,p.debit_Amount FROM vendor_payment p  WHERE payment !='0.00' ;");
				List<Object[]> list = query.list();
				productList= new ArrayList<SupplierPaymentDetail>(0);	
			for (Object[] o : list) {
				System.out.println(Arrays.toString(o));
				
				SupplierPaymentDetail reports = new SupplierPaymentDetail();
				String paymentType = o[4].toString();
				reports.setSupplierName(o[0].toString());
				/*reports.setBillNo((BigInteger)o[1]);*/
				reports.setBillno1((o[1].toString()));
				reports.setTotalAmount(Double.parseDouble(o[2].toString()));
				reports.setBalanceAmount(Double.parseDouble(o[3].toString()));
				//reports.setPaymentType(o[4].toString());
				//reports.setPaymentAmount(Double.parseDouble(o[5].toString()));
				 if(paymentType.equals("credit")){
				    	reports.setCreditAmount(Double.parseDouble(o[5].toString()));
				    	reports.setDebitAmount(0.0);
				    }
				    else if(paymentType.equals("debit")){
				    	reports.setDebitAmount(Double.parseDouble(o[5].toString()));
				    	reports.setCreditAmount(0.0);
				    }
				reports.setPaymentMode(o[6].toString());
				reports.setAccountantName(o[7].toString());
				reports.setTdsdetail(o[8].toString());
				reports.setDebitAmount(Double.parseDouble((o[9].toString())));
				
				productList.add(reports);		
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 finally
		{
		
		if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return productList;
	}
	
		// Payment Due Date Details for Report
		public List getPurchaseDueDatesDetailsForReport(){

		    HibernateUtility hbu=null;
		    Session session=null;
		    List<SupplierPaymentDetail> productList=null;
		    try
		    {
				 SimpleDateFormat dateFormat1 = new SimpleDateFormat("yyyyMMdd");
					Date dateobj = new Date();
					String todayDate = dateFormat1.format(dateobj);
				hbu = HibernateUtility.getInstance();
				session = hbu.getHibernateSession();
				Query query=session.createSQLQuery("SELECT s.supplier_name, gross_total,purchaseDate,dueDate FROM goods_receive LEFT JOIN supplier_details s on s.pk_supplier_id = fk_supplier_id WHERE DATEDIFF(dueDate,'"+todayDate+"')<=5 AND DATEDIFF(dueDate,'"+todayDate+"')>0");
				List<Object[]> list = query.list();
				productList= new ArrayList<SupplierPaymentDetail>(0);	
			for (Object[] o : list) {
				System.out.println(Arrays.toString(o));
				
				SupplierPaymentDetail reports = new SupplierPaymentDetail();
				reports.setSupplierName(o[0].toString());
				reports.setTotalAmount(Double.parseDouble(o[1].toString()));
				reports.setPaymentDate(o[2].toString());
				reports.setDueDate(o[3].toString());
				
				productList.add(reports);		
		}}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		 finally
		{
		
		if(session!=null){
			hbu.closeSession(session);	
		}
		}
		return productList;
	
		}
}
